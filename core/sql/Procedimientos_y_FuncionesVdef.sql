--=============================================================================================================================================
--== RF 1 =====================================================================================================================================
--=============================================================================================================================================
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Examenes_de_alumno(t_dni in Alumnos.DNI%type)
IS
    CURSOR C1 IS
        SELECT ET.* FROM EXAMENESTEORICOS ET WHERE et.Alumno = t_dni;
        
    CURSOR C2 IS
        SELECT m.permisomatriculado,EPC.* FROM examenespracticocirculacion EPC,Matriculas M WHERE epc.alumno=m.alumno AND epc.alumno=t_dni;
        
    CURSOR C3 IS
        SELECT m.permisomatriculado,EPP.* FROM EXAMENESPRACTICOPISTA EPP,Matriculas M WHERE epp.alumno=m.alumno AND epp.alumno=t_dni;
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('========= EXAMENES TEORICOS ==========');
        dbms_output.put_line(RPAD('FECHA',15)||'|'||RPAD('CALIFICACION',15)||'|'||RPAD('FALLOS',25));
            FOR fila in C1 LOOP
                EXIT WHEN C1%NOTFOUND;
                 dbms_output.put_line(RPAD(fila.Fecha,15)||'|'|| RPAD(fila.calificacion,15)||'|'||RPAD(fila.nfallos,25));
            END LOOP; DBMS_OUTPUT.NEW_LINE;
        
        DBMS_OUTPUT.PUT_LINE('==================================== EXAMENES PRACTICOS CIRCULACION =====================================');
        dbms_output.put_line(RPAD('PERMISO',15)||'|'||RPAD('FECHA',15)||'|'||RPAD('CALIFICACION',15)||'|'||RPAD('Faltas Leves',15)||'|'||RPAD('Faltas Deficientes',20)||'|'||RPAD('Faltas Eliminatorias',20));
            FOR fila2 in C2 LOOP
                EXIT WHEN C2%NOTFOUND;
                 dbms_output.put_line(RPAD(fila2.PermisoMatriculado,15)||'|'||RPAD(fila2.Fecha,15)||'|'|| RPAD(fila2.calificacion,15)||'|'||RPAD(fila2.FaltasLeves,15)||'|'||RPAD(fila2.FaltasDeficientes,20)||'|'||RPAD(fila2.FaltasEliminatorias,20));
            END LOOP; DBMS_OUTPUT.NEW_LINE;
            
        DBMS_OUTPUT.PUT_LINE('================================ EXAMENES PRACTICO EN PISTA CERRADA =====================================');
        dbms_output.put_line(RPAD('PERMISO',15)||'|'||RPAD('FECHA',15)||'|'||RPAD('CALIFICACION',15)||'|'||RPAD('Faltas Leves',15)||'|'||RPAD('Faltas Deficientes',20)||'|'||RPAD('Faltas Eliminatorias',20));
            FOR fila3 in C3 LOOP
                EXIT WHEN C3%NOTFOUND;
                 dbms_output.put_line(RPAD(fila3.PermisoMatriculado,15)||'|'||RPAD(fila3.Fecha,15)||'|'|| RPAD(fila3.calificacion,15)||'|'||RPAD(fila3.FaltasLeves,15)||'|'||RPAD(fila3.FaltasDeficientes,20)||'|'||RPAD(fila3.FaltasEliminatorias,20));
            END LOOP; DBMS_OUTPUT.NEW_LINE;
    END;
/


--=============================================================================================================================================
--== RF 2 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE CREA_TABLA_AUX
AUTHID CURRENT_USER IS 
    BEGIN 
        EXECUTE IMMEDIATE('CREATE TABLE TEMP_PROXIMOS_DIAS(FECHA DATE)'); 
        EXECUTE IMMEDIATE('CREATE TABLE HORAS_DE_CLASE(HORA VARCHAR2(5))');
        
        EXECUTE IMMEDIATE('INSERT INTO TEMP_PROXIMOS_DIAS(FECHA) VALUES (TRUNC(sysdate))'); 
        EXECUTE IMMEDIATE('INSERT INTO TEMP_PROXIMOS_DIAS(FECHA) VALUES (TRUNC(sysdate)+1)');
        EXECUTE IMMEDIATE('INSERT INTO TEMP_PROXIMOS_DIAS(FECHA) VALUES (TRUNC(sysdate)+2)');
        EXECUTE IMMEDIATE('INSERT INTO TEMP_PROXIMOS_DIAS(FECHA) VALUES (TRUNC(sysdate)+3)'); 
            
                
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''10:00'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''10:40'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''11:20'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''12:00'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''12:40'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''13:20'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''17:00'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''17:40'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''18:20'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''19:40'')');
        EXECUTE IMMEDIATE('INSERT INTO HORAS_DE_CLASE(HORA) Values (''20:20'')');
        
        EXECUTE IMMEDIATE('CREATE TABLE AUX_T AS (Select * FROM HORAS_DE_CLASE,TEMP_PROXIMOS_DIAS)');
        
        EXECUTE IMMEDIATE('DROP TABLE HORAS_DE_CLASE');
        EXECUTE IMMEDIATE('DROP TABLE TEMP_PROXIMOS_DIAS');
    END;
/
EXECUTE CREA_TABLA_AUX;

CREATE OR REPLACE PROCEDURE HORARIOS_DE_TUTORIA
IS 
    CURSOR C IS
        SELECT P.Nombre, P.Apellidos, LIBRES.FECHA, LIBRES.HORA FROM ( 
    
        (SELECT AUX_T.FECHA,AUX_T.HORA,P.DNI FROM AUX_T, Profesores P)
        minus 
        (SELECT C.FECHA,C.HORAINICIO,C.dniProfesor FROM CLASES C WHERE C.FECHA>=TRUNC(sysdate))      
        ) LIBRES
            RIGHT JOIN Profesores P ON P.DNI = libres.dni;
            
    BEGIN
        dbms_output.put_line(RPAD('Nombre',15)||'|'|| RPAD('Apellidos',15)||'|'||RPAD('Fecha',25)||'|'||RPAD('Hora',25));
        FOR fila in C LOOP
                EXIT WHEN C%NOTFOUND;
                 dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,15)||'|'||RPAD(fila.Fecha,25)||'|'||RPAD(fila.Hora,25));
            END LOOP; DBMS_OUTPUT.NEW_LINE; 
    END;
/
DROP TABLE AUX_T;


--=============================================================================================================================================
--== RF 3 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE SUSPENSOS_DEL_EXAMEN_X (p_date DATE , p_tipo VARCHAR2)
IS 
    CURSOR C1 IS
        SELECT Nombre,Apellidos,Calificacion,nFallos FROM 
            (SELECT * FROM EXAMENESTEORICOS ET WHERE ET.CALIFICACION LIKE 'No Apto' AND TRUNC(ET.Fecha) = p_date)NOAPTO 
                LEFT JOIN ALUMNOS A ON A.DNI = NOAPTO.ALUMNO;
    
    CURSOR C2 IS
        SELECT Nombre,Apellidos,Calificacion,FaltasLeves,FaltasDeficientes,FaltasEliminatorias FROM
            (SELECT * FROM  EXAMENESPRACTICOCIRCULACION EPC WHERE EPC.CALIFICACION LIKE 'No Apto' AND TRUNC(EPC.Fecha) = p_date)NOAPTO
                LEFT JOIN ALUMNOS A ON A.DNI = NOAPTO.ALUMNO;
    
    CURSOR C3 IS
        SELECT Nombre,Apellidos,Calificacion,FaltasLeves,FaltasDeficientes,FaltasEliminatorias FROM
            (SELECT * FROM EXAMENESPRACTICOPISTA EPP WHERE EPP.CALIFICACION LIKE 'No Apto' AND TRUNC(EPP.Fecha) = p_date)NOAPTO
                LEFT JOIN ALUMNOS A ON A.DNI = NOAPTO.ALUMNO;
    
        Media_TOTAL_fallos Number;
           
    BEGIN
        IF UPPER(p_tipo) LIKE '%TEOR%' THEN BEGIN
            SELECT AVG(NFALLOS) Into Media_TOTAL_fallos FROM EXAMENESTEORICOS WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('SUSPENSOS DE LOS EXAMENES TEORICOS DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',15)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALLOS',25));
                 FOR fila in C1 LOOP
                    EXIT WHEN C1%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,15)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.nFallos,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALLOS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSIF UPPER(p_tipo) LIKE '%CIRCUL%' THEN BEGIN
            SELECT (SUM(FALTASLEVES)+SUM(faltasdeficientes)+SUM(FaltasEliminatorias))/COUNT(*) Into Media_TOTAL_fallos FROM EXAMENESPRACTICOCIRCULACION WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('SUSPENSOS DE LOS EXAMENES DE CIRCULACION DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',30)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALTAS LEVES',25)||'|'||RPAD('FALTAS DEFICIENTES',25)||'|'||RPAD('FALTAS ELIMINATORIAS',25));
                 FOR fila in C2 LOOP
                    EXIT WHEN C2%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,30)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.FaltasLeves,25)||'|'||RPAD(fila.FaltasDeficientes,25)||'|'||RPAD(fila.FaltasEliminatorias,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALTAS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSIF UPPER(p_tipo) LIKE '%PISTA%' THEN BEGIN
            SELECT (SUM(FALTASLEVES)+SUM(faltasdeficientes)+SUM(FaltasEliminatorias))/COUNT(*) Into Media_TOTAL_fallos FROM EXAMENESPRACTICOPISTA WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('SUSPENSOS DE LOS EXAMENES DE PISTA DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',30)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALTAS LEVES',25)||'|'||RPAD('FALTAS DEFICIENTES',25)||'|'||RPAD('FALTAS ELIMINATORIAS',25));
                 FOR fila in C3 LOOP
                    EXIT WHEN C3%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,30)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.FaltasLeves,25)||'|'||RPAD(fila.FaltasDeficientes,25)||'|'||RPAD(fila.FaltasEliminatorias,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALTAS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSE RAISE_APPLICATION_ERROR(-20999,'TIPO DE EXAMEN NO RECONOCIDO');
        END IF;
    END;
/

--=============================================================================================================================================
--== RF 4 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE APROBADOS_DEL_EXAMEN_X (p_date DATE , p_tipo VARCHAR2)
IS 
    CURSOR C1 IS
        SELECT Nombre,Apellidos,Calificacion,nFallos FROM 
            (SELECT * FROM EXAMENESTEORICOS ET WHERE ET.CALIFICACION LIKE 'Apto' AND TRUNC(ET.Fecha) = p_date)APTO 
                LEFT JOIN ALUMNOS A ON A.DNI = APTO.ALUMNO;
    
    CURSOR C2 IS
        SELECT Nombre,Apellidos,Calificacion,FaltasLeves,FaltasDeficientes,FaltasEliminatorias FROM
            (SELECT * FROM EXAMENESPRACTICOCIRCULACION EPC WHERE EPC.CALIFICACION LIKE 'Apto' AND TRUNC(EPC.Fecha) = p_date)APTO
                LEFT JOIN ALUMNOS A ON A.DNI =APTO.ALUMNO;
    
    CURSOR C3 IS
        SELECT Nombre,Apellidos,Calificacion,FaltasLeves,FaltasDeficientes,FaltasEliminatorias FROM
            (SELECT * FROM EXAMENESPRACTICOPISTA EPP WHERE EPP.CALIFICACION LIKE 'Apto' AND TRUNC(EPP.Fecha) = p_date)APTO
                LEFT JOIN ALUMNOS A ON A.DNI = APTO.ALUMNO;
    
        Media_TOTAL_fallos Number;
           
    BEGIN
        IF UPPER(p_tipo) LIKE '%TEOR%' THEN BEGIN
            SELECT AVG(NFALLOS) Into Media_TOTAL_fallos FROM EXAMENESTEORICOS WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('APROBADOS DE LOS EXAMENES TEORICOS DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',15)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALLOS',25));
                 FOR fila in C1 LOOP
                    EXIT WHEN C1%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,15)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.nFallos,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALLOS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSIF UPPER(p_tipo) LIKE '%CIRCUL%' THEN BEGIN
            SELECT (SUM(FALTASLEVES)+SUM(faltasdeficientes)+SUM(FaltasEliminatorias))/COUNT(*) Into Media_TOTAL_fallos FROM EXAMENESPRACTICOCIRCULACION WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('APROBADOS DE LOS EXAMENES DE CIRCULACION DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',30)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALTAS LEVES',25)||'|'||RPAD('FALTAS DEFICIENTES',25)||'|'||RPAD('FALTAS ELIMINATORIAS',25));
                 FOR fila in C2 LOOP
                    EXIT WHEN C2%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,30)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.FaltasLeves,25)||'|'||RPAD(fila.FaltasDeficientes,25)||'|'||RPAD(fila.FaltasEliminatorias,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALTAS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSIF UPPER(p_tipo) LIKE '%PISTA%' THEN BEGIN
            SELECT (SUM(FALTASLEVES)+SUM(faltasdeficientes)+SUM(FaltasEliminatorias))/COUNT(*) Into Media_TOTAL_fallos FROM EXAMENESPRACTICOPISTA WHERE TRUNC(FECHA) = p_date;
                 dbms_output.put_line('APROBADOS DE LOS EXAMENES DE PISTA DEL DIA '||p_date);
                 dbms_output.put_line(RPAD('NOMBRE',15)||'|'|| RPAD('APELLIDOS',30)||'|'||RPAD('CALIFICACION',25)||'|'||RPAD('FALTAS LEVES',25)||'|'||RPAD('FALTAS DEFICIENTES',25)||'|'||RPAD('FALTAS ELIMINATORIAS',25));
                 FOR fila in C3 LOOP
                    EXIT WHEN C3%NOTFOUND;
                    dbms_output.put_line(RPAD(fila.Nombre,15)||'|'|| RPAD(fila.Apellidos,30)||'|'||RPAD(fila.Calificacion,25)||'|'||RPAD(fila.FaltasLeves,25)||'|'||RPAD(fila.FaltasDeficientes,25)||'|'||RPAD(fila.FaltasEliminatorias,25));
                END LOOP; dbms_output.put_line('MEDIA TOTAL DE FALTAS: '|| MEDIA_TOTAL_FALLOS); DBMS_OUTPUT.NEW_LINE; 
            END;
        ELSE RAISE_APPLICATION_ERROR(-20999,'TIPO DE EXAMEN NO RECONOCIDO');
        END IF;
    END;
/


--=============================================================================================================================================
--== RF 5 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE APROBADOS_Y_SUSPENSOS_TOTALES
IS 
    AprobadosT NUMBER;
    SuspensosT NUMBER;
    
    CURSOR C IS 
        Select Pr.Año,Ap.Aprobados/Pr.Presentados*100 PORCENTAJE FROM (
        SELECT EXTRACT(YEAR FROM FECHA) AÑO,COUNT(*)PRESENTADOS FROM EXAMENESTEORICOS 
        WHERE CALIFICACION IS NOT NULL GROUP BY EXTRACT(YEAR FROM FECHA)) PR 
            RIGHT JOIN(
                Select EXTRACT(YEAR FROM ETT.FECHA)AÑO,COUNT(*)APROBADOS FROM EXAMENESTEORICOS ETT 
                WHERE ETT.CALIFICACION LIKE 'Apto' GROUP BY EXTRACT(YEAR FROM ETT.FECHA)) AP 
            ON PR.AÑO = AP.año;
            
    CURSOR C1 IS 
        Select Pr.Año,Ap.Aprobados/Pr.Presentados*100 PORCENTAJE FROM (
        SELECT EXTRACT(YEAR FROM FECHA) AÑO,COUNT(*)PRESENTADOS FROM examenespracticocirculacion 
        WHERE CALIFICACION IS NOT NULL GROUP BY EXTRACT(YEAR FROM FECHA)) PR 
            RIGHT JOIN(
                Select EXTRACT(YEAR FROM ETT.FECHA)AÑO,COUNT(*)APROBADOS FROM examenespracticocirculacion ETT 
                WHERE ETT.CALIFICACION LIKE 'Apto' GROUP BY EXTRACT(YEAR FROM ETT.FECHA)) AP 
            ON PR.AÑO = AP.año;
            
    CURSOR C2 IS 
        Select Pr.Año,Ap.Aprobados/Pr.Presentados*100 PORCENTAJE FROM (
        SELECT EXTRACT(YEAR FROM FECHA) AÑO,COUNT(*)PRESENTADOS FROM examenespracticopista
        WHERE CALIFICACION IS NOT NULL GROUP BY EXTRACT(YEAR FROM FECHA)) PR 
            RIGHT JOIN(
                Select EXTRACT(YEAR FROM ETT.FECHA)AÑO,COUNT(*)APROBADOS FROM examenespracticopista ETT 
                WHERE ETT.CALIFICACION LIKE 'Apto' GROUP BY EXTRACT(YEAR FROM ETT.FECHA)) AP 
            ON PR.AÑO = AP.año;
            
    BEGIN
        Select COUNT(*) Into AprobadosT FROM EXAMENESTEORICOS ET WHERE ET.CALIFICACION LIKE 'Apto';
        Select COUNT(*) Into SuspensosT FROM EXAMENESTEORICOS ET WHERE ET.CALIFICACION LIKE 'No Apto';
        dbms_output.put_line('APROBADOS TOTALES DEL EXAMEN TEORICO: '||AprobadosT);
        dbms_output.put_line('SUSPENSOS TOTALES DEL EXAMEN TEORICO: '||SuspensosT);
        dbms_output.put_line('==============================================');

        Select COUNT(*) Into AprobadosT FROM examenespracticocirculacion EPC WHERE EPC.CALIFICACION LIKE 'Apto';
        Select COUNT(*) Into SuspensosT FROM examenespracticocirculacion EPC WHERE EPC.CALIFICACION LIKE 'No Apto';
        dbms_output.put_line('APROBADOS TOTALES DEL EXAMEN DE CIRCULACION: '||AprobadosT);
        dbms_output.put_line('SUSPENSOS TOTALES DEL EXAMEN DE CIRCULACION: '||SuspensosT);
        dbms_output.put_line('==============================================');
        
        Select COUNT(*) Into AprobadosT FROM examenespracticopista EPP WHERE EPP.CALIFICACION LIKE 'Apto';
        Select COUNT(*) Into SuspensosT FROM examenespracticopista EPP WHERE EPP.CALIFICACION LIKE 'No Apto';
        dbms_output.put_line('APROBADOS TOTALES DEL EXAMEN DE PISTA: '||AprobadosT);
        dbms_output.put_line('SUSPENSOS TOTALES DEL EXAMEN DE PISTA: '||SuspensosT);
        dbms_output.put_line('==============================================');
        
        dbms_output.put_line('APROBADOS DEL EXAMEN TEORICO POR AÑO');
        dbms_output.new_line;
        For fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line('> AÑO '||fila.año||': '||fila.porcentaje||'% De alumnos aprobados');
        END LOOP; dbms_output.put_line('==============================================');

        dbms_output.put_line('APROBADOS DEL EXAMEN DE CIRCULACION POR AÑO');
        dbms_output.new_line;
        For fila in C1 LOOP
            EXIT WHEN C1%NOTFOUND;
            dbms_output.put_line('> AÑO '||fila.año||': '||fila.porcentaje||'% De alumnos aprobados');
        END LOOP; dbms_output.put_line('==============================================');
        
        dbms_output.put_line('APROBADOS DEL EXAMEN DE PISTA POR AÑO');
        dbms_output.new_line;
        For fila in C2 LOOP
            EXIT WHEN C2%NOTFOUND;
            dbms_output.put_line('> AÑO '||fila.año||': '||fila.porcentaje||'% De alumnos aprobados');
        END LOOP; dbms_output.put_line('==============================================');
    END;
/


--=============================================================================================================================================
--== RF 6 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE HORARIO_TRABAJO_DIARIO(p_dniProf in Clases.dniprofesor%TYPE)
IS
    CURSOR C IS   
        SELECT NOMBRE,APELLIDOS,HORAINICIO HORA FROM CLASES C RIGHT JOIN ALUMNOS A ON A.DNI=C.DNIALUMNO WHERE C.FECHA = TRUNC(SYSDATE) AND C.DNIPROFESOR = p_dniprof;
    BEGIN  
        dbms_output.put_line(RPAD('ALUMNO',30)||'   '||RPAD(' HORA',5));
        FOR fila in C LOOP
                EXIT WHEN C%NOTFOUND;
                dbms_output.put_line(RPAD(fila.nombre,10)||' '||RPAD(fila.apellidos,20)||' - '||RPAD(fila.HORA,5));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 7 =====================================================================================================================================
--=============================================================================================================================================

CREATE OR REPLACE PROCEDURE DISPONIBILIDAD_PROFESORADO
IS
    CURSOR C1 IS
        SELECT P.NOMBRE,HORAINICIO HORA FROM CLASES C RIGHT JOIN PROFESORES P ON P.DNI = C.DNIPROFESOR WHERE C.FECHA = TRUNC(SYSDATE);
  
    CURSOR C2 IS
        SELECT P.NOMBRE,
        CONCAT((SELECT TO_CHAR(C.FECHA,'Day') FROM DUAL),EXTRACT(DAY FROM C.FECHA))DIA,
        HORAINICIO HORA 
            FROM CLASES C 
                RIGHT JOIN PROFESORES P ON P.DNI = C.DNIPROFESOR WHERE C.FECHA Between TRUNC(SYSDATE) AND TRUNC(SYSDATE+7);
        
    CURSOR C3 IS
        SELECT P.NOMBRE,
        CONCAT((SELECT TO_CHAR(C.FECHA,'Day') FROM DUAL),EXTRACT(DAY FROM C.FECHA))DIA,
        (SELECT TO_CHAR(C.FECHA, 'Month') FROM DUAL) MES,
        HORAINICIO HORA
            FROM CLASES C 
                RIGHT JOIN PROFESORES P ON P.DNI = C.DNIPROFESOR WHERE C.FECHA Between TRUNC(SYSDATE) AND TRUNC(SYSDATE+30);
                
    BEGIN
        dbms_output.put_line('PROFESORES CON HORAS OCUPADAS HOY ('||trunc(sysdate)||')==================================');
        dbms_output.put_line(RPAD('PROFESOR',20)||'   '||RPAD('HORA',5));
        FOR fila IN C1 LOOP
            EXIT WHEN c1%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,20)||'   '||RPAD(fila.hora,5));
        END LOOP; dbms_output.new_line;
        
        dbms_output.put_line('PROFESORES CON HORAS OCUPADAS EN LA PROXIMA SEMANA============================');
        dbms_output.put_line(RPAD('PROFESOR',20)||'   '||RPAD('DIA',15)||'   '||RPAD('HORA',5));
        FOR fila in C2 LOOP
            EXIT WHEN C2%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,20)||'   '||RPAD(fila.dia,15)||'   '||RPAD(fila.hora,5));
        END LOOP;dbms_output.new_line;
        
        dbms_output.put_line('PROFESORES CON HORAS OCUPADAS EN EL PROXIMO MES===============================');
        dbms_output.put_line(RPAD('PROFESOR',20)||'   '||RPAD('DIA',15)||'   '||RPAD('MES',11)||'   '||RPAD('HORA',5));
        FOR fila IN C3 LOOP
            EXIT WHEN C3%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,20)||'   '||RPAD(fila.dia,15)||'   '||RPAD(fila.mes,11)||'   '||RPAD(fila.hora,5));
        END LOOP;dbms_output.new_line;
    END;
/

        
--=============================================================================================================================================
--== RF 8 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE MODIFICA_HORARIOS_INSERTAR(
p_tipoclase in Clases.tipoclase%TYPE,
p_tipoPermiso in Clases.tipopermiso%TYPE,
p_fecha in Clases.Fecha%TYPE,
p_horai in Clases.horainicio%type,
p_horaf in Clases.horafin%type,
p_DNIProfesor in Clases.dniProfesor%Type,
p_DNIalumno in Clases.dniAlumno%Type,
p_PagoClase in Clases.PagoClase%Type,
p_oferta in Clases.Oferta%Type)
IS
    BEGIN
        INSERT INTO CLASES(TIPOCLASE,TIPOPERMISO,FECHA,HORAINICIO,HORAFIN,DNIPROFESOR,DNIALUMNO,PAGOCLASE,OFERTA)
        VALUES(p_tipoclase,p_tipoPermiso,p_fecha,p_horai,p_horaf,p_DNIProfesor,p_DNIAlumno,P_pagoClase,P_Oferta);
        COMMIT;
    END;
/
CREATE OR REPLACE PROCEDURE MODIFICA_HORARIOS_ELIMINAR(
p_fecha in Clases.Fecha%TYPE,
p_horai in Clases.horainicio%type,
p_DNIProfesor in Clases.dniProfesor%Type)
IS
    BEGIN
        DELETE FROM CLASES C WHERE C.fecha = p_fecha AND C.horainicio = p_Horai AND C.dniprofesor = p_DniProfesor;
    END;
/
--=============================================================================================================================================
--== RF 9 =====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE MEDIA_CALIF_ALUMNO_PROF
IS
    CURSOR C IS
        SELECT NOMBRE,APELLIDOS,PORCENTAJE FROM(
            SELECT PROFPRES.DNIPROFESOR,APROBADOS/PRESENTADOS*100 PORCENTAJE FROM
                
                (SELECT DNIPROFESOR,COUNT(*)PRESENTADOS FROM
                    (SELECT DNIPROFESOR,ALPROF.DNIALUMNO,OID_EPC FROM 
                        (SELECT DISTINCT DNIPROFESOR,DNIALUMNO FROM CLASES C ORDER BY DNIPROFESOR)ALPROF
                    RIGHT JOIN EXAMENESPRACTICOCIRCULACION ATEPC ON ATEPC.ALUMNO = ALPROF.DNIALUMNO)PROFEX
                GROUP BY DNIPROFESOR
                ) PROFPRES -- TABLA PROFESORES: ALUMNOS PRESENTADOS
            
                RIGHT JOIN(
            
                SELECT DNIPROFESOR,COUNT(*)APROBADOS FROM
                    (SELECT DNIPROFESOR,ALPROF.DNIALUMNO,OID_EPC FROM 
                        (SELECT DISTINCT DNIPROFESOR,DNIALUMNO FROM CLASES C ORDER BY DNIPROFESOR)ALPROF 
                    RIGHT JOIN EXAMENESPRACTICOCIRCULACION ATEPC ON ATEPC.ALUMNO = ALPROF.DNIALUMNO WHERE CALIFICACION = 'Apto')PROFEX
                GROUP BY DNIPROFESOR
                )PROFAPT --TABLA PROFESORES: ALUMNOS APROBADOS
           
                ON PROFAPT.DNIPROFESOR = PROFPRES.DNIPROFESOR)DNIPORC 
            
            RIGHT JOIN PROFESORES P ON P.DNI = DNIPORC.DNIPROFESOR;
    BEGIN
        dbms_output.put_line('=======Porcentaje de aprobados por profesor=========');
        dbms_output.put_line(RPAD('PROFESOR',25)||RPAD('APROBADOS',10));
        for fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.Nombre,11)||RPAD(fila.Apellidos,15)||RPAD(fila.porcentaje,3)||'%');
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 10 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE CALIFICACIONES_CADA_PROF(p_Dniprof in Clases.dniprofesor%type)
IS
    CURSOR C1 IS
        SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM
        (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C 
            LEFT JOIN EXAMENESTEORICOS AET ON AET.ALUMNO = C.DNIALUMNO
            WHERE DNIPROFESOR = p_dniprof)ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno
            ORDER BY NOMBRE,FECHA;
            
    CURSOR C2 IS
        SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM
        (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C 
            LEFT JOIN EXAMENESPRACTICOCIRCULACION AET ON AET.ALUMNO = C.DNIALUMNO
            WHERE DNIPROFESOR = p_dniprof)ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno
            ORDER BY Nombre,Fecha;

    CURSOR C3 IS
        SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM
        (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C 
            LEFT JOIN EXAMENESPRACTICOPISTA AET ON AET.ALUMNO = C.DNIALUMNO
            WHERE DNIPROFESOR = p_dniprof)ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno
            ORDER BY Nombre,Fecha;
    BEGIN
        dbms_output.put_line('PRESENTACIONES DE SUS ALUMNOS A EXAMENES TEORICOS ===============================');
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('FECHA',10)||RPAD('CALIFICACION',12));
        FOR fila in C1 LOOP
            EXIT WHEN C1%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,10)||RPAD(fila.Apellidos,20)||RPAD(fila.fecha,12)||RPAD(fila.Calificacion,8));
        END LOOP;dbms_output.new_line;
        
        dbms_output.put_line('PRESENTACIONES DE SUS ALUMNOS A EXAMENES PRACTICOS DE CIRCULACION: =============');
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('FECHA',10)||RPAD('CALIFICACION',12));
        FOR fila in C2 LOOP
            EXIT WHEN C2%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,10)||RPAD(fila.Apellidos,20)||RPAD(fila.fecha,10)||RPAD(fila.Calificacion,8));
        END LOOP;dbms_output.new_line;
        
        dbms_output.put_line('PRESENTACIONES DE SUS ALUMNOS A EXAMENES PRACTICOS DE PISTA =====================');
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('FECHA',10)||RPAD('CALIFICACION',12));
        FOR fila in C3 LOOP
            EXIT WHEN C3%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,10)||RPAD(fila.Apellidos,20)||RPAD(fila.fecha,10)||RPAD(fila.Calificacion,8));
        END LOOP;dbms_output.new_line;
    END;
/


--=============================================================================================================================================
--== RF 11 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE ULTIMO_EXAMEN_PROF
IS
    CURSOR C IS
        SELECT DISTINCT A.NOMBRE,A.APELLIDOS,EPC.FECHA,CALIFICACION,P.NOMBRE Profesor FROM examenespracticocirculacion EPC
        LEFT Join Alumnos A on A.DNI=EPC.Alumno 
        LEFT JOIN CLASES C ON C.DNIALUMNO=A.DNI 
        LEFT JOIN PROFESORES P ON P.DNI=C.DNIPROFESOR
            WHERE EPC.FECHA = (SELECT FECHA FROM (SELECT FECHA FROM EXAMENESPRACTICOCIRCULACION EPC ORDER BY FECHA DESC) WHERE ROWNUM = 1);
    
    BEGIN
        dbms_output.put_line('REULTADOS DEL ULTIMO EXAMEN DE CIRCULACION ALUMNOS POR PROFESOR=======================');
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('FECHA',10)||RPAD('CALIFICACION',14)||RPAD('PROFESOR',12));
        FOR fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,10)||RPAD(fila.apellidos,20)||RPAD(fila.fecha,10)||RPAD(fila.calificacion,14)||RPAD(fila.profesor,12));
            END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 12 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE ULTIMO_EXAMEN_PROFESOR(p_dniProfesor IN CLASES.DNIPROFESOR%TYPE)
IS
    CURSOR C IS
    SELECT NOMBRE,APELLIDOS,OID_ET EXAMENT,OID_EPC EXAMENPC,OID_EPP EXAMENPP,ULT_FECHA,ET.*,
    EPC.FECHA FECHA_1,EPC.CALIFICACION CALIFICACION_1,EPC.FALTASLEVES FALTASLEVES, EPC.FALTASDEFICIENTES FALTASDEFICIENTES,EPC.FALTASELIMINATORIAS FALTASELIMINATORIAS,
    EPP.FECHA FECHA_2,EPP.CALIFICACION CALIFICACION_2,EPP.FALTASLEVES FALTASLEVES_1,EPP.FALTASDEFICIENTES FALTASDEFICIENTES_1,EPP.FALTASELIMINATORIAS FALTASELIMINATORIAS_1 FROM(
        
        SELECT DNI,NOMBRE,APELLIDOS,MAX(FECHA)ULT_FECHA FROM(
            SELECT A.DNI,NOMBRE,APELLIDOS,OID_ET,FECHA,CALIFICACIOn,nFALLOS FROM EXAMENESTEORICOS ET LEFT JOIN ALUMNOS A ON A.DNI=ET.ALUMNO LEFT JOIN (
                SELECT ET.ALUMNO,MAX(ET.FECHA)ULTIMA_FECHA FROM CLASES C 
                    RIGHT JOIN EXAMENESTEORICOS ET ON C.DNIALUMNO = ET.ALUMNO  
                            WHERE C.DNIPROFESOR=p_dniProfesor AND CALIFICACION IS NOT NULL GROUP BY ET.ALUMNO)LAST_DATE
                    ON LAST_DATE.ALUMNO = DNI WHERE ULTIMA_FECHA=FECHA
            
            UNION(
            
            SELECT A.DNI,NOMBRE,APELLIDOS,OID_EPP,FECHA,CALIFICACIOn,FALTASLEVES+FALTASDEFICIENTES+FALTASELIMINATORIAS NFALTAS FROM EXAMENESPRACTICOPISTA ET LEFT JOIN ALUMNOS A ON A.DNI=ET.ALUMNO LEFT JOIN (
                SELECT EPP.ALUMNO,MAX(EPP.FECHA)ULTIMA_FECHA FROM CLASES C 
                    RIGHT JOIN EXAMENESPRACTICOPISTA EPP ON C.DNIALUMNO = EPP.ALUMNO  
                           WHERE C.DNIPROFESOR=p_dniProfesor AND CALIFICACION IS NOT NULL GROUP BY EPP.ALUMNO)LAST_DATE
                    ON LAST_DATE.ALUMNO = DNI WHERE ULTIMA_FECHA=FECHA)
                    
            UNION(        
                    
            SELECT A.DNI,NOMBRE,APELLIDOS,OID_EPC,FECHA,CALIFICACIOn,FALTASLEVES+FALTASDEFICIENTES+FALTASELIMINATORIAS NFALTAS FROM EXAMENESPRACTICOCIRCULACION ET LEFT JOIN ALUMNOS A ON A.DNI=ET.ALUMNO LEFT JOIN (
                SELECT EPC.ALUMNO,MAX(EPC.FECHA)ULTIMA_FECHA FROM CLASES C 
                    RIGHT JOIN EXAMENESPRACTICOCIRCULACION EPC ON C.DNIALUMNO = EPC.ALUMNO  
                         WHERE C.DNIPROFESOR=p_dniProfesor AND CALIFICACION IS NOT NULL GROUP BY EPC.ALUMNO)LAST_DATE
                    ON LAST_DATE.ALUMNO = DNI WHERE ULTIMA_FECHA=FECHA)
                    
                    )ULTIMOS_EXAMENES GROUP BY DNI,NOMBRE,APELLIDOS)ALUMNO_LAST_DATE
                    
        LEFT JOIN EXAMENESTEORICOS ET ON DNI = ET.ALUMNO LEFT JOIN EXAMENESPRACTICOCIRCULACION EPC ON DNI = EPC.ALUMNO LEFT JOIN EXAMENESPRACTICOPISTA EPP ON DNI = EPP.ALUMNO
        WHERE ET.FECHA = ULT_FECHA OR EPP.FECHA = ULT_FECHA OR EPC.FECHA = ULT_FECHA;
        
    BEGIN
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('PRUEBA',15)||RPAD('FECHA',10)||RPAD('CALIFICACION',13)||RPAD('FALTAS LEVES',20)||RPAD('FALTAS DEF',20)||RPAD('FALTAS ELIMINATORIAS',20)||RPAD('   FALLOS TEORICO',20));
        for fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            IF fila.EXAMENPC IS NOT NULL OR FILA.EXAMENPP IS NOT NULL THEN
                IF fila.EXAMENPC IS NOT NULL THEN
                    dbms_output.put_line(RPAD(fila.Nombre,10)||RPAD(fila.apellidos, 20)||RPAD('CIRCULACION',15)||RPAD(fila.ult_Fecha,10)||RPAD(fila.Calificacion_1,13)||RPAD(fila.FaltasLeves,20)||RPAD(fila.FaltasDeficientes,20)||RPAD(fila.FaltasEliminatorias,20)||RPAD('   N/A',20));
                ELSE
                    dbms_output.put_line(RPAD(fila.Nombre,10)||RPAD(fila.apellidos, 20)||RPAD('PISTA',15)||RPAD(fila.ult_fecha,10)||RPAD(fila.Calificacion_2,13)||RPAD(fila.FaltasLeves_1,20)||RPAD(fila.FaltasDeficientes_1,20)||RPAD(fila.FaltasEliminatorias_1,20)||RPAD('   N/A',20));
                END IF;
            ELSE 
                    dbms_output.put_line(RPAD(fila.Nombre,10)||RPAD(fila.apellidos, 20)||RPAD('TEORICO',15)||RPAD(fila.ult_Fecha,10)||RPAD(fila.Calificacion,13)||RPAD(' ',20)||RPAD(' ',20)||RPAD(' ',20)||'   '||RPAD(fila.nfallos,20));
            END IF;
        END LOOP;
    END;
/



--=============================================================================================================================================
--== RF 13 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE CLASES_DADAS_PAGADAS(p_dni in Clases.Dnialumno%type)
IS
    CURSOR C IS
        SELECT C.FECHA,HORAINICIO HORA,TIPOCLASE,CANTIDAD CLASES_PAGADAS FROM CLASES C RIGHT JOIN PAGOCLASES PaC ON PaC.OID_PaC=C.PagoClase WHERE DNIALUMNO = p_dni
        AND TO_DATE(CONCAT(CONCAT(TO_CHAR(C.FECHA),':'),TO_CHAR(C.HORAINICIO)),'DD/MM/YYYY HH24:Mi')<SYSDATE;
        
    BEGIN
    
    dbms_output.put_line(RPAD('=========CLASES YA IMPARTIDAS=========',40)||RPAD('BONO DE CLASES PAGADO',30));
    for fila in C LOOP
        EXIT WHEN C%NOTFOUND;
        dbms_output.put_line(RPAD(fila.fecha,10)||RPAD(fila.hora,10)||RPAD(fila.TipoClase,30)||RPAD(fila.clases_pagadas,10));
        END LOOP;
    END;
/



--=============================================================================================================================================
--== RF 14 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE FUNCTION DIAS_SIN_DAR_CLASE(p_DNI in CLASES.DNIALUMNO%TYPE)
RETURN NUMBER 
    IS p_DIAS NUMBER;
    BEGIN
    
        SELECT TRUNC(SYSDATE) - FECHA DIAS INTO p_DIAS FROM(SELECT FECHA FROM CLASES WHERE DNIALUMNO = p_DNI AND TRUNC(FECHA)<TRUNC(SYSDATE) ORDER BY FECHA DESC) WHERE ROWNUM = 1;
        
    RETURN(p_DIAS);
    EXCEPTION when no_data_found Then Begin p_dias := null; dbms_output.put_line('aun no ha dado ninguna clase');End;
    END;
/ 


--RF - 15 PERTENECE A IISSI 2

--=============================================================================================================================================
--== RF 16 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE INFORMACION_USUARIO_WEB(p_DNI IN ALUMNOS.DNI%TYPE)
IS 
    p_tiempo Number;

    CURSOR C1 IS SELECT USUARIO,CLAVEPORDEFECTO,FECHACADUCIDAD FROM ACCESOWEB;
  
    p_info C1%ROWTYPE;
    
    BEGIN 
        SELECT USUARIO,CLAVEPORDEFECTO,FECHACADUCIDAD INTO p_info FROM ALUMNOS A RIGHT JOIN AccesoWeb ON ACCESOWEB=USUARIO WHERE A.DNI = p_DNI;
        SELECT TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) DIAS INTO p_TIEMPO FROM ALUMNOS RIGHT JOIN AccesoWeb ON ACCESOWEB=USUARIO WHERE DNI = p_DNI;
        
        IF p_tiempo<0 THEN
            dbms_output.put_line('Tu acceso web caducó hace '||-p_tiempo||' días!');
        ELSE
            dbms_output.put_line('USUARIO: ' || p_info.USUARIO);
            dbms_output.put_line('CLAVE POR DEFECTO: ' || p_info.CLAVEPORDEFECTO);
            dbms_output.put_line('CADUCIDAD: ' || p_info.FECHACADUCIDAD);
            dbms_output.put_line('TIEMPO RESTANTE: ' || p_tiempo || ' días');
        END IF;
        EXCEPTION WHEN No_DATA_FOUND THEN dbms_output.put_line('No tienes acceso a la web o está caducado');

    END;
/

    
--=============================================================================================================================================
--== RF 17 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE REGISTRO_USUARIOS_WEB(
    p_nom IN ALUMNOS.NOMBRE%TYPE default '',
    p_app IN ALUMNOS.APELLIDOS%TYPE default '',
    p_usr IN ACCESOWEB.USUARIO%TYPE default '',
    p_pass IN ACCESOWEB.CLAVEPORDEFECTO%TYPE default '',
    p_caduc IN VARCHAR2 default '',
    p_tiempo VARCHAR2 default '')
    IS
        CURSOR C IS
            SELECT NOMBRE,APELLIDOS,USUARIO,CLAVEPORDEFECTO,FECHACADUCIDAD,FECHACADUCIDAD-TRUNC(SYSDATE) DIAS_CADUC FROM ALUMNOS RIGHT JOIN ACCESOWEB ON ACCESOWEB = USUARIO
            WHERE UPPER(NOMBRE) LIKE UPPER(CONCAT(CONCAT('%',p_nom),'%'))
            AND UPPER(APELLIDOS) LIKE UPPER(CONCAT(CONCAT('%',p_app),'%')) 
            AND UPPER(USUARIO) LIKE UPPER(CONCAT(CONCAT('%',p_usr),'%'))
            AND UPPER(CLAVEPORDEFECTO) LIKE UPPER(CONCAT(CONCAT('%',p_pass),'%'))
            AND UPPER(TO_CHAR(FECHACADUCIDAD)) LIKE UPPER(CONCAT('%',p_caduc) )
            AND UPPER(TO_CHAR(FECHACADUCIDAD-TRUNC(SYSDATE))) LIKE UPPER(CONCAT('%',p_tiempo));
    BEGIN
        dbms_output.put_line(RPAD('NOMBRE',10)||RPAD('APELLIDOS',20)||RPAD('USUARIO',15)||RPAD('CONTRASEÑA PD',15)||RPAD('F CADUCIDAD',15)||RPAD('DIAS RESTANTES',15));
        FOR fila IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.nombre,10)||RPAD(fila.apellidos,20)||RPAD(fila.usuario,15)||RPAD(fila.clavepordefecto,15)||RPAD(fila.fechacaducidad,15)||RPAD(fila.dias_caduc,15));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 18 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE REGISTRO_VEHICULOS_USADOS
IS
    CURSOR C IS
        SELECT NOMBRE,APELLIDOS,MODELO,MATRICULA,ESTADO FROM ALUMNOCONDUCETURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA LEFT JOIN ALUMNOS ON DNI = ALUMNO;
    BEGIN
        dbms_output.put_line(RPAD('ALUMNO',30)||RPAD('MODELO',20)||RPAD('MATRICULA',15)||RPAD('ESTADO',20));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(Fila.Nombre,10)||RPAD(Fila.Apellidos,20)||RPAD(Fila.modelo,20)||RPAD(Fila.Matricula,15)||RPAD(Fila.estado,20));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 19 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE COMPAÑIA_SEGURO
IS
    CURSOR C IS
        SELECT MATRICULA,MODELO,COMPAÑIA,TIPOSEGURO FROM SEGUROSTURISMOS ST LEFT JOIN TURISMOS ON TURISMO = MATRICULA
        UNION
        SELECT MATRICULA,MODELO,COMPAÑIA,TIPOSEGURO FROM SEGUROSMOTOCICLETAS SM LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA; 
    
    BEGIN
        dbms_output.put_line(RPAD('MATRICULA',12)||RPAD('MODELO',20)||RPAD('AEGURADORA',15)||RPAD('TIPO DE SEGURO',15));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.matricula,12)||RPAD(fila.modelo,20)||RPAD(fila.compañia,15)||RPAD(fila.tiposeguro,15));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 20 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE ULTIMO_USO_PC
IS
    CURSOR C IS
        SELECT O.OID_PC PC,ESTADOPC,NOMBRE,APELLIDOS,FECHA,HORACOMIENZO,HORAFIN,ROUND(24*(TO_DATE(HORAFIN,'HH24:Mi')-TO_DATE(HORACOMIENZO,'HH24:Mi')),2) TIEMPOUSO 
        FROM USOPC RIGHT JOIN ORDENADORES O ON PC = OID_PC 
            RIGHT JOIN (  
                SELECT O.OID_PC,MAX(HORACOMIENZO)HORAC,FECHA F FROM USOPC RIGHT JOIN ORDENADORES O ON PC = OID_PC 
                    RIGHT JOIN (
                        SELECT OID_PC,MAX(FECHA)LF FROM USOPC RIGHT JOIN ORDENADORES ON PC = OID_PC GROUP BY OID_PC)PC_ULTFECHA 
                    ON O.OID_PC=PC_ULTFECHA.OID_PC WHERE FECHA = LF GROUP BY O.OID_PC,FECHA) PC_ULTFECHA_HORA
            ON O.OID_PC=PC_ULTFECHA_HORA.OID_PC LEFT JOIN ALUMNOS ON DNI = ALUMNO WHERE FECHA = F AND HORACOMIENZO = HORAC ORDER BY O.OID_PC;
    BEGIN
        dbms_output.put_line('ULTIMO USO DE CADA ORDENADOR');
        dbms_output.put_line(RPAD('ORDENADOR',12)||RPAD('ESTADO',20)||RPAD('ALUMNO',35)||RPAD('FECHA USO',20)||RPAD('HORA DE COMIENZO',20)||RPAD('HORA DE FIN',20)||RPAD('TIEMPO DE USO',20));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.pc,12)||RPAD(fila.EstadoPc,20)||RPAD(fila.Nombre,15)||RPAD(fila.Apellidos,20)||RPAD(fila.Fecha,20)||RPAD(fila.Horacomienzo,20)||RPAD(fila.HoraFin,20)||RPAD(fila.TiempoUso||'H',20));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 21 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE ESTADO_USOS_PC(p_PC IN USOPC.PC%TYPE)
IS
    CURSOR C IS
        SELECT ESTADOPC,NOMBRE,APELLIDOS,FECHA,HORACOMIENZO,HORAFIN,ROUND(24*(TO_DATE(HORAFIN,'HH24:Mi')-TO_DATE(HORACOMIENZO,'HH24:Mi')),2) TIEMPOUSO 
        FROM USOPC RIGHT JOIN ORDENADORES ON PC=OID_PC LEFT JOIN ALUMNOS ON ALUMNO=DNI WHERE OID_PC = p_PC ORDER BY FECHA;
    BEGIN
        dbms_output.put_line('ESTADO Y USOS DEL ORDENADOR '||p_PC);
        dbms_output.put_line(RPAD('ESTADO',20)||RPAD('ALUMNO',35)||RPAD('FECHA USO',20)||RPAD('HORA DE COMIENZO',20)||RPAD('HORA DE FIN',20)||RPAD('TIEMPO DE USO',20));
        FOR fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.EstadoPc,20)||RPAD(fila.Nombre,15)||RPAD(fila.Apellidos,20)||RPAD(fila.Fecha,20)||RPAD(fila.Horacomienzo,20)||RPAD(fila.HoraFin,20)||RPAD(fila.TiempoUso||'H',20));
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 22 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE REGISTRO_ULTIMA_ITV
IS
    CURSOR C IS
        SELECT MATRICULA,MODELO,FECHA,REVISION FROM ITVTURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA WHERE FECHA =
        (SELECT * FROM (SELECT MAX(FECHA) FROM ITVTURISMOS GROUP BY TURISMO) WHERE ROWNUM=1) AND ROWNUM=1
        UNION
        SELECT MATRICULA,MODELO,FECHA,REVISION FROM ITVMOTOCICLETAS LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA WHERE FECHA =
        (SELECT * FROM (SELECT MAX(FECHA) FROM ITVMOTOCICLETAS GROUP BY MOTOCICLETA) WHERE ROWNUM=1) AND ROWNUM=1;
    BEGIN
        dbms_output.put_line(RPAD('VEHÍCULO',35)||RPAD('ULTIMA REVISION',30));
        FOR fila IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.Matricula,10)||RPAD(fila.Modelo,25)||RPAD(fila.Fecha,10)||RPAD(fila.Revision,20));
        END LOOP;
    END;
/



--=============================================================================================================================================
--== RF 23 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE RENOVACION_CADUCIDAD_USR(p_DNI in Alumnos.DNI%TYPE)
IS
    CURSOR C IS
        SELECT FECHARENOVACION FR,FECHACADUCIDAD FC FROM ACCESOWEB;
   
    p_Fechas C%ROWTYPE;
    
    BEGIN
        SELECT FECHARENOVACION FR,FECHACADUCIDAD FC INTO p_Fechas FROM ACCESOWEB LEFT JOIN ALUMNOS A ON USUARIO=ACCESOWEB WHERE DNI = p_DNI;
        dbms_output.put_line('ULTIMA RENOVACION Y CADUCIDAD DEL USUARIO CON DNI: '||p_DNI);
        dbms_output.put_line(RPAD('RENOVACION: '||p_fechas.FR,25)||RPAD('CADUCIDAD: '||p_fechas.FC,25));
        
        EXCEPTION WHEN NO_DATA_FOUND THEN dbms_output.put_line('NO TIENES ACCESO A LA WEB O ESTA CADUCADO');

    END;
/


--=============================================================================================================================================
--== RF 24 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE FUNCTION PAGO_ALUMNOS(p_DNI in MATRICULAS.ALUMNO%TYPE)
RETURN NUMBER 
IS
    p_total NUMBER;    
    BEGIN
        SELECT C+M INTO p_TOTAL FROM
        (SELECT SUM(IMPORTE)C FROM PAGOCLASES WHERE ALUMNO = p_DNI),
        (SELECT SUM(PRECIO)M FROM MATRICULAS RIGHT JOIN OFERTA ON OFERTA = OID_O WHERE ALUMNO = p_DNI);
    RETURN(p_total);
    EXCEPTION WHEN NO_DATA_FOUND THEN SELECT SUM(PRECIO) INTO p_total FROM MATRICULAS RIGHT JOIN OFERTA ON OFERTA = OID_O WHERE ALUMNO = p_DNI;
    END PAGO_ALUMNOS;
/


--RF 25 _> IISSI2

--=============================================================================================================================================
--== RF 26 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE VEHICULOS_REPARACIONES
IS
    CURSOR C IS
        SELECT MODELO,MATRICULA,DESCRIPCION,TALLER,COSTE FROM REPARACIONESTURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA
        UNION
        SELECT MODELO,MATRICULA,DESCRIPCION,TALLER,COSTE FROM REPARACIONESMOTOCICLETAS LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA;
    BEGIN
        dbms_output.put_line(RPAD('VEHICULO',35)||RPAD('REPARACION',60)||RPAD('TALLER',30)||RPAD('COSTE',10));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.MODELO,20)||RPAD(Fila.Matricula,15)||RPAD(Fila.Descripcion,60)||RPAD(fila.taller,30)||RPAD(fila.coste||' €',10));
        END LOOP;
    END;
/



--=============================================================================================================================================
--== RF 27 ====================================================================================================================================
--=============================================================================================================================================                
CREATE OR REPLACE PROCEDURE DESGLOSE_MENSUAL(p_MES VARCHAR2 default '',p_AÑO VARCHAR2 default '')
IS
    CURSOR C IS
        SELECT MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS,SEGANU,SEGSEM,SUM(SEGTRIM.IMPORTECUOTA)SEGTRIM FROM(
            SELECT MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS,SEGANU,SUM(SEGSEM.IMPORTECUOTA)SEGSEM FROM(
                SELECT MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS,SUM(SEGANU.IMPORTECUOTA)SEGANU FROM(
                    SELECT MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SUM(SEGMENS.IMPORTECUOTA)SEGMENS FROM
                        (SELECT MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SUM(SALARIO)SALARIOS FROM(    
                            SELECT DISTINCT EXTRACT(MONTH FROM CAL.C_DATE)MES,EXTRACT(YEAR FROM CAL.C_DATE)AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SP.* FROM Z_CALENDAR CAL 
                            LEFT JOIN
                                (SELECT FECHACONTRATO F,DNI,SALARIO FROM PROFESORES)SP
                            ON TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM CAL.C_DATE),EXTRACT(MONTH FROM CAL.C_DATE))),'YYYYMM') > TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM SP.F),EXTRACT(MONTH FROM SP.F))),'YYYYMM')
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(IMPORTE)PAGOCLASES FROM PAGOCLASES GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))PCLASES
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = PCLASES.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = PCLASES.AÑO 
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(PRECIO)MATRICULAS FROM MATRICULAS RIGHT JOIN OFERTA ON OFERTA=OID_O GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))MATR
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = MATR.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = MATR.AÑO
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(COSTE)ITVT FROM ITVTURISMOS GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))ITVT
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = ITVT.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = ITVT.AÑO
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(COSTE)ITVM FROM ITVMOTOCICLETAS GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))ITVM
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = ITVM.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = ITVM.AÑO
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(IMPORTE)PAGOTASAS FROM PAGOTASAS GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))TASAS
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = TASAS.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = TASAS.AÑO
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(COSTE)REPARAT FROM REPARACIONESTURISMOS GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))REPARAT
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = REPARAT.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = REPARAT.AÑO
                            LEFT JOIN
                                (SELECT EXTRACT(MONTH FROM FECHA)MES,EXTRACT(YEAR FROM FECHA)AÑO,SUM(COSTE)REPARAM FROM REPARACIONESMOTOCICLETAS GROUP BY EXTRACT(MONTH FROM FECHA),EXTRACT(YEAR FROM FECHA))REPARAM
                            ON EXTRACT(MONTH FROM CAL.C_DATE) = REPARAM.MES AND EXTRACT(YEAR FROM CAL.C_DATE) = REPARAM.AÑO
                            
                        WHERE TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM CAL.C_DATE),EXTRACT(MONTH FROM CAL.C_DATE))),'YYYYMM')<sysdate)               
                        GROUP BY MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM) BALANCE
                    
                    LEFT JOIN --seguros mensuales
                        (SELECT FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSTURISMOS Where TIPOCUOTA = 'Mensual'
                         UNION
                         Select FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSMOTOCICLETAS Where TIPOCUOTA = 'Mensual')SEGMENS           
                    ON TO_DATE(TO_CHAR(CONCAT(AÑO,MES)),'YYYYMM')>TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM SEGMENS.F),EXTRACT(MONTH FROM SEGMENS.F))),'YYYYMM')
                    GROUP BY MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS) BALANCEM
                
                LEFT JOIN --seguros anuales
                    (SELECT FECHACONTRATO,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSTURISMOS Where TIPOCUOTA = 'Anual'
                     UNION
                     Select FECHACONTRATO,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSMOTOCICLETAS Where TIPOCUOTA = 'Anual') SEGANU
                ON MES = 12 AND AÑO >= EXTRACT(YEAR FROM SEGANU.FECHACONTRATO)
                GROUP BY MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS) BALANCEMAN
            
            LEFT JOIN --seguros semestrales
                (SELECT FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSTURISMOS Where TIPOCUOTA = 'Semestral'
                 UNION
                 Select FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSMOTOCICLETAS Where TIPOCUOTA = 'Semestral') SEGSEM
            ON (MES = 6 OR MES = 12) AND TO_DATE(TO_CHAR(CONCAT(AÑO,MES)),'YYYYMM')>TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM SEGSEM.F),EXTRACT(MONTH FROM SEGSEM.F))),'YYYYMM')
            GROUP BY MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS,SEGANU) BALANCEMANSE
        
        LEFT JOIN --seguros trimestrales
            (SELECT FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSTURISMOS Where TIPOCUOTA = 'Trimestral'
             UNION
             Select FECHACONTRATO F,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSMOTOCICLETAS Where TIPOCUOTA = 'Trimestral') SEGTRIM
        ON (MES = 3 OR MES = 6 OR MES = 9 OR MES = 12) AND TO_DATE(TO_CHAR(CONCAT(AÑO,MES)),'YYYYMM')>TO_DATE(TO_CHAR(CONCAT(EXTRACT(YEAR FROM SEGTRIM.F),EXTRACT(MONTH FROM SEGTRIM.F))),'YYYYMM')
        
        WHERE (TO_CHAR(TO_DATE(MES,'MM'),'MONTH') LIKE UPPER(CONCAT(CONCAT('%',p_MES),'%')) OR TO_CHAR(MES) LIKE CONCAT(CONCAT('%',p_MES),'%'))
              AND TO_CHAR(AÑO) LIKE CONCAT(CONCAT('%',p_AÑO),'%')
        GROUP BY MES,AÑO,PAGOCLASES,MATRICULAS,ITVT,ITVM,PAGOTASAS,REPARAT,REPARAM,SALARIOS,SEGMENS,SEGANU,SEGSEM
        ORDER BY AÑO,MES;
  
    BEGIN
    dbms_output.put_line(RPAD('MES',15)||RPAD('AÑO',10)||RPAD('PAGO DE CLASES',20)||RPAD('MATRICULAS',15)||RPAD('ITVs',15)
    ||RPAD('PAGO DE TASAS',15)||RPAD('REPARACIONES',15)||RPAD('SALARIOS DEL PERSONAL',25)||RPAD('SEGUROS VEHICULOS',25)||RPAD('BALANCE GENERAL',30));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            IF FILA.PagoClases IS NULL THEN Fila.Pagoclases := 0; END IF;
            IF FILA.Matriculas IS NULL THEN Fila.Matriculas := 0; END IF;
            IF FILA.ITVT IS NULL THEN Fila.ITVT := 0; END IF;
            IF FILA.ITVM IS NULL THEN Fila.ITVM := 0; END IF;
            IF FILA.PagoTasas IS NULL THEN Fila.Pagotasas := 0; END IF;
            IF FILA.ReparaT IS NULL THEN Fila.ReparaT := 0; END IF;
            IF FILA.ReparaM IS NULL THEN Fila.ReparaM := 0; END IF;
            IF FILA.Salarios IS NULL THEN Fila.Salarios := 0; END IF;
            IF FILA.SEGMENS IS NULL THEN Fila.SEGMENS := 0; END IF;
            IF FILA.SEGANU IS NULL THEN Fila.SEGANU := 0; END IF;
            IF FILA.SEGSEM IS NULL THEN Fila.SEGSEM := 0; END IF;
            IF FILA.SEGTRIM IS NULL THEN Fila.SEGTRIM := 0; END IF;
            
            dbms_output.put_line(RPAD(TO_CHAR(TO_DATE(FILA.MES,'MM'),'MONTH'),15)||RPAD(FILA.AÑO,10)||RPAD('+'||FILA.PAGOCLASES||' €',20)||RPAD('+'||FILA.MATRICULAS||'€',15)
            ||RPAD('-'||TO_CHAR(FILA.ITVT+FILA.ITVM)||'€',15)||RPAD('-'||FILA.PAGOTASAS||'€',15)||RPAD('-'||TO_CHAR(FILA.REPARAT+FILA.REPARAM)||'€',15)||RPAD('-'||FILA.SALARIOS||'€',25)
            ||RPAD('-'||TO_CHAR(FILA.SEGMENS+FILA.SEGANU+FILA.SEGTRIM)||'€',25)
            ||RPAD(TO_CHAR(FILA.MATRICULAS+FILA.PAGOCLASES-FILA.ITVT-FILA.ITVM-FILA.PAGOTASAS-FILA.REPARAT-FILA.REPARAM-FILA.SALARIOS-FILA.SEGMENS-FILA.SEGANU-FILA.SEGSEM-FILA.SEGTRIM)||'€',30));
        END LOOP;
    END;
/
          

--=============================================================================================================================================
--== RF 28 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE CUOTA_SEGURO_VEHICULO
IS
    CURSOR C IS
        SELECT MATRICULA,MODELO,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSTURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA
        UNION
        SELECT MATRICULA,MODELO,TIPOCUOTA,IMPORTECUOTA FROM SEGUROSMOTOCICLETAS LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA;
    BEGIN
        dbms_output.put_line(RPAD('Matricula',15)||RPAD('MODELO',25)||RPAD('TipoCuota',15)||RPAD('ImporteCuota',10));
        FOR Fila in C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.Matricula,15)||RPAD(fila.MODELO,25)||RPAD(fila.TipoCuota,15)||RPAD(fila.ImporteCuota,10));
        END LOOP;
    END;
/

--RF 29 - iissi 2
--RF 30 - iissi 2
--RF 31 - iissi 2

--=============================================================================================================================================
--== RF 32 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE PERMISOS_POR_PROFESOR
IS
    CURSOR C1 IS
        SELECT NOMBRE,APELLIDOS,CUENTA FROM (SELECT DNI,COUNT(*)CUENTA FROM PROFESORESIMPARTENPERMISOS PIP GROUP BY DNI)PIP LEFT JOIN PROFESORES P ON P.DNI = PIP.DNI;
    CURSOR C2 IS
        SELECT NOMBRE,APELLIDOS,TIPOPERMISO FROM PROFESORESIMPARTENPERMISOS PIP LEFT JOIN PROFESORES P ON P.DNI = PIP.DNI;
    BEGIN
        FOR FILA IN C1 LOOP
            dbms_output.put_line('El profesor '||fila.nombre||' imparte '||fila.cuenta||' permiso(s):');
            FOR fila2 IN C2 LOOP
                IF Concat(fila.nombre,fila.apellidos) = Concat(fila2.nombre,fila2.apellidos) THEN dbms_output.put_line('->'||fila2.tipoPermiso); END IF;
            END LOOP;
            dbms_output.new_line;
        END LOOP;
    END;
/


--=============================================================================================================================================
--== RF 33 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE PROCEDURE REGISTRO_ALUMNOS
IS
    CURSOR C IS    
        SELECT DNI,NOMBRE,APELLIDOS,TELEFONO FROM ALUMNOS;
    BEGIN
        dbms_output.put_line(RPAD('DNI',15)||RPAD('NOMBRE',15)||RPAD('APELLIDOS',25)||RPAD('TELEFONO',15));
        FOR FILA IN C LOOP
            EXIT WHEN C%NOTFOUND;
            dbms_output.put_line(RPAD(fila.Dni,15)||RPAD(fila.NOMBRE,15)||RPAD(Fila.APELLIDOS,25)||RPAD(fila.TELEFONO,15));
        END LOOP;
    END;
/

--=============================================================================================================================================
--== RF funcion extra para iissi2 ====================================================================================================================================
--=============================================================================================================================================
CREATE OR REPLACE FUNCTION FECHA_ULTIMA_CLASE(a_dni in CLASES.DNIALUMNO%TYPE)

RETURN DATE IS 
    fechaultimaclase DATE;

BEGIN

    SELECT * INTO fechaultimaclase FROM (SELECT FECHA FROM CLASES WHERE DNIALUMNO = a_dni AND TRUNC(FECHA)<TRUNC(SYSDATE) ORDER BY FECHA DESC) WHERE ROWNUM=1;    
    
    RETURN(fechaultimaclase);

END;
/
