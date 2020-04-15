--===============================================================================================================================================================================
--RN-001 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_TeoriaAntesQuePractica
    AFTER INSERT OR UPDATE OF DNIAlumno ON Clases
    FOR EACH ROW
        DECLARE
        t_Calificacion VARCHAR2(8);
        t_fecha DATE;
        t_DNI VARCHAR2(9) := :NEW.DNIAlumno;
        
    BEGIN
        SELECT MAX(Et.Fecha) INTO t_fecha FROM ExamenesTeoricos ET WHERE et.alumno=t_dni;
        SELECT et.calificacion INTO t_calificacion FROM ExamenesTeoricos ET WHERE ET.fecha = t_fecha AND et.alumno=t_dni;
            
        IF UPPER(t_Calificacion) LIKE '%NO%' OR t_Calificacion IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Un alumno que aún se encuentre en preparación para el examen teórico no pueda comenzar con las clases prácticas');
        END IF;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20001, 'Un alumno que aún se encuentre en preparación para el examen teórico no pueda comenzar con las clases prácticas');

    END;
/

--===============================================================================================================================================================================
--RN-002 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_NoDosPermisos
    AFTER INSERT ON Matriculas
    FOR EACH ROW
        DECLARE
         PRAGMA AUTONOMOUS_TRANSACTION;
         t_DNI VARCHAR2(9) := :NEW.Alumno;
         t_UltimoExamen VARCHAR2(10);
         t_NotaUltimoExamen VARCHAR2(8);
         t_CuentaM NUMBER;
    
    BEGIN     
         SELECT OID_EPC INTO t_UltimoExamen FROM(SELECT OID_EPC FROM ExamenesPracticoCirculacion EPC WHERE Alumno=t_DNI ORDER BY FECHA DESC) WHERE ROWNUM=1;
         SELECT EPC.Calificacion INTO t_NotaUltimoExamen FROM ExamenesPracticoCirculacion EPC WHERE EPC.OID_EPC=t_UltimoExamen;
         EXCEPTION WHEN NO_DATA_FOUND THEN t_NotaUltimoExamen:=null;
         
         SELECT COUNT(Alumno) INTO t_CuentaM FROM MATRICULAS WHERE Alumno = t_DNI;
      
         IF t_CuentaM>0 AND (t_NotaUltimoExamen IS NULL OR t_NotaUltimoExamen NOT LIKE 'Apto') THEN 
            raise_application_error(-20002,'Un alumno no puede matricularse en 2 permisos al mismo tiempo');
         END IF;
    END;
/

CREATE OR REPLACE TRIGGER TR_NoClasesOtroPermiso
    AFTER INSERT OR UPDATE OF TipoPermiso ON Clases
    FOR EACH ROW
        DECLARE         
         t_DNI VARCHAR2(9) := :NEW.DNIAlumno;
         t_TipoPermiso VARCHAR2(10) := :NEW.TipoPermiso;
         t_Permiso VARCHAR2(10);
    
    BEGIN     
         SELECT * INTO t_Permiso FROM(SELECT M.PermisoMatriculado FROM Matriculas M WHERE t_DNI=M.Alumno ORDER BY M.Fecha DESC) WHERE ROWNUM=1;
       
         IF t_TipoPermiso NOT LIKE t_Permiso THEN 
            raise_application_error(-20003,'Un alumno matriculado en un permiso no puede dar clases del otro permiso');
         END IF;
         
         EXCEPTION WHEN NO_DATA_FOUND THEN raise_application_error(-20080,'Alumno no matriculado');    
    END;
/


--===============================================================================================================================================================================
--RN-003 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_Caducador
    AFTER LOGON ON SCHEMA 
    BEGIN
        DELETE FROM ACCESOWEB WHERE FECHACADUCIDAD<=SYSDATE;
    END;
/
CREATE OR REPLACE TRIGGER TR_FechaRenovacionWT
    AFTER UPDATE OF AccesoWeb ON Alumnos    
    FOR EACH ROW
    DECLARE
         t_AccesoWeb VARCHAR2(9) := :NEW.AccesoWeb;
         t_AccesoCaduca VARCHAR2(9) := :OLD.AccesoWeb;
         t_Web Number;
    BEGIN
        SELECT OID_W INTO t_Web FROM WEBTESTS Where Estado = 'Online' AND ROWNUM =1;
        
        IF t_AccesoWeb IS NULL THEN dbms_output.put_line('      El acceso web '||t_AccesoCaduca||' ha caducado');
        ELSE            
            INSERT INTO ACCESOWEB(USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,WEB) VALUES (t_AccesoWeb,DBMS_RANDOM.STRING('x',12),SYSDATE,SYSDATE+61,t_web);
        END IF;
    END;
/
--===============================================================================================================================================================================
--RN-004 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_MinimoClasePC
    AFTER INSERT OR UPDATE OF Alumno ON ExamenesPracticoCirculacion
    FOR EACH ROW
    DECLARE
        t_clasesDadas NUMBER;
        t_DNI VARCHAR2(9) := :NEW.Alumno;
         
    BEGIN
         SELECT COUNT(*) INTO t_ClasesDadas FROM CLASES C WHERE DNIALUMNO = t_DNI AND UPPER(TIPOCLASE) LIKE '%CIRCULA%';
         
         IF(t_clasesDadas<1) THEN 
            raise_application_error(-20004,'Para presentarse al Examen Practico es necesario haber dado minimo 1 Clase Practica');
         END IF;
    END;
/
--=======================================================
CREATE OR REPLACE TRIGGER TR_MinimoClasePP
    AFTER INSERT OR UPDATE OF Alumno ON ExamenesPracticoPista
    FOR EACH ROW
    DECLARE
        t_clasesDadas NUMBER;
        t_DNI VARCHAR2(9) := :NEW.Alumno;
        
    BEGIN        
         SELECT COUNT(*) INTO t_clasesDadas FROM CLASES C WHERE DNIALUMNO = t_DNI AND TIPOPERMISO = 'Permiso A2' AND UPPER(TIPOCLASE) LIKE '%PISTA%';
         
         IF(t_clasesDadas<1) THEN 
             raise_application_error(-20004,'Para presentarse al Examen Practico es necesario haber dado minimo 1 Clase Practica');
         END IF;
    END;
/
--===============================================================================================================================================================================
--RN-005 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_PresentacionExamenT
    BEFORE INSERT ON ExamenesTeoricos
    FOR EACH ROW
    DECLARE
        PRAGMA AUTONOMOUS_TRANSACTION;    
         t_DNIAlumno VARCHAR2(9):= :NEW.Alumno;
         t_fechaN DATE := :NEW.FECHA;
         t_fechaV DATE;
     
    BEGIN          
        SELECT FECHA INTO t_fechaV FROM(SELECT FECHA FROM ExamenesTeoricos WHERE t_DNIAlumno=ALUMNO ORDER BY fecha DESC) WHERE ROWNUM=1;      
        
        IF (TRUNC(t_fechaN) - TRUNC(t_fechaV))<15 THEN
            raise_application_error(-20005,'Tiene que esperar minimo 15 dias para volver a examinarse');        
        END IF;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN COMMIT;
    END;
/
--=======================================================================
CREATE OR REPLACE TRIGGER TR_PresentacionExamenPC
    BEFORE INSERT ON ExamenesPracticoCirculacion
    FOR EACH ROW
    DECLARE
        PRAGMA AUTONOMOUS_TRANSACTION;    
         t_DNIAlumno VARCHAR2(9):= :NEW.Alumno;
         t_fechaN DATE := :NEW.FECHA;
         t_fechaV DATE;
     
    BEGIN          
        SELECT FECHA INTO t_fechaV FROM(SELECT FECHA FROM ExamenesPracticoCirculacion WHERE t_DNIAlumno=ALUMNO ORDER BY fecha DESC) WHERE ROWNUM=1;      
        
        IF (TRUNC(t_fechaN) - TRUNC(t_fechaV))<15 THEN
            raise_application_error(-20005,'Tiene que esperar minimo 15 dias para volver a examinarse');        
        END IF;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN COMMIT;
    END;
/
--============================================================================
CREATE OR REPLACE TRIGGER TR_PresentacionExamenPP
    BEFORE INSERT ON ExamenesPracticoPista
    FOR EACH ROW
    DECLARE
        PRAGMA AUTONOMOUS_TRANSACTION;    
         t_DNIAlumno VARCHAR2(9):= :NEW.Alumno;
         t_fechaN DATE := :NEW.FECHA;
         t_fechaV DATE;
     
    BEGIN          
        SELECT FECHA INTO t_fechaV FROM(SELECT FECHA FROM ExamenesPracticoPista WHERE t_DNIAlumno=ALUMNO ORDER BY fecha DESC) WHERE ROWNUM=1;      
        
        IF (TRUNC(t_fechaN) - TRUNC(t_fechaV))<15 THEN
            raise_application_error(-20005,'Tiene que esperar minimo 15 dias para volver a examinarse');        
        END IF;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN COMMIT;
    END;
/
--===============================================================================================================================================================================
--RN-006 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_MayorDeEdad
    AFTER INSERT OR UPDATE OF FechaNacimiento ON Alumnos
    FOR EACH ROW
    DECLARE
        t_edad NUMBER:= (SYSDATE - :NEW.FechaNacimiento) /365.25;
    BEGIN
        IF(t_edad < 18) THEN raise_application_error(-20006,' Los matriculados deben ser mayor de edad, es decir, mayores de 18 años');
        END IF;
    END;
/
--===============================================================================================================================================================================
--RN-008 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_DuracionClasesSD
    AFTER INSERT OR UPDATE OF HoraInicio,HoraFin,TipoClase ON Clases
    FOR EACH ROW
    DECLARE    
         t_HoraInicio VARCHAR2(5) := :NEW.HoraInicio;
         t_HoraFin VARCHAR2(5) := :NEW.HoraFin;
        
         t_TipoClase VARCHAR2(20) := :NEW.TipoClase;
         
         t_HoraMinI DATE;
         t_HoraMinF DATE;     
    BEGIN    
         SELECT TO_DATE(t_HoraInicio,'HH24:MI') INTO t_HoraMinI FROM DUAL;
         SELECT TO_DATE(t_HoraFin, 'HH24:MI') INTO t_HoraMinF FROM DUAL;
               
         IF t_TipoClase LIKE '%Doble%' AND ROUND((t_HoraMinF-t_HoraMinI)*24*60,2)!=80 THEN
            raise_application_error(-20008,'Las clases simples deben durar 40 minutos y las dobles 1 hora y 20 minutos');
         
         ELSIF t_TipoClase LIKE '%Simple%' AND ROUND((t_HoraMinF-t_HoraMinI)*24*60,2)!=40 THEN
            raise_application_error(-20008,'Las clases simples deben durar 40 minutos y las dobles 1 hora y 20 minutos');
         END IF;
     
    END;
/
--===============================================================================================================================================================================
--RN-009 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_PrecioClases
    AFTER INSERT OR UPDATE OF PagoClase,TipoClase ON Clases
    FOR EACH ROW
    DECLARE
         t_tipoClaseN VARCHAR2(20) := :NEW.TipoClase;
         t_PagoClase NUMBER := :NEW.PagoClase;
         t_PrecioClase NUMBER;         
    BEGIN
        SELECT PC.Importe/PC.Cantidad INTO t_PrecioClase FROM PagoClases PC WHERE pc.oid_pac=t_PagoClase;
        
        IF t_tipoClaseN LIKE '%Simple%' AND t_PrecioClase>=38 THEN
            raise_application_error(-20009,'No se puede asociar un pago de clases dobles a clases simples');            
        ELSIF t_tipoClaseN LIKE '%Doble%' AND t_PrecioClase<38 THEN
            raise_application_error(-20010,'No se puede asociar un pago de clases simples a clases dobles');        
        END IF;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN BEGIN t_tipoClaseN := 'Simple'; t_PrecioClase := 38; END;
    END;
/  
--===============================================================================================================================================================================
--RN-010 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_PreferenciaClases
    BEFORE INSERT ON CLASES
    FOR EACH ROW
    DECLARE
        t_DNI VARCHAR2(9) := :NEW.DNIALUMNO;
        t_TIPOCLASE VARCHAR2(20) := :NEW.TIPOCLASE;
        CURSOR C IS
            SELECT * FROM EXAMENESPRACTICOCIRCULACION LEFT JOIN ALUMNOS ON ALUMNO = DNI WHERE CALIFICACION IS NULL;
        CURSOR C1 IS
            SELECT * FROM EXAMENESPRACTICOPISTA LEFT JOIN ALUMNOS ON ALUMNO = DNI WHERE CALIFICACION IS NULL;
    BEGIN
        IF t_TIPOCLASE LIKE '%pista%' THEN
            FOR FILA IN C1 LOOP
                EXIT WHEN C1%NOTFOUND;
                IF FILA.ALUMNO IS NOT NULL AND FILA.ALUMNO NOT LIKE t_DNI THEN
                    dbms_output.put_line('      '||FILA.NOMBRE||' '||FILA.APELLIDOS||' se presentará proximamente al examen práctico, téngalo en cuenta');
                END IF;
            END LOOP;
        ELSE
            FOR FILA IN C LOOP
                EXIT WHEN C%NOTFOUND;
                IF FILA.ALUMNO IS NOT NULL AND FILA.ALUMNO NOT LIKE t_DNI THEN
                    dbms_output.put_line('      '||FILA.NOMBRE||' '||FILA.APELLIDOS||' se presentará proximamente al examen práctico, téngalo en cuenta');
                END IF;
            END LOOP;
        END IF;
    END;
/
--===============================================================================================================================================================================
--RN-011 TERMINADO =============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_DistanciaEntreClases
    AFTER INSERT OR UPDATE OF Fecha,DNIAlumno ON Clases
    FOR EACH ROW
    DECLARE
         PRAGMA AUTONOMOUS_TRANSACTION;
         t_fechaN DATE := :NEW.Fecha;
         t_DNIAlumno VARCHAR2(9):= :NEW.DNIAlumno;
         CURSOR C IS
            SELECT NOMBRE,APELLIDOS,F,DNIALUMNO FROM (SELECT MAX(FECHA)F,DNIALUMNO FROM CLASES GROUP BY DNIALUMNO) LEFT JOIN ALUMNOS A ON DNIALUMNO=DNI;
    BEGIN
        FOR FILA IN C LOOP
             IF (t_fechaN - FILA.F)>15 AND FILA.DNIALUMNO NOT LIKE t_DNIALUMNO THEN 
                dbms_output.put_line('      '||FILA.NOMBRE||' '||FILA.APELLIDOS||' lleva más de 15 días sin dar clase, debe dar una clase lo más pronto posible');
             END IF;
        END LOOP;
         
        EXCEPTION WHEN NO_DATA_FOUND THEN COMMIT; --Si no hay clases entonces se añade sin problemas
    END;
/
--===============================================================================================================================================================================
--RN-012 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_ReconocimientoMedicoPC
    AFTER INSERT OR UPDATE OF Alumno ON ExamenesPracticoCirculacion
    FOR EACH ROW
    DECLARE
         t_DNI VARCHAR2(9) := :NEW.Alumno;
         t_RecMedico VARCHAR2(9);
      
    BEGIN
         SELECT A.ReconocimientoMedico INTO t_RecMedico FROM Alumnos A WHERE A.DNI=t_DNI; 
        
         IF t_RecMedico NOT LIKE 'Valido' OR t_RecMedico IS NULL THEN
            raise_application_error(-20013,'Para presentarse a un examen practico es necesario un reconocimiento medico!!');
         END IF;
    END;
/
--=============================================================    
CREATE OR REPLACE TRIGGER TR_ReconocimientoMedicoPP
    AFTER INSERT OR UPDATE OF Alumno ON ExamenesPracticoPista
    FOR EACH ROW
    DECLARE
        t_DNI VARCHAR2(9) := :NEW.Alumno;
        t_RecMedico VARCHAR2(9);
      
    BEGIN
        SELECT A.ReconocimientoMedico INTO t_RecMedico FROM Alumnos A WHERE A.DNI=t_DNI; 
    
        IF t_RecMedico NOT LIKE 'Valido' OR t_RecMedico IS NULL THEN
            raise_application_error(-20013,'Para presentarse a un examen practico es necesario un reconocimiento medico!!');
         END IF;
    END;
/
--===============================================================================================================================================================================
--RN-013 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_FechaRenyCad
    AFTER INSERT OR UPDATE OF FechaRenovacion,FechaCaducidad ON AccesoWeb
    FOR EACH ROW
    DECLARE
         t_fechaRenovacion DATE := :NEW.FechaRenovacion;
         t_fechaCaducidad DATE := :NEW.FechaCaducidad;
      
    BEGIN
         IF t_fechaCaducidad<t_fechaRenovacion THEN
            raise_application_error(-20014,'La fecha de caducidad no puede ser anterior a la fecha de renovacion');
         END IF;
    END;
/
--===============================================================================================================================================================================
--RN-014 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_EstadoTurismos
    AFTER UPDATE OF Estado ON Turismos
    FOR EACH ROW
    DECLARE
         t_Estado VARCHAR2(15) := :NEW.Estado;
         t_Matricula VARCHAR2(8) := :OLD.Matricula;
         t_HoraMinutosSYS VARCHAR2(5);
    
    BEGIN     
         SELECT TO_CHAR(sysdate,'HH24:MI') INTO t_HoraMinutosSYS FROM DUAL;       
         
         IF t_Estado NOT LIKE 'ListoParaSuUso' THEN     
            DBMS_OUTPUT.PUT_LINE('      ATENCION: ESTE VEHICULO NO ESTARA DISPONIBLE PARA LAS CLASES A PARTIR DE LAS ' || t_HoraMinutosSYS);
            DELETE FROM CLASES WHERE TO_DATE(TO_CHAR(FECHA),'DD/MM/YYYY') = TO_DATE(TO_CHAR(SYSDATE),'DD/MM/YYYY') 
                                AND TO_DATE(HORAINICIO,'HH24:MI')>TO_DATE(t_HoraMinutosSYS,'HH24:MI') AND TIPOPERMISO = 'Permiso B'
                                AND DNIALUMNO IN (Select ALUMNO FROM AlumnoConduceTurismos RIGHT JOIN CLASES ON DNIALUMNO = ALUMNO WHERE TURISMO=t_Matricula);
        END IF;
    END;
/
--======================================================================================
CREATE OR REPLACE TRIGGER TR_EstadoMotocicletas
 AFTER UPDATE OF Estado ON Motocicletas
    FOR EACH ROW
    DECLARE
         t_Estado VARCHAR2(15) := :NEW.Estado;
         t_Matricula VARCHAR2(8) := :OLD.Matricula;
         t_HoraMinutosSYS VARCHAR2(5);
    
    BEGIN     
         SELECT TO_CHAR(sysdate,'HH24:MI') INTO t_HoraMinutosSYS FROM DUAL;       
         
         IF t_Estado NOT LIKE 'ListoParaSuUso' THEN     
            DBMS_OUTPUT.PUT_LINE('      ATENCION: ESTE VEHICULO NO ESTARA DISPONIBLE PARA LAS CLASES A PARTIR DE LAS ' || t_HoraMinutosSYS);
            DELETE FROM CLASES WHERE TO_DATE(TO_CHAR(FECHA),'DD/MM/YYYY') = TO_DATE(TO_CHAR(SYSDATE),'DD/MM/YYYY') 
                                AND TO_DATE(HORAINICIO,'HH24:MI')>TO_DATE(t_HoraMinutosSYS,'HH24:MI') AND TIPOPERMISO = 'Permiso A2'
                                AND DNIALUMNO IN (Select ALUMNO FROM AlumnoConduceTurismos RIGHT JOIN CLASES ON DNIALUMNO = ALUMNO WHERE TURISMO=t_Matricula);
        END IF;
    END;
/
--===============================================================================================================================================================================
--RN-015 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_ITVTRevision
    AFTER INSERT ON ITVTurismos
    FOR EACH ROW
    DECLARE
     t_Revision VARCHAR2(15) := :NEW.Revision;
     t_Matricula VARCHAR2(8) := :NEW.Turismo;       
    BEGIN       
         IF t_Revision NOT LIKE 'Favorable' THEN        
            DBMS_OUTPUT.PUT_LINE('      ATENCION: EL VEHICULO DEBE PASAR LA ITV ANTES DE PODER SER USADO');
            UPDATE Turismos SET Estado='Averiado' WHERE Matricula=t_Matricula;        
        END IF;
    END;
/
--====================================================================
CREATE OR REPLACE TRIGGER TR_ITVMRevision
    AFTER INSERT ON ITVMotocicletas
    FOR EACH ROW
    DECLARE
        t_Revision VARCHAR2(15) := :NEW.Revision;
        t_Matricula VARCHAR2(8) := :NEW.Motocicleta;     
    BEGIN        
     IF t_Revision NOT LIKE 'Favorable' THEN     
        DBMS_OUTPUT.PUT_LINE('      ATENCION: EL VEHICULO DEBE PASAR LA ITV ANTES DE PODER SER USADO');
        UPDATE Motocicletas SET Estado='Averiado' WHERE Matricula=t_Matricula;   
        END IF;
    END;
/

--RN-016 
--PERTENECIENTE A LA ASIGNATURA IISSI 2, SE AÑADIRA POSTERIORMENTE


--===============================================================================================================================================================================
--RN-017 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_ExamenPistaA2
    AFTER INSERT ON ExamenesPracticoPista
    FOR EACH ROW
    DECLARE
         t_DNI VARCHAR2(9) := :NEW.Alumno;
         t_PermisoMatriculado VARCHAR2(10);
    BEGIN    
         SELECT * INTO t_PermisoMatriculado FROM(SELECT PermisoMatriculado FROM Matriculas WHERE Alumno=t_DNI ORDER BY FECHA DESC) WHERE ROWNUM = 1;
        
         IF t_PermisoMatriculado NOT LIKE 'Permiso A2' THEN
            raise_application_error(-20016,'Un alumno matriculado en un permiso distinto al A2 no puede inscribirse a un examen de pista');
         END IF;
         
         EXCEPTION WHEN NO_DATA_FOUND THEN raise_application_error(-20080,'Alumno no matriculado');    
    END;
/
--===============================================================================================================================================================================
--RN-018 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_IntentosExamenT
    AFTER INSERT ON ExamenesTeoricos  
    FOR EACH ROW
    DECLARE
     PRAGMA AUTONOMOUS_TRANSACTION;
     t_DNI VARCHAR2(9) := :NEW.Alumno;
     t_IntentosExamen NUMBER;
     t_CuentaExamenes NUMBER;
     t_UltimaMatricula DATE;
      
    BEGIN
     
         SELECT MAX(FECHA) INTO t_ULTIMAMATRICULA FROM MATRICULAS WHERE ALUMNO = t_DNI;
         SELECT nINTENTOSEXAMENES INTO t_INTENTOSEXAMEN FROM MATRICULAS LEFT JOIN OFERTA ON Oferta = OID_O WHERE ALUMNO = t_DNI AND FECHA = t_UltimaMatricula;
         SELECT COUNT(*) Into t_CuentaExamenes FROM EXAMENESTEORICOS WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
         
         IF t_CuentaExamenes+1>t_IntentosExamen THEN
            dbms_output.put_line('      El alumno ha gastado todos sus intentos de presentacion. Para examinarse debe haber pagado las tasas');
         END IF;
        EXCEPTION WHEN NO_DATA_FOUND THEN  raise_application_error(-20080,'Alumno no matriculado');
    END;
/
--====================================================================================
CREATE OR REPLACE TRIGGER TR_IntentosExamenPP
    AFTER INSERT ON ExamenesPracticoPista  
    FOR EACH ROW
    DECLARE
         PRAGMA AUTONOMOUS_TRANSACTION;
         t_DNI VARCHAR2(9) := :NEW.Alumno;
         t_IntentosExamen NUMBER;
         t_CuentaExamenesPP NUMBER;
         t_CuentaExamenesT NUMBER;
         t_UltimaMatricula DATE;
      
    BEGIN  
    
        SELECT MAX(FECHA) INTO t_ULTIMAMATRICULA FROM MATRICULAS WHERE ALUMNO = t_DNI AND PERMISOMATRICULADO = 'Permiso A2';
        SELECT nINTENTOSEXAMENES INTO t_INTENTOSEXAMEN FROM MATRICULAS LEFT JOIN OFERTA ON Oferta = OID_O WHERE ALUMNO = t_DNI AND FECHA = t_UltimaMatricula;
        
        SELECT COUNT(*) Into t_CuentaExamenesPP FROM  EXAMENESPRACTICOPISTA WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
        SELECT COUNT(*) Into t_CuentaExamenesT FROM EXAMENESTEORICOS WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
         
         IF t_CuentaExamenesPP+t_CuentaExamenesT+1>t_IntentosExamen THEN
            dbms_output.put_line('      El alumno ha gastado todos sus intentos de presentacion. Para examinarse debe haber pagado las tasas');
         END IF;
        EXCEPTION WHEN NO_DATA_FOUND THEN  raise_application_error(-20080,'Alumno no matriculado');
    END;
/
--===============================================================================================================
CREATE OR REPLACE TRIGGER TR_IntentosExamenPC
    AFTER INSERT ON ExamenesPracticoCirculacion
    FOR EACH ROW
    DECLARE
         PRAGMA AUTONOMOUS_TRANSACTION;
         t_DNI VARCHAR2(9) := :NEW.Alumno;
         t_IntentosExamen NUMBER;
         t_CuentaExamenesPC NUMBER;
         t_CuentaExamenesPP NUMBER;
         t_CuentaExamenesT NUMBER;
         t_UltimaMatricula DATE;
    
    BEGIN
     
         SELECT MAX(FECHA) INTO t_ULTIMAMATRICULA FROM MATRICULAS WHERE ALUMNO = t_DNI;
         SELECT nINTENTOSEXAMENES INTO t_INTENTOSEXAMEN FROM MATRICULAS LEFT JOIN OFERTA ON Oferta = OID_O WHERE ALUMNO = t_DNI AND FECHA = t_UltimaMatricula;
         
         SELECT COUNT(*) Into t_CuentaExamenesPC FROM  EXAMENESPRACTICOCIRCULACION WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
         SELECT COUNT(*) Into t_CuentaExamenesPP FROM EXAMENESPRACTICOPISTA WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
         SELECT COUNT(*) Into t_CuentaExamenesT FROM EXAMENESTEORICOS WHERE Alumno=t_DNI AND FECHA>t_UltimaMatricula;
        
         
         IF t_CuentaExamenesPC+t_CuentaExamenesPP+t_CuentaExamenesT+1>t_IntentosExamen THEN
            dbms_output.put_line('      El alumno ha gastado todos sus intentos de presentacion. Para examinarse debe haber pagado las tasas');
         END IF;
        EXCEPTION WHEN NO_DATA_FOUND THEN  raise_application_error(-20080,'Alumno no matriculado');
    END;
/
--===============================================================================================================================================================================
--RN-019 TERMINADO--=============================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_TiempoOrdenador
    AFTER INSERT OR UPDATE OF HoraComienzo,HoraFin ON UsoPC
    FOR EACH ROW
    DECLARE
         t_HoraComienzo VARCHAR2(5) := :NEW.HoraComienzo;
         t_HoraFin VARCHAR2(5) := :NEW.HoraFin;     
    BEGIN
         IF (TO_DATE(t_HoraFin,'HH24:MI')-TO_DATE(t_HoraComienzo,'HH24:MI'))*24 > 2 THEN
            raise_application_error(-20019,'No se pueden usar los ordenadores durante más de 2 horas!!');
         END IF;
    END;
/
--===============================================================================================================================================================================
--RN-20 =========================================================================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_CantidadClases
    AFTER INSERT OR UPDATE OF PagoClase ON Clases
    FOR EACH ROW 
    DECLARE 
         PRAGMA AUTONOMOUS_TRANSACTION;
         t_PagoClase NUMBER := :NEW.PagoClase;
         t_Contador NUMBER;
         t_Cantidad NUMBER;   
    BEGIN
        SELECT C INTO t_Contador FROM (SELECT PagoClase,COUNT(*)C FROM Clases GROUP BY pagoClase)CUENTA LEFT JOIN PAGOCLASES p ON CUENTA.PagoClase=P.Oid_pac WHERE t_PagoClase=p.oid_pac;
        SELECT Cantidad INTO t_Cantidad FROM (SELECT PagoClase,COUNT(*)C FROM Clases GROUP BY pagoClase)CUENTA LEFT JOIN PAGOCLASES p ON CUENTA.PagoClase=P.Oid_pac WHERE t_PagoClase=p.oid_pac;
        
        IF t_Contador+1>t_Cantidad THEN
             raise_application_error(-20011,'No puedes dar mas clases. Clases Pagadas gastadas!!');
        END IF;
        EXCEPTION WHEN NO_DATA_FOUND THEN COMMIT;
    END;
/
--===============================================================================================================================================================================
-- HORAINICIO<HORAFIN : NO SE PUEDE PONER COMO CONSTRAINT =======================================================================================================================
--===============================================================================================================================================================================
CREATE OR REPLACE TRIGGER TR_HoraIFClases
AFTER INSERT OR UPDATE OF HoraInicio,HoraFin ON Clases
FOR EACH ROW
    DECLARE
    t_HoraI VARCHAR2(5):= :NEW.HoraInicio;
    t_HoraF VARCHAR2(5) := :NEW.HoraFin;
    
    BEGIN
    
    IF (TO_DATE(t_HoraI,'HH24:MI'))>(TO_DATE(t_HoraF,'HH24:MI')) THEN
        Raise_Application_error(-20020,'La hora de inicio debe ser anterior a la hora de fin');
        END IF;
    END;
/
