--Funcion auxiliar ASSERT_EQUALS

CREATE OR REPLACE FUNCTION ASSERT_EQUALS (salida BOOLEAN, salida_esperada BOOLEAN)
    RETURN VARCHAR2 AS
    BEGIN
    IF (salida=salida_esperada) THEN
        RETURN 'EXITO';
    ELSE
        RETURN 'FALLO';
    END IF;
END ASSERT_EQUALS;
/

------------------------------------------ ESPECIFICACION DE LOS PAQUETES ---------------------------------------------------------------

-- en insertar meter todos los atributos menos el OID (ya que con la secuencia se meten solo y no hace falta)
-- en actualizar (en la tabla que tenga sentido) meter todos los atributos incluido el OID
-- en eliminar meter la clave primaria (OID,...)

--TABLA WEBTESTS
CREATE OR REPLACE PACKAGE Pruebas_WebTests AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2,
    w_estado IN WebTests.Estado%TYPE, 
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_W IN WebTests.OID_W%TYPE, w_estado IN WebTests.Estado%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_W IN WebTests.OID_W%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_WebTests;
/


--TABLA ACCESOWEB
CREATE OR REPLACE PACKAGE Pruebas_AccesoWeb AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2,
    w_usuario IN AccesoWeb.Usuario%TYPE, w_ClavePorDefecto IN AccesoWeb.ClavePorDefecto%TYPE, 
    w_FechaRenovacion IN AccesoWeb.FechaRenovacion%TYPE, w_FechaCaducidad IN AccesoWeb.FechaCaducidad%TYPE, w_WEB IN AccesoWeb.Web%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_usuario IN AccesoWeb.Usuario%TYPE, w_ClavePorDefecto IN AccesoWeb.ClavePorDefecto%TYPE, 
    w_FechaRenovacion IN AccesoWeb.FechaRenovacion%TYPE, w_FechaCaducidad IN AccesoWeb.FechaCaducidad%TYPE,w_WEB IN AccesoWeb.Web%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_usuario IN AccesoWeb.Usuario%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_AccesoWeb;
/


--TABLA ALUMNOS
CREATE OR REPLACE PACKAGE Pruebas_Alumnos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_DNI IN Alumnos.DNI%TYPE, w_Nombre IN Alumnos.Nombre%TYPE, w_Apellidos IN Alumnos.Apellidos%TYPE, w_Telefono IN Alumnos.Telefono%TYPE, 
    w_ClasesPagadas IN Alumnos.ClasesPagadas%TYPE, w_FechaNacimiento IN Alumnos.FechaNacimiento%TYPE, 
    w_ReconocimientoMedico IN Alumnos.ReconocimientoMedico%TYPE, w_AccesoWeb IN Alumnos.AccesoWeb%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_DNI IN Alumnos.DNI%TYPE, w_Nombre IN Alumnos.Nombre%TYPE, w_Apellidos IN Alumnos.Apellidos%TYPE, w_Telefono IN Alumnos.Telefono%TYPE, 
    w_ClasesPagadas IN Alumnos.ClasesPagadas%TYPE, w_FechaNacimiento IN Alumnos.FechaNacimiento%TYPE, 
    w_ReconocimientoMedico IN Alumnos.ReconocimientoMedico%TYPE, w_AccesoWeb IN Alumnos.AccesoWeb%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_DNI IN Alumnos.DNI%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Alumnos;
/


--TABLA OFERTA
CREATE OR REPLACE PACKAGE Pruebas_Oferta AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Precio IN Oferta.Precio%TYPE, w_nClasesContenidas IN Oferta.nClasesContenidas%TYPE, 
    w_nIntentosExamenes IN Oferta.nIntentosExamenes%TYPE, w_WEB IN Oferta.Web%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_O IN Oferta.OID_O%TYPE, w_Precio IN Oferta.Precio%TYPE, w_nClasesContenidas IN Oferta.nClasesContenidas%TYPE, 
    w_nIntentosExamenes IN Oferta.nIntentosExamenes%TYPE, w_WEB IN Oferta.Web%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_O IN Oferta.OID_O%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Oferta;
/


--TABLA PagoClases
CREATE OR REPLACE PACKAGE Pruebas_PagoClases AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Alumno IN PagoClases.Alumno%TYPE, w_Fecha IN PagoClases.Fecha%TYPE, w_Importe IN PagoClases.Importe%TYPE, w_Cantidad IN PagoClases.Cantidad%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_PaC IN PagoClases.OID_PaC%TYPE,w_Alumno IN PagoClases.Alumno%TYPE, w_Fecha IN PagoClases.Fecha%TYPE, 
    w_Importe IN PagoClases.Importe%TYPE, w_Cantidad IN PagoClases.Cantidad%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_PaC IN PagoClases.OID_PaC%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_PagoClases;
/


--TABLA ORDENADORES
CREATE OR REPLACE PACKAGE Pruebas_Ordenadores AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_EstadoPC IN Ordenadores.EstadoPC%TYPE, w_Modelo IN Ordenadores.Modelo%TYPE, w_SO IN Ordenadores.SO%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_PC IN Ordenadores.OID_PC%TYPE, w_EstadoPC IN Ordenadores.EstadoPC%TYPE, w_Modelo IN Ordenadores.Modelo%TYPE, w_SO IN Ordenadores.SO%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_PC IN Ordenadores.OID_PC%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Ordenadores;
/


--TABLA USOPC
CREATE OR REPLACE PACKAGE Pruebas_UsoPC AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN UsoPC.Fecha%TYPE, w_HoraComienzo IN UsoPC.HoraComienzo%TYPE, w_HoraFin IN UsoPC.HoraFin%TYPE, 
    w_Alumno IN UsoPC.Alumno%TYPE, w_PC IN UsoPC.PC%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_U IN UsoPC.OID_U%TYPE, w_Fecha IN UsoPC.Fecha%TYPE, w_HoraComienzo IN UsoPC.HoraComienzo%TYPE, 
    w_HoraFin IN UsoPC.HoraFin%TYPE, w_Alumno IN UsoPC.Alumno%TYPE, w_PC IN UsoPC.PC%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_U IN UsoPC.OID_U%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_UsoPC;
/


--TABLA EXAMENESPRACTICOCIRCULACION
CREATE OR REPLACE PACKAGE Pruebas_ExamenesPracticoCirc AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN ExamenesPracticoCirculacion.Fecha%TYPE, w_Alumno IN ExamenesPracticoCirculacion.Alumno%TYPE, w_Calificacion IN ExamenesPracticoCirculacion.Calificacion%TYPE,
    w_FaltasLeves IN ExamenesPracticoCirculacion.FaltasLeves%TYPE, w_FaltasDeficientes IN ExamenesPracticoCirculacion.FaltasDeficientes%TYPE,
    w_FaltasEliminatorias IN ExamenesPracticoCirculacion.FaltasEliminatorias%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_EPC IN ExamenesPracticoCirculacion.OID_EPC%TYPE, w_Fecha IN ExamenesPracticoCirculacion.Fecha%TYPE, w_Alumno IN ExamenesPracticoCirculacion.Alumno%TYPE,
    w_Calificacion IN ExamenesPracticoCirculacion.Calificacion%TYPE, w_FaltasLeves IN ExamenesPracticoCirculacion.FaltasLeves%TYPE, 
    w_FaltasDeficientes IN ExamenesPracticoCirculacion.FaltasDeficientes%TYPE, w_FaltasEliminatorias IN ExamenesPracticoCirculacion.FaltasEliminatorias%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_EPC IN ExamenesPracticoCirculacion.OID_EPC%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ExamenesPracticoCirc;
/


--TABLA EXAMENESPRACTICOPISTA
CREATE OR REPLACE PACKAGE Pruebas_ExamenesPracticoPista AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN ExamenesPracticoPista.Fecha%TYPE, w_Alumno IN ExamenesPracticoPista.Alumno%TYPE, w_Calificacion IN ExamenesPracticoPista.Calificacion%TYPE,
    w_FaltasLeves IN ExamenesPracticoPista.FaltasLeves%TYPE, w_FaltasDeficientes IN ExamenesPracticoPista.FaltasDeficientes%TYPE,
    w_FaltasEliminatorias IN ExamenesPracticoPista.FaltasEliminatorias%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_EPP IN ExamenesPracticoPista.OID_EPP%TYPE, w_Fecha IN ExamenesPracticoPista.Fecha%TYPE, w_Alumno IN ExamenesPracticoPista.Alumno%TYPE,
    w_Calificacion IN ExamenesPracticoPista.Calificacion%TYPE, w_FaltasLeves IN ExamenesPracticoPista.FaltasLeves%TYPE, 
    w_FaltasDeficientes IN ExamenesPracticoPista.FaltasDeficientes%TYPE, w_FaltasEliminatorias IN ExamenesPracticoPista.FaltasEliminatorias%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_EPP IN ExamenesPracticoPista.OID_EPP%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ExamenesPracticoPista;
/


--TABLA EXAMENESTEORICOS
CREATE OR REPLACE PACKAGE Pruebas_ExamenesTeoricos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN ExamenesTeoricos.Fecha%TYPE, w_Alumno IN ExamenesTeoricos.Alumno%TYPE,
    w_Calificacion IN ExamenesTeoricos.Calificacion%TYPE, w_nFallos IN ExamenesTeoricos.nFallos%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_ET IN ExamenesTeoricos.OID_ET%TYPE, w_Fecha IN ExamenesTeoricos.Fecha%TYPE, w_Alumno IN ExamenesTeoricos.Alumno%TYPE,
    w_Calificacion IN ExamenesTeoricos.Calificacion%TYPE, w_nFallos IN ExamenesTeoricos.nFallos%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_ET IN ExamenesTeoricos.OID_ET%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ExamenesTeoricos;
/


--TABLA MATRICULAS
CREATE OR REPLACE PACKAGE Pruebas_Matriculas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN Matriculas.Fecha%TYPE, w_PermisoMatriculado IN Matriculas.PermisoMatriculado%TYPE, 
    w_Alumno IN Matriculas.Alumno%TYPE, w_Oferta IN Matriculas.Oferta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_M IN Matriculas.OID_M%TYPE, w_Fecha IN Matriculas.Fecha%TYPE, w_PermisoMatriculado IN Matriculas.PermisoMatriculado%TYPE, 
    w_Alumno IN Matriculas.Alumno%TYPE, w_Oferta IN Matriculas.Oferta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_M IN Matriculas.OID_M%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Matriculas;
/


--TABLA PAGOTASAS
CREATE OR REPLACE PACKAGE Pruebas_PagoTasas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Importe IN PagoTasas.Importe%TYPE, w_Fecha IN PagoTasas.Fecha%TYPE, w_Oferta IN PagoTasas.Oferta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_PaT IN PagoTasas.OID_PaT%TYPE, w_Importe IN PagoTasas.Importe%TYPE, w_Fecha IN PagoTasas.Fecha%TYPE, w_Oferta IN PagoTasas.Oferta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_PaT IN PagoTasas.OID_PaT%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_PagoTasas;
/


--TABLA TASAS
CREATE OR REPLACE PACKAGE Pruebas_Tasas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Codigo IN Tasas.Codigo%TYPE, w_Tramite IN Tasas.Tramite%TYPE, w_Descripcion IN Tasas.Descripcion%TYPE, w_Importe IN Tasas.Importe%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Codigo IN Tasas.Codigo%TYPE, w_Tramite IN Tasas.Tramite%TYPE, w_Descripcion IN Tasas.Descripcion%TYPE, w_Importe IN Tasas.Importe%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Codigo IN Tasas.Codigo%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Tasas;
/


--TABLA PAGOCONTIENETASAS
CREATE OR REPLACE PACKAGE Pruebas_PagoContieneTasas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_PagoTasas IN PagoContieneTasas.PagoTasas%TYPE, w_Tasa IN PagoContieneTasas.Tasa%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_PagoTasas IN PagoContieneTasas.PagoTasas%TYPE, w_Tasa IN PagoContieneTasas.Tasa%TYPE,
    salidaEsperada BOOLEAN);
        
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_PagoTasas IN PagoContieneTasas.PagoTasas%TYPE, w_Tasa IN PagoContieneTasas.Tasa%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_PagoContieneTasas;
/


--TABLA PROFESORES
CREATE OR REPLACE PACKAGE Pruebas_Profesores AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_DNI IN Profesores.DNI%TYPE, w_Nombre IN Profesores.Nombre%TYPE, w_Apellidos IN Profesores.Apellidos%TYPE,
    w_FechaContrato IN Profesores.FechaContrato%TYPE, w_Telefono IN Profesores.Telefono%TYPE, w_Salario IN Profesores.Salario%TYPE,
    w_nSS IN Profesores.nSS%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_DNI IN Profesores.DNI%TYPE, w_Nombre IN Profesores.Nombre%TYPE, w_Apellidos IN Profesores.Apellidos%TYPE,
    w_FechaContrato IN Profesores.FechaContrato%TYPE, w_Telefono IN Profesores.Telefono%TYPE, w_Salario IN Profesores.Salario%TYPE,
    w_nSS IN Profesores.nSS%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_DNI IN Profesores.DNI%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Profesores;
/


--TABLA PERMISOS
CREATE OR REPLACE PACKAGE Pruebas_Permisos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_TipoPermiso IN Permisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_TipoPermiso IN Permisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_TipoPermiso IN Permisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Permisos;
/


--TABLA PROFESORESIMPARTENPERMISOS
CREATE OR REPLACE PACKAGE Pruebas_ProfImpartenPerm AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_DNI IN ProfesoresImpartenPermisos.DNI%TYPE, w_TipoPermiso IN ProfesoresImpartenPermisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_DNI IN ProfesoresImpartenPermisos.DNI%TYPE, w_TipoPermiso IN ProfesoresImpartenPermisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_DNI IN ProfesoresImpartenPermisos.DNI%TYPE, w_TipoPermiso IN ProfesoresImpartenPermisos.TipoPermiso%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ProfImpartenPerm;
/


--TABLA CLASES
CREATE OR REPLACE PACKAGE Pruebas_Clases AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_TipoClase IN Clases.TipoClase%TYPE, w_TipoPermiso IN Clases.TipoPermiso%TYPE, w_Fecha IN Clases.Fecha%TYPE,
    w_HoraInicio IN Clases.HoraInicio%TYPE, w_HoraFin IN Clases.HoraFin%TYPE, w_DNIProfesor IN Clases.DNIProfesor%TYPE, 
    w_DNIAlumno IN Clases.DNIAlumno%TYPE, w_PagoClase IN Clases.PagoClase%TYPE, w_Oferta IN Clases.Oferta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_C IN Clases.OID_C%TYPE, w_TipoClase IN Clases.TipoClase%TYPE, w_TipoPermiso IN Clases.TipoPermiso%TYPE, w_Fecha IN Clases.Fecha%TYPE,
    w_HoraInicio IN Clases.HoraInicio%TYPE, w_HoraFin IN Clases.HoraFin%TYPE, w_DNIProfesor IN Clases.DNIProfesor%TYPE, 
    w_DNIAlumno IN Clases.DNIAlumno%TYPE, w_PagoClase IN Clases.PagoClase%TYPE, w_Oferta IN Clases.Oferta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_C IN Clases.OID_C%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Clases;
/


--TABLA TURISMOS
CREATE OR REPLACE PACKAGE Pruebas_Turismos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Matricula IN Turismos.Matricula%TYPE, w_Estado IN Turismos.Estado%TYPE, w_Modelo IN Turismos.Modelo%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Matricula IN Turismos.Matricula%TYPE, w_Estado IN Turismos.Estado%TYPE, w_Modelo IN Turismos.Modelo%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Matricula IN Turismos.Matricula%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Turismos;
/


--TABLA MOTOCICLETAS
CREATE OR REPLACE PACKAGE Pruebas_Motocicletas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Matricula IN Motocicletas.Matricula%TYPE, w_Estado IN Motocicletas.Estado%TYPE, 
    w_Modelo IN Motocicletas.Modelo%TYPE, w_CC IN Motocicletas.CC%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Matricula IN Motocicletas.Matricula%TYPE, w_Estado IN Motocicletas.Estado%TYPE, 
    w_Modelo IN Motocicletas.Modelo%TYPE, w_CC IN Motocicletas.CC%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Matricula IN Motocicletas.Matricula%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Motocicletas;
/


--TABLA ALUMNOCONDUCETURISMOS
CREATE OR REPLACE PACKAGE Pruebas_AlumnoConduceTurismos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Alumno IN AlumnoConduceTurismos.Alumno%TYPE, w_Turismo IN AlumnoConduceTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Alumno IN AlumnoConduceTurismos.Alumno%TYPE, w_Turismo IN AlumnoConduceTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Alumno IN AlumnoConduceTurismos.Alumno%TYPE, w_Turismo IN AlumnoConduceTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_AlumnoConduceTurismos;
/


--TABLA ALUMNOCONDUCETURISMOS
CREATE OR REPLACE PACKAGE Pruebas_AlumnoConduceMotos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Alumno IN AlumnoConduceMotocicletas.Alumno%TYPE, w_Motocicleta IN AlumnoConduceMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Alumno IN AlumnoConduceMotocicletas.Alumno%TYPE, w_Motocicleta IN AlumnoConduceMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Alumno IN AlumnoConduceMotocicletas.Alumno%TYPE, w_Motocicleta IN AlumnoConduceMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_AlumnoConduceMotos;
/


--TABLA SEGUROSTURISMOS
CREATE OR REPLACE PACKAGE Pruebas_SegurosTurismos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Compañia IN SegurosTurismos.Compañia%TYPE, w_TipoSeguro IN SegurosTurismos.TipoSeguro%TYPE, w_FechaContrato IN SegurosTurismos.FechaContrato%TYPE,
    w_TipoCuota IN SegurosTurismos.TipoCuota%TYPE, w_ImporteCuota IN SegurosTurismos.ImporteCuota%TYPE, w_Turismo IN SegurosTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_ST IN SegurosTurismos.OID_ST%TYPE, w_Compañia IN SegurosTurismos.Compañia%TYPE, w_TipoSeguro IN SegurosTurismos.TipoSeguro%TYPE, 
    w_FechaContrato IN SegurosTurismos.FechaContrato%TYPE, w_TipoCuota IN SegurosTurismos.TipoCuota%TYPE, 
    w_ImporteCuota IN SegurosTurismos.ImporteCuota%TYPE, w_Turismo IN SegurosTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
            
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_ST IN SegurosTurismos.OID_ST%TYPE,
    salidaEsperada BOOLEAN);
                    
END Pruebas_SegurosTurismos;
/


--TABLA SEGUROSMOTOCICLETAS
CREATE OR REPLACE PACKAGE Pruebas_SegurosMotocicletas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Compañia IN SegurosMotocicletas.Compañia%TYPE, w_TipoSeguro IN SegurosMotocicletas.TipoSeguro%TYPE, w_FechaContrato IN SegurosMotocicletas.FechaContrato%TYPE,
    w_TipoCuota IN SegurosMotocicletas.TipoCuota%TYPE, w_ImporteCuota IN SegurosMotocicletas.ImporteCuota%TYPE, w_Motocicleta IN SegurosMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_SM IN SegurosMotocicletas.OID_SM%TYPE, w_Compañia IN SegurosMotocicletas.Compañia%TYPE, w_TipoSeguro IN SegurosMotocicletas.TipoSeguro%TYPE, 
    w_FechaContrato IN SegurosMotocicletas.FechaContrato%TYPE, w_TipoCuota IN SegurosMotocicletas.TipoCuota%TYPE, 
    w_ImporteCuota IN SegurosMotocicletas.ImporteCuota%TYPE, w_Motocicleta IN SegurosMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_SM IN SegurosMotocicletas.OID_SM%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_SegurosMotocicletas;
/


--TABLA ITVTURISMOS
CREATE OR REPLACE PACKAGE Pruebas_ITVTurismos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN ITVTurismos.Fecha%TYPE, w_FechaExpira IN ITVTurismos.FechaExpira%TYPE, w_Coste IN ITVTurismos.Coste%TYPE, 
    w_Revision IN ITVTurismos.Revision%TYPE, w_Turismo IN ITVTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2,
    w_OID_IT IN ITVTurismos.OID_IT%TYPE, w_Fecha IN ITVTurismos.Fecha%TYPE, w_FechaExpira IN ITVTurismos.FechaExpira%TYPE, 
    w_Coste IN ITVTurismos.Coste%TYPE, w_Revision IN ITVTurismos.Revision%TYPE, w_Turismo IN ITVTurismos.Turismo%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_IT IN ITVTurismos.OID_IT%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ITVTurismos;
/


--TABLA ITVTURISMOS
CREATE OR REPLACE PACKAGE Pruebas_ITVMotocicletas AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Fecha IN ITVMotocicletas.Fecha%TYPE, w_FechaExpira IN ITVMotocicletas.FechaExpira%TYPE, w_Coste IN ITVMotocicletas.Coste%TYPE, 
    w_Revision IN ITVMotocicletas.Revision%TYPE, w_Motocicleta IN ITVMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_IM IN ITVMotocicletas.OID_IM%TYPE, w_Fecha IN ITVMotocicletas.Fecha%TYPE, w_FechaExpira IN ITVMotocicletas.FechaExpira%TYPE, 
    w_Coste IN ITVMotocicletas.Coste%TYPE, w_Revision IN ITVMotocicletas.Revision%TYPE, w_Motocicleta IN ITVMotocicletas.Motocicleta%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_IM IN ITVMotocicletas.OID_IM%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ITVMotocicletas;
/


--TABLA TALLERES
CREATE OR REPLACE PACKAGE Pruebas_Talleres AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Nombre IN Talleres.Nombre%TYPE, w_Direccion IN Talleres.Direccion%TYPE, w_Telefono IN Talleres.Telefono%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_Nombre IN Talleres.Nombre%TYPE, w_Direccion IN Talleres.Direccion%TYPE, w_Telefono IN Talleres.Telefono%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_Nombre IN Talleres.Nombre%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_Talleres;
/


--TABLA REPARACIONESTURISMOS
CREATE OR REPLACE PACKAGE Pruebas_ReparacionesTurismos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Descripcion IN ReparacionesTurismos.Descripcion%TYPE, w_Fecha IN ReparacionesTurismos.Fecha%TYPE, 
    w_Coste IN ReparacionesTurismos.Coste%TYPE, w_Turismo IN ReparacionesTurismos.Turismo%TYPE, w_Taller IN ReparacionesTurismos.Taller%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_RT IN ReparacionesTurismos.OID_RT%TYPE, w_Descripcion IN ReparacionesTurismos.Descripcion%TYPE, w_Fecha IN ReparacionesTurismos.Fecha%TYPE, 
    w_Coste IN ReparacionesTurismos.Coste%TYPE, w_Turismo IN ReparacionesTurismos.Turismo%TYPE, w_Taller IN ReparacionesTurismos.Taller%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_RT IN ReparacionesTurismos.OID_RT%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ReparacionesTurismos;
/


--TABLA REPARACIONESMOTOCICLETAS
CREATE OR REPLACE PACKAGE Pruebas_ReparacionesMotos AS
    PROCEDURE inicializar;
    
    PROCEDURE insertar(nombre_prueba VARCHAR2, 
    w_Descripcion IN ReparacionesMotocicletas.Descripcion%TYPE, w_Fecha IN ReparacionesMotocicletas.Fecha%TYPE, 
    w_Coste IN ReparacionesMotocicletas.Coste%TYPE, w_Motocicleta IN ReparacionesMotocicletas.Motocicleta%TYPE, w_Taller IN ReparacionesMotocicletas.Taller%TYPE,
    salidaEsperada BOOLEAN);
   
    PROCEDURE actualizar(nombre_prueba VARCHAR2, 
    w_OID_RM IN ReparacionesMotocicletas.OID_RM%TYPE, w_Descripcion IN ReparacionesMotocicletas.Descripcion%TYPE, w_Fecha IN ReparacionesMotocicletas.Fecha%TYPE, 
    w_Coste IN ReparacionesMotocicletas.Coste%TYPE, w_Motocicleta IN ReparacionesMotocicletas.Motocicleta%TYPE, w_Taller IN ReparacionesMotocicletas.Taller%TYPE,
    salidaEsperada BOOLEAN);
    
    PROCEDURE eliminar(nombre_prueba VARCHAR2,
    w_OID_RM IN ReparacionesMotocicletas.OID_RM%TYPE,
    salidaEsperada BOOLEAN);
    
END Pruebas_ReparacionesMotos;
/


---------------------------------------------------PACKAGE BODY------------------------------------------------------------------------

--WEBTESTS
CREATE OR REPLACE PACKAGE BODY Pruebas_WebTests AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM WebTests;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ESTADO            IN webtests.estado%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_W              WEBTESTS%ROWTYPE;
        w_OID_W             INTEGER;
        
    BEGIN
    
    INSERT INTO WEBTESTS(ESTADO) 
                        VALUES (w_ESTADO);
       
    w_OID_W := SEC_WebTests.CURRVAL;
    SELECT * INTO TIPO_W FROM WEBTESTS WHERE OID_W = w_OID_W;
    IF (TIPO_W.OID_W <> w_OID_W) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_W             IN webtests.oid_w%TYPE,
        w_ESTADO            IN webtests.estado%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_W          WEBTESTS%ROWTYPE;
        
    BEGIN
        UPDATE WEBTESTS
            SET ESTADO = w_ESTADO
            WHERE OID_W = w_OID_W;
            
        SELECT * INTO TIPO_W FROM WEBTESTS WHERE OID_W = w_OID_W;
        
        IF (TIPO_W.ESTADO <> w_ESTADO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_W             IN webtests.oid_w%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_WEBTESTS   INTEGER;
        
    BEGIN
        DELETE FROM WEBTESTS WHERE OID_W = w_OID_W;
        
        SELECT COUNT(*) INTO N_WEBTESTS FROM WEBTESTS WHERE OID_W = w_OID_W;
        IF (N_WEBTESTS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
END Pruebas_WebTests;
/


CREATE OR REPLACE PACKAGE BODY Pruebas_AccesoWeb AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM AccesoWeb;
    END inicializar;


    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_USUARIO           IN accesoweb.usuario%TYPE,
        w_CLAVEPORDEFECTO   IN accesoweb.clavepordefecto%TYPE,
        w_FECHARENOVACION   IN accesoweb.fecharenovacion%TYPE,
        w_FECHACADUCIDAD    IN accesoweb.fechacaducidad%TYPE,
        w_WEB               IN accesoweb.web%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ACW            ACCESOWEB%ROWTYPE;
    BEGIN
    
    INSERT INTO ACCESOWEB(USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,WEB) 
                        VALUES (w_USUARIO,w_CLAVEPORDEFECTO,w_FECHARENOVACION,w_FECHACADUCIDAD,w_WEB);
    SELECT * INTO TIPO_ACW FROM ACCESOWEB WHERE USUARIO = w_USUARIO;
    IF (TIPO_ACW.USUARIO <> w_USUARIO) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_USUARIO           IN accesoweb.usuario%TYPE,
        w_CLAVEPORDEFECTO   IN accesoweb.clavepordefecto%TYPE,
        w_FECHARENOVACION   IN accesoweb.fecharenovacion%TYPE,
        w_FECHACADUCIDAD    IN accesoweb.fechacaducidad%TYPE,
        w_WEB               IN accesoweb.web%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ACW        ACCESOWEB%ROWTYPE;
        
    BEGIN
        UPDATE ACCESOWEB
            SET USUARIO = w_USUARIO,
                CLAVEPORDEFECTO = w_CLAVEPORDEFECTO,
                FECHARENOVACION = w_FECHARENOVACION,
                FECHACADUCIDAD = w_FECHACADUCIDAD,
                WEB = w_WEB
            WHERE USUARIO = w_USUARIO;
            
        SELECT * INTO TIPO_ACW FROM ACCESOWEB WHERE USUARIO = w_USUARIO;
        
        IF (TIPO_ACW.USUARIO <> w_USUARIO
            OR TIPO_ACW.CLAVEPORDEFECTO <> w_CLAVEPORDEFECTO
            OR TIPO_ACW.FECHARENOVACION <> w_FECHARENOVACION
            OR TIPO_ACW.FECHACADUCIDAD <> w_FECHACADUCIDAD
            OR TIPO_ACW.WEB <> w_WEB) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_USUARIO           IN accesoweb.usuario%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ACCESOWEB     INTEGER;
        
    BEGIN
        DELETE FROM ACCESOWEB WHERE USUARIO = w_USUARIO;
        
        SELECT COUNT(*) INTO N_ACCESOWEB FROM ACCESOWEB WHERE USUARIO = w_USUARIO;
        IF (N_ACCESOWEB <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
END Pruebas_AccesoWeb;
/


--ALUMNOS
CREATE OR REPLACE PACKAGE BODY Pruebas_Alumnos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Alumnos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN alumnos.dni%TYPE,
        w_NOMBRE            IN alumnos.nombre%TYPE,
        w_APELLIDOS         IN alumnos.apellidos%TYPE,
        w_TELEFONO          IN alumnos.telefono%TYPE,
        w_CLASESPAGADAS     IN alumnos.clasespagadas%TYPE,
        w_FECHANACIMIENTO   IN alumnos.fechanacimiento%TYPE,
        w_RECONOCIMIENTOMEDICO  IN alumnos.reconocimientomedico%TYPE,
        w_ACCESOWEB         IN alumnos.accesoweb%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ALUM           ALUMNOS%ROWTYPE;
    BEGIN
    
    INSERT INTO ALUMNOS(DNI,NOMBRE,APELLIDOS,TELEFONO,CLASESPAGADAS,FECHANACIMIENTO,RECONOCiMIENTOMEDICO,ACCESOWEB) 
                        VALUES (w_DNI,w_NOMBRE,w_APELLIDOS,w_TELEFONO,w_CLASESPAGADAS,w_FECHANACIMIENTO,w_RECONOCIMIENTOMEDICO,w_ACCESOWEB);
    SELECT * INTO TIPO_ALUM FROM ALUMNOS WHERE DNI = w_DNI;
    IF (TIPO_ALUM.DNI <> w_DNI) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN alumnos.dni%TYPE,
        w_NOMBRE            IN alumnos.nombre%TYPE,
        w_APELLIDOS         IN alumnos.apellidos%TYPE,
        w_TELEFONO          IN alumnos.telefono%TYPE,
        w_CLASESPAGADAS     IN alumnos.clasespagadas%TYPE,
        w_FECHANACIMIENTO   IN alumnos.fechanacimiento%TYPE,
        w_RECONOCIMIENTOMEDICO  IN alumnos.reconocimientomedico%TYPE,
        w_ACCESOWEB         IN alumnos.accesoweb%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ALUM        ALUMNOS%ROWTYPE;
        
    BEGIN
        UPDATE ALUMNOS
            SET DNI = w_DNI,
                NOMBRE = w_NOMBRE,
                APELLIDOS = w_APELLIDOS,
                TELEFONO = w_TELEFONO,
                CLASESPAGADAS = w_CLASESPAGADAS,
                FECHANACIMIENTO = w_FECHANACIMIENTO,
                RECONOCIMIENTOMEDICO = w_RECONOCIMIENTOMEDICO,
                ACCESOWEB = w_ACCESOWEB
            WHERE DNI = w_DNI;
            
        SELECT * INTO TIPO_ALUM FROM ALUMNOS WHERE DNI = w_DNI;
        
        IF (TIPO_ALUM.DNI <> w_DNI
            OR TIPO_ALUM.NOMBRE <> w_NOMBRE
            OR TIPO_ALUM.APELLIDOS <> w_APELLIDOS
            OR TIPO_ALUM.TELEFONO <> w_TELEFONO
            OR TIPO_ALUM.CLASESPAGADAS <> w_CLASESPAGADAS
            OR TIPO_ALUM.FECHANACIMIENTO <> w_FECHANACIMIENTO
            OR TIPO_ALUM.RECONOCIMIENTOMEDICO <> w_RECONOCIMIENTOMEDICO
            OR TIPO_ALUM.ACCESOWEB <> w_ACCESOWEB) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_DNI               IN alumnos.dni%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ALUMNOS       INTEGER;
        
    BEGIN
        DELETE FROM ALUMNOS WHERE DNI = w_DNI;
        
        SELECT COUNT(*) INTO N_ALUMNOS FROM ALUMNOS WHERE DNI = w_DNI;
        IF (N_ALUMNOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
END Pruebas_Alumnos;
/


--PAGOCLASES
CREATE OR REPLACE PACKAGE BODY Pruebas_PagoClases AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM PagoClases;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ALUMNO            IN pagoclases.alumno%TYPE,
        w_FECHA             IN pagoclases.fecha%TYPE,
        w_IMPORTE           IN pagoclases.importe%TYPE,
        w_CANTIDAD          IN pagoclases.cantidad%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PAC            PAGOCLASES%ROWTYPE;
        w_OID_PAC           INTEGER;
    BEGIN
    
    INSERT INTO PAGOCLASES(ALUMNO,FECHA,IMPORTE,CANTIDAD) 
                        VALUES (w_ALUMNO,w_FECHA,w_IMPORTE,w_CANTIDAD);
             
    w_OID_PAC := SEC_PagoClases.CURRVAL;           
    SELECT * INTO TIPO_PAC FROM PAGOCLASES WHERE OID_PAC = w_OID_PAC;
    IF (TIPO_PAC.OID_PAC <> w_OID_PAC) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PAC           IN pagoclases.oid_pac%TYPE,
        w_ALUMNO            IN pagoclases.alumno%TYPE,
        w_FECHA             IN pagoclases.fecha%TYPE,
        w_IMPORTE           IN pagoclases.importe%TYPE,
        w_CANTIDAD          IN pagoclases.cantidad%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PAC        PAGOCLASES%ROWTYPE;
        
    BEGIN
        UPDATE PAGOCLASES
            SET ALUMNO = w_ALUMNO,
                FECHA = w_FECHA,
                IMPORTE = w_IMPORTE,
                CANTIDAD = w_CANTIDAD
            WHERE OID_PAC = w_OID_PAC;
            
        SELECT * INTO TIPO_PAC FROM PAGOCLASES WHERE OID_PAC = w_OID_PAC;
        
        IF (TIPO_PAC.ALUMNO <> w_ALUMNO
            OR TIPO_PAC.FECHA <> w_FECHA
            OR TIPO_PAC.IMPORTE <> w_IMPORTE
            OR TIPO_PAC.CANTIDAD <> w_CANTIDAD) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PAC            IN pagoclases.oid_pac%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PAGOCLASES   INTEGER;
        
    BEGIN
        DELETE FROM PAGOCLASES WHERE OID_PAC = w_OID_PAC;
        
        SELECT COUNT(*) INTO N_PAGOCLASES FROM PAGOCLASES WHERE OID_PAC = w_OID_PAC;
        IF (N_PAGOCLASES <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_PagoClases;
/


--ORDENADORES
CREATE OR REPLACE PACKAGE BODY Pruebas_Ordenadores AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Ordenadores;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ESTADOPC          IN ordenadores.estadopc%TYPE,
        w_MODELO            IN ordenadores.modelo%TYPE,
        w_SO                IN ordenadores.so%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_O              ORDENADORES%ROWTYPE;
        w_OID_PC            INTEGER;
    BEGIN
    
    INSERT INTO ORDENADORES(ESTADOPC,MODELO,SO) 
                        VALUES (w_ESTADOPC,w_MODELO,w_SO);
             
    w_OID_PC := SEC_Ordenadores.CURRVAL;           
    SELECT * INTO TIPO_O FROM ORDENADORES WHERE OID_PC = w_OID_PC;
    IF (TIPO_O.OID_PC <> w_OID_PC) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PC            IN ordenadores.oid_pc%TYPE,
        w_ESTADOPC          IN ordenadores.estadopc%TYPE,
        w_MODELO            IN ordenadores.modelo%TYPE,
        w_SO                IN ordenadores.so%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_O         ORDENADORES%ROWTYPE;
        
    BEGIN
        UPDATE ORDENADORES
            SET ESTADOPC = w_ESTADOPC,
                MODELO = w_MODELO,
                SO = w_SO
            WHERE OID_PC = w_OID_PC;
            
        SELECT * INTO TIPO_O FROM ORDENADORES WHERE OID_PC = w_OID_PC;
        
        IF (TIPO_O.ESTADOPC <> w_ESTADOPC
            OR TIPO_O.MODELO <> w_MODELO
            OR TIPO_O.SO <> w_SO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PC            IN ordenadores.oid_pc%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ORDENADORES   INTEGER;
        
    BEGIN
        DELETE FROM ORDENADORES WHERE OID_PC = w_OID_PC;
        
        SELECT COUNT(*) INTO N_ORDENADORES FROM ORDENADORES WHERE OID_PC = w_OID_PC;
        IF (N_ORDENADORES <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_Ordenadores;
/


--USOPC
CREATE OR REPLACE PACKAGE BODY Pruebas_UsoPC AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM UsoPC;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN usopc.fecha%TYPE,
        w_HORACOMIENZO      IN usopc.horacomienzo%TYPE,
        w_HORAFIN           IN usopc.horafin%TYPE,
        w_ALUMNO            IN usopc.alumno%TYPE,
        w_PC                IN usopc.pc%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_U              USOPC%ROWTYPE;
        w_OID_U             INTEGER;
        
    BEGIN
    
    INSERT INTO USOPC(FECHA,HORACOMIENZO,HORAFIN,ALUMNO,PC) 
                        VALUES (w_FECHA,w_HORACOMIENZO,w_HORAFIN,w_ALUMNO,w_PC);
       
    w_OID_U := SEC_UsoPC.CURRVAL;
    SELECT * INTO TIPO_U FROM USOPC WHERE OID_u = w_OID_U;
    IF (TIPO_U.OID_U <> w_OID_U) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_U             IN usopc.oid_u%TYPE,
        w_FECHA             IN usopc.fecha%TYPE,
        w_HORACOMIENZO      IN usopc.horacomienzo%TYPE,
        w_HORAFIN           IN usopc.horafin%TYPE,
        w_ALUMNO            IN usopc.alumno%TYPE,
        w_PC                IN usopc.pc%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_U         USOPC%ROWTYPE;
        
    BEGIN
        UPDATE USOPC
            SET FECHA = w_FECHA,
                HORACOMIENZO = w_HORACOMIENZO,
                HORAFIN = w_HORAFIN,
                ALUMNO = w_ALUMNO,
                PC = w_PC
            WHERE OID_U = w_OID_U;
            
        SELECT * INTO TIPO_U FROM USOPC WHERE OID_U = w_OID_U;
        
        IF (TIPO_U.FECHA <> w_FECHA
            OR TIPO_U.HORACOMIENZO <> w_HORACOMIENZO
            OR TIPO_U.HORAFIN <> w_HORAFIN
            OR TIPO_U.ALUMNO <> w_ALUMNO
            OR TIPO_U.PC <> w_PC) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_U             IN usopc.oid_u%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_USOPC   INTEGER;
        
    BEGIN
        DELETE FROM USOPC WHERE OID_U = w_OID_U;
        
        SELECT COUNT(*) INTO N_USOPC FROM USOPC WHERE OID_U = w_OID_U;
        IF (N_USOPC <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_UsoPC;
/


--ExamenesPracticoCirculacion
CREATE OR REPLACE PACKAGE BODY Pruebas_ExamenesPracticoCirc AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ExamenesPracticoCirculacion;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN examenespracticocirculacion.fecha%TYPE,
        w_ALUMNO            IN examenespracticocirculacion.alumno%TYPE,
        w_CALIFICACION      IN examenespracticocirculacion.calificacion%TYPE,
        w_FALTASLEVES       IN examenespracticocirculacion.faltasleves%TYPE,
        w_FALTASDEFICIENTES IN examenespracticocirculacion.faltasdeficientes%TYPE,
        w_FALTASELIMINATORIAS   IN examenespracticocirculacion.faltaseliminatorias%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_EPC            EXAMENESPRACTICOCIRCULACION%ROWTYPE;
        w_OID_EPC           VARCHAR2(10);
    BEGIN
    
    INSERT INTO EXAMENESPRACTICOCIRCULACION(FECHA,ALUMNO,CALIFICACION,FALTASLEVES,FALTASDEFICIENTES,FALTASELIMINATORIAS) 
                        VALUES (w_FECHA,w_ALUMNO,w_CALIFICACION,w_FALTASLEVES,w_FALTASDEFICIENTES,w_FALTASELIMINATORIAS);
                        
    w_OID_EPC := CONCAT('EPC',TO_CHAR(SEC_ExamPractCirc.CURRVAL));
    SELECT * INTO TIPO_EPC FROM EXAMENESPRACTICOCIRCULACION WHERE OID_EPC = w_OID_EPC;
    IF (TIPO_EPC.OID_EPC <> w_OID_EPC) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_EPC           IN examenespracticocirculacion.oid_epc%TYPE,
        w_FECHA             IN examenespracticocirculacion.fecha%TYPE,
        w_ALUMNO            IN examenespracticocirculacion.alumno%TYPE,
        w_CALIFICACION      IN examenespracticocirculacion.calificacion%TYPE,
        w_FALTASLEVES       IN examenespracticocirculacion.faltasleves%TYPE,
        w_FALTASDEFICIENTES IN examenespracticocirculacion.faltasdeficientes%TYPE,
        w_FALTASELIMINATORIAS   IN examenespracticocirculacion.faltaseliminatorias%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_EPC        EXAMENESPRACTICOCIRCULACION%ROWTYPE;
        
    BEGIN
        UPDATE EXAMENESPRACTICOCIRCULACION
            SET FECHA = w_FECHA,
                ALUMNO = w_ALUMNO,
                CALIFICACION = w_CALIFICACION,
                FALTASLEVES = w_FALTASLEVES,
                FALTASDEFICIENTES = w_FALTASDEFICIENTES,
                FALTASELIMINATORIAS = w_FALTASELIMINATORIAS
            WHERE OID_EPC = w_OID_EPC;
            
        SELECT * INTO TIPO_EPC FROM EXAMENESPRACTICOCIRCULACION WHERE OID_EPC = w_OID_EPC;
        
        IF (TIPO_EPC.FECHA <> w_FECHA
            OR TIPO_EPC.ALUMNO <> w_ALUMNO
            OR TIPO_EPC.CALIFICACION <> w_CALIFICACION
            OR TIPO_EPC.FALTASLEVES <> w_FALTASLEVES
            OR TIPO_EPC.FALTASDEFICIENTES <> w_FALTASDEFICIENTES
            OR TIPO_EPC.FALTASELIMINATORIAS <> w_FALTASELIMINATORIAS) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_OID_EPC           IN examenespracticocirculacion.oid_epc%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_EXAMENESPRACTICOCIRCULACION       INTEGER;
        
    BEGIN
        DELETE FROM EXAMENESPRACTICOCIRCULACION WHERE OID_EPC = w_OID_EPC;
        
        SELECT COUNT(*) INTO N_EXAMENESPRACTICOCIRCULACION FROM EXAMENESPRACTICOCIRCULACION WHERE OID_EPC = w_OID_EPC;
        IF (N_EXAMENESPRACTICOCIRCULACION <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;  
    
    
END Pruebas_ExamenesPracticoCirc;
/


--ExamenesPracticoPista
CREATE OR REPLACE PACKAGE BODY Pruebas_ExamenesPracticoPista AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ExamenesPracticoPista;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN examenespracticopista.fecha%TYPE,
        w_ALUMNO            IN examenespracticopista.alumno%TYPE,
        w_CALIFICACION      IN examenespracticopista.calificacion%TYPE,
        w_FALTASLEVES       IN examenespracticopista.faltasleves%TYPE,
        w_FALTASDEFICIENTES IN examenespracticopista.faltasdeficientes%TYPE,
        w_FALTASELIMINATORIAS   IN examenespracticopista.faltaseliminatorias%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_EPP            EXAMENESPRACTICOPISTA%ROWTYPE;
        w_OID_EPP           VARCHAR2(10);
    BEGIN
    
    INSERT INTO EXAMENESPRACTICOPISTA(FECHA,ALUMNO,CALIFICACION,FALTASLEVES,FALTASDEFICIENTES,FALTASELIMINATORIAS) 
                        VALUES (w_FECHA,w_ALUMNO,w_CALIFICACION,w_FALTASLEVES,w_FALTASDEFICIENTES,w_FALTASELIMINATORIAS);
                        
    w_OID_EPP := CONCAT('EPP',TO_CHAR(SEC_ExamPractPista.CURRVAL));
    SELECT * INTO TIPO_EPP FROM EXAMENESPRACTICOPISTA WHERE OID_EPP = w_OID_EPP;
    IF (TIPO_EPP.OID_EPP <> w_OID_EPP) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_EPP           IN examenespracticopista.oid_epp%TYPE,
        w_FECHA             IN examenespracticopista.fecha%TYPE,
        w_ALUMNO            IN examenespracticopista.alumno%TYPE,
        w_CALIFICACION      IN examenespracticopista.calificacion%TYPE,
        w_FALTASLEVES       IN examenespracticopista.faltasleves%TYPE,
        w_FALTASDEFICIENTES IN examenespracticopista.faltasdeficientes%TYPE,
        w_FALTASELIMINATORIAS   IN examenespracticopista.faltaseliminatorias%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_EPP        EXAMENESPRACTICOPISTA%ROWTYPE;
        
    BEGIN
        UPDATE EXAMENESPRACTICOPISTA
            SET FECHA = w_FECHA,
                ALUMNO = w_ALUMNO,
                CALIFICACION = w_CALIFICACION,
                FALTASLEVES = w_FALTASLEVES,
                FALTASDEFICIENTES = w_FALTASDEFICIENTES,
                FALTASELIMINATORIAS = w_FALTASELIMINATORIAS
            WHERE OID_EPP = w_OID_EPP;
            
        SELECT * INTO TIPO_EPP FROM EXAMENESPRACTICOPISTA WHERE OID_EPP = w_OID_EPP;
        
        IF (TIPO_EPP.FECHA <> w_FECHA
            OR TIPO_EPP.ALUMNO <> w_ALUMNO
            OR TIPO_EPP.CALIFICACION <> w_CALIFICACION
            OR TIPO_EPP.FALTASLEVES <> w_FALTASLEVES
            OR TIPO_EPP.FALTASDEFICIENTES <> w_FALTASDEFICIENTES
            OR TIPO_EPP.FALTASELIMINATORIAS <> w_FALTASELIMINATORIAS) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_OID_EPP           IN examenespracticopista.oid_epp%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_EXAMENESPRACTICOPISTA       INTEGER;
        
    BEGIN
        DELETE FROM EXAMENESPRACTICOPISTA WHERE OID_EPP = w_OID_EPP;
        
        SELECT COUNT(*) INTO N_EXAMENESPRACTICOPISTA FROM EXAMENESPRACTICOPISTA WHERE OID_EPP = w_OID_EPP;
        IF (N_EXAMENESPRACTICOPISTA <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_ExamenesPracticoPista;
/


--ExamenesTeoricos
CREATE OR REPLACE PACKAGE BODY Pruebas_ExamenesTeoricos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ExamenesTeoricos;
    END inicializar;
      
      
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN examenesteoricos.fecha%TYPE,
        w_ALUMNO            IN examenesteoricos.alumno%TYPE,
        w_CALIFICACION      IN examenesteoricos.calificacion%TYPE,
        w_NFALLOS           IN examenesteoricos.nfallos%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ET             EXAMENESTEORICOS%ROWTYPE;
        w_OID_ET            VARCHAR2(10);
    BEGIN
    
    INSERT INTO EXAMENESTEORICOS(FECHA,ALUMNO,CALIFICACION,NFALLOS) 
                        VALUES (w_FECHA,w_ALUMNO,w_CALIFICACION,w_NFALLOS);
                        
    w_OID_ET := CONCAT('ET',TO_CHAR(SEC_ExamTeoricos.CURRVAL));
    SELECT * INTO TIPO_ET FROM EXAMENESTEORICOS WHERE OID_ET = w_OID_ET;
    IF (TIPO_ET.OID_ET <> w_OID_ET) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_ET            IN examenesteoricos.oid_et%TYPE,
        w_FECHA             IN examenesteoricos.fecha%TYPE,
        w_ALUMNO            IN examenesteoricos.alumno%TYPE,
        w_CALIFICACION      IN examenesteoricos.calificacion%TYPE,
        w_NFALLOS           IN examenesteoricos.nfallos%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ET        EXAMENESTEORICOS%ROWTYPE;
        
    BEGIN
        UPDATE EXAMENESTEORICOS
            SET FECHA = w_FECHA,
                ALUMNO = w_ALUMNO,
                CALIFICACION = w_CALIFICACION,
                NFALLOS = w_NFALLOS
            WHERE OID_ET = w_OID_ET;
            
        SELECT * INTO TIPO_ET FROM EXAMENESTEORICOS WHERE OID_ET = w_OID_ET;
        
        IF (TIPO_ET.FECHA <> w_FECHA
            OR TIPO_ET.ALUMNO <> w_ALUMNO
            OR TIPO_ET.CALIFICACION <> w_CALIFICACION
            OR TIPO_ET.NFALLOS <> w_NFALLOS) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_ET            IN examenesteoricos.oid_et%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_EXAMENESTEORICOS       INTEGER;
        
    BEGIN
        DELETE FROM EXAMENESTEORICOS WHERE OID_ET = w_OID_ET;
        
        SELECT COUNT(*) INTO N_EXAMENESTEORICOS FROM EXAMENESTEORICOS WHERE OID_ET = w_OID_ET;
        IF (N_EXAMENESTEORICOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;  
    
END Pruebas_ExamenesTeoricos;
/


--Oferta
CREATE OR REPLACE PACKAGE BODY Pruebas_Oferta AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Oferta;
    END inicializar;
    
      
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_PRECIO            IN oferta.precio%TYPE,
        w_NCLASESCONTENIDAS IN oferta.nclasescontenidas%TYPE,
        w_NINTENTOSEXAMENES IN oferta.nintentosexamenes%TYPE,
        w_WEB               IN oferta.web%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_OF             OFERTA%ROWTYPE;
        w_OID_O             INTEGER;
    BEGIN
    
    INSERT INTO OFERTA(PRECIO,NCLASESCONTENIDAS,NINTENTOSEXAMENES,WEB) 
                        VALUES (w_PRECIO,w_NCLASESCONTENIDAS,w_NINTENTOSEXAMENES,w_WEB);
             
    w_OID_O := SEC_Oferta.CURRVAL;           
    SELECT * INTO TIPO_OF FROM OFERTA WHERE OID_O = w_OID_O;
    IF (TIPO_OF.OID_O <> w_OID_O) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_O             IN oferta.oid_o%TYPE,
        w_PRECIO            IN oferta.precio%TYPE,
        w_NCLASESCONTENIDAS IN oferta.nclasescontenidas%TYPE,
        w_NINTENTOSEXAMENES IN oferta.nintentosexamenes%TYPE,
        w_WEB               IN oferta.web%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_OF         OFERTA%ROWTYPE;
        
    BEGIN
        UPDATE OFERTA
            SET PRECIO = w_PRECIO,
                NCLASESCONTENIDAS = w_NCLASESCONTENIDAS,
                NINTENTOSEXAMENES = w_NINTENTOSEXAMENES,
                WEB = w_WEB
            WHERE OID_O = w_OID_O;
            
        SELECT * INTO TIPO_OF FROM OFERTA WHERE OID_O = w_OID_O;
        
        IF (TIPO_OF.PRECIO <> w_PRECIO
            OR TIPO_OF.NCLASESCONTENIDAS <> w_NCLASESCONTENIDAS
            OR TIPO_OF.NINTENTOSEXAMENES <> w_NINTENTOSEXAMENES
            OR TIPO_OF.WEB <> w_WEB) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_O            IN oferta.oid_o%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_OFERTA        INTEGER;
        
    BEGIN
        DELETE FROM OFERTA WHERE OID_O = w_OID_O;
        
        SELECT COUNT(*) INTO N_OFERTA FROM OFERTA WHERE OID_O = w_OID_O;
        IF (N_OFERTA <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;  
      
    
END Pruebas_Oferta;
/


--Matriculas
CREATE OR REPLACE PACKAGE BODY Pruebas_Matriculas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Matriculas;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN matriculas.fecha%TYPE,
        w_PERMISOMATRICULADO   IN matriculas.permisomatriculado%TYPE,
        w_ALUMNO            IN matriculas.alumno%TYPE,
        w_OFERTA            IN matriculas.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_MA             MATRICULAS%ROWTYPE;
        w_OID_M             INTEGER;
    BEGIN
    
    INSERT INTO MATRICULAS(FECHA,PERMISOMATRICULADO,ALUMNO,OFERTA) 
                        VALUES (w_FECHA,w_PERMISOMATRICULADO,w_ALUMNO,w_OFERTA);
                        
    w_OID_M := SEC_Matriculas.CURRVAL;
    SELECT * INTO TIPO_MA FROM MATRICULAS WHERE OID_M = w_OID_M;
    IF (TIPO_MA.OID_M <> w_OID_M) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_M             IN matriculas.oid_m%TYPE,
        w_FECHA             IN matriculas.fecha%TYPE,
        w_PERMISOMATRICULADO   IN matriculas.permisomatriculado%TYPE,
        w_ALUMNO            IN matriculas.alumno%TYPE,
        w_OFERTA            IN matriculas.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_MA         MATRICULAS%ROWTYPE;
        
    BEGIN
        UPDATE MATRICULAS
            SET FECHA = w_FECHA,
                PERMISOMATRICULADO = w_PERMISOMATRICULADO,
                ALUMNO = w_ALUMNO,
                OFERTA = w_OFERTA
            WHERE OID_M = w_OID_M;
            
        SELECT * INTO TIPO_MA FROM MATRICULAS WHERE OID_M = w_OID_M;
        
        IF (TIPO_MA.FECHA <> w_FECHA
            OR TIPO_MA.PERMISOMATRICULADO <> w_PERMISOMATRICULADO
            OR TIPO_MA.ALUMNO <> w_ALUMNO
            OR TIPO_MA.OFERTA <> w_OFERTA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_M            IN matriculas.oid_m%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_MATRICULAS       INTEGER;
        
    BEGIN
        DELETE FROM MATRICULAS WHERE OID_M = w_OID_M;
        
        SELECT COUNT(*) INTO N_MATRICULAS FROM MATRICULAS WHERE OID_M = w_OID_M;
        IF (N_MATRICULAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_Matriculas;
/


--PagoTasas
CREATE OR REPLACE PACKAGE BODY Pruebas_PagoTasas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM PagoTasas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_IMPORTE           IN pagotasas.importe%TYPE,
        w_FECHA             IN pagotasas.fecha%TYPE,
        w_OFERTA            IN pagotasas.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PT             PAGOTASAS%ROWTYPE;
        w_OID_PAT           INTEGER;
        
    BEGIN
    
    INSERT INTO PAGOTASAS(IMPORTE,FECHA,OFERTA) 
                        VALUES (w_IMPORTE,w_FECHA,w_OFERTA);
    
    w_OID_PAT := SEC_PagoTasas.CURRVAL;   
    SELECT * INTO TIPO_PT FROM PAGOTASAS WHERE OID_PAT = w_OID_PAT;
    IF (TIPO_PT.OID_PAT <> w_OID_PAT) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PAT           IN pagotasas.oid_pat%TYPE,
        w_IMPORTE           IN pagotasas.importe%TYPE,
        w_FECHA             IN pagotasas.fecha%TYPE,
        w_OFERTA            IN pagotasas.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PT         PAGOTASAS%ROWTYPE;
        
    BEGIN
        UPDATE PAGOTASAS
            SET IMPORTE = w_IMPORTE,
                FECHA = w_FECHA,
                OFERTA = w_OFERTA
            WHERE OID_PAT = w_OID_PAT;
            
        SELECT * INTO TIPO_PT FROM PAGOTASAS WHERE OID_PAT = w_OID_PAT;
        
        IF (TIPO_PT.IMPORTE <> w_IMPORTE
            OR TIPO_PT.FECHA <> w_FECHA
            OR TIPO_PT.OFERTA <> w_OFERTA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_PAT           IN pagotasas.oid_pat%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PAGOTASAS   INTEGER;
        
    BEGIN
        DELETE FROM PAGOTASAS WHERE OID_PAT = w_OID_PAT;
        
        SELECT COUNT(*) INTO N_PAGOTASAS FROM PAGOTASAS WHERE OID_PAT = w_OID_PAT;
        IF (N_PAGOTASAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_PagoTasas;
/


--Tasas
CREATE OR REPLACE PACKAGE BODY Pruebas_Tasas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Tasas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_CODIGO            IN tasas.codigo%TYPE,
        w_TRAMITE           IN tasas.tramite%TYPE,
        w_DESCRIPCION       IN tasas.descripcion%TYPE,
        w_IMPORTE           IN tasas.importe%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_T            TASAS%ROWTYPE;
        
    BEGIN
    
    INSERT INTO TASAS(CODIGO,TRAMITE,DESCRIPCION,IMPORTE) 
                        VALUES (w_CODIGO,w_TRAMITE,w_DESCRIPCION,w_IMPORTE);
       
    SELECT * INTO TIPO_T FROM TASAS WHERE CODIGO = w_CODIGO;
    IF (TIPO_T.CODIGO <> w_CODIGO) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_CODIGO            IN tasas.codigo%TYPE,
        w_TRAMITE           IN tasas.tramite%TYPE,
        w_DESCRIPCION       IN tasas.descripcion%TYPE,
        w_IMPORTE           IN tasas.importe%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_T        TASAS%ROWTYPE;
        
    BEGIN
        UPDATE TASAS
            SET CODIGO = w_CODIGO,
                TRAMITE = w_TRAMITE,
                DESCRIPCION = w_TRAMITE,
                IMPORTE = w_IMPORTE
            WHERE CODIGO = w_CODIGO;
            
        SELECT * INTO TIPO_T FROM TASAS WHERE CODIGO = w_CODIGO;
        
        IF (TIPO_T.CODIGO <> w_CODIGO
            OR TIPO_T.TRAMITE <> w_TRAMITE
            OR TIPO_T.DESCRIPCION <> w_DESCRIPCION
            OR TIPO_T.IMPORTE <> w_IMPORTE) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_CODIGO            IN tasas.codigo%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_TASAS   INTEGER;
        
    BEGIN
        DELETE FROM TASAS WHERE CODIGO = w_CODIGO;
        
        SELECT COUNT(*) INTO N_TASAS FROM TASAS WHERE CODIGO = w_CODIGO;
        IF (N_TASAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR; 
      
    
END Pruebas_Tasas;
/


--PagoContieneTasas
CREATE OR REPLACE PACKAGE BODY Pruebas_PagoContieneTasas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM PagoContieneTasas;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_PAGOTASAS         IN pagocontienetasas.pagotasas%TYPE,
        w_TASA             IN pagocontienetasas.tasa%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PCT            PAGOCONTIENETASAS%ROWTYPE;
        
    BEGIN
    
    INSERT INTO PAGOCONTIENETASAS(PAGOTASAS,TASA) 
                        VALUES (w_PAGOTASAS,w_TASA);
                        
    SELECT * INTO TIPO_PCT FROM PAGOCONTIENETASAS WHERE PAGOTASAS = w_PAGOTASAS AND TASA = w_TASA;
    IF (TIPO_PCT.PAGOTASAS <> w_PAGOTASAS
        OR TIPO_PCT.TASA <> w_TASA) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_PAGOTASAS         IN pagocontienetasas.pagotasas%TYPE,
        w_TASA             IN pagocontienetasas.tasa%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PCT        PAGOCONTIENETASAS%ROWTYPE;
        
    BEGIN
        UPDATE PAGOCONTIENETASAS
            SET PAGOTASAS = w_PAGOTASAS,
                TASA = w_TASA
            WHERE PAGOTASAS = w_PAGOTASAS AND TASA = w_TASA;
            
        SELECT * INTO TIPO_PCT FROM PAGOCONTIENETASAS WHERE PAGOTASAS = w_PAGOTASAS AND TASA = w_TASA;
        
        IF (TIPO_PCT.PAGOTASAS <> w_PAGOTASAS
            OR TIPO_PCT.TASA <> w_TASA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_PAGOTASAS         IN pagocontienetasas.pagotasas%TYPE,
        w_TASA             IN pagocontienetasas.tasa%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PAGOCONTIENETASAS   INTEGER;
        
    BEGIN
        DELETE FROM PAGOCONTIENETASAS WHERE PAGOTASAS = w_PAGOTASAS AND TASA = w_TASA;
        
        SELECT COUNT(*) INTO N_PAGOCONTIENETASAS FROM PAGOCONTIENETASAS WHERE PAGOTASAS = w_PAGOTASAS AND TASA = w_TASA;
        IF (N_PAGOCONTIENETASAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_PagoContieneTasas;
/


--Profesores
CREATE OR REPLACE PACKAGE BODY Pruebas_Profesores AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Profesores;
    END inicializar;
      
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesores.dni%TYPE,
        w_NOMBRE            IN profesores.nombre%TYPE,
        w_APELLIDOS         IN profesores.apellidos%TYPE,
        w_FECHACONTRATO     IN profesores.fechacontrato%TYPE,
        w_TELEFONO          IN profesores.telefono%TYPE,
        w_SALARIO           IN profesores.salario%TYPE,
        w_NSS               IN profesores.nss%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PR             PROFESORES%ROWTYPE;
        
    BEGIN
    
    INSERT INTO PROFESORES(DNI,NOMBRE,APELLIDOS,FECHACONTRATO,TELEFONO,SALARIO,NSS) 
                        VALUES (w_DNI,w_NOMBRE,w_APELLIDOS,w_FECHACONTRATO,w_TELEFONO,w_SALARIO,w_NSS);
       
    SELECT * INTO TIPO_PR FROM PROFESORES WHERE DNI = w_DNI;
    IF (TIPO_PR.DNI <> w_DNI) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesores.dni%TYPE,
        w_NOMBRE            IN profesores.nombre%TYPE,
        w_APELLIDOS         IN profesores.apellidos%TYPE,
        w_FECHACONTRATO     IN profesores.fechacontrato%TYPE,
        w_TELEFONO          IN profesores.telefono%TYPE,
        w_SALARIO           IN profesores.salario%TYPE,
        w_NSS               IN profesores.nss%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PR         PROFESORES%ROWTYPE;
        
    BEGIN
        UPDATE PROFESORES
            SET NOMBRE = w_NOMBRE,
                APELLIDOS = w_APELLIDOS,
                FECHACONTRATO = w_FECHACONTRATO,
                TELEFONO = w_TELEFONO,
                SALARIO = w_SALARIO,
                NSS = w_NSS
            WHERE DNI = w_DNI;
            
        SELECT * INTO TIPO_PR FROM PROFESORES WHERE DNI = w_DNI;
        
        IF (TIPO_PR.NOMBRE <> w_NOMBRE
            OR TIPO_PR.APELLIDOS <> w_APELLIDOS
            OR TIPO_PR.FECHACONTRATO <> w_FECHACONTRATO
            OR TIPO_PR.TELEFONO <> w_TELEFONO
            OR TIPO_PR.SALARIO <> w_SALARIO
            OR TIPO_PR.NSS <> w_NSS) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesores.dni%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PROFESORES   INTEGER;
        
    BEGIN
        DELETE FROM PROFESORES WHERE DNI = w_DNI;
        
        SELECT COUNT(*) INTO N_PROFESORES FROM PROFESORES WHERE DNI = w_DNI;
        IF (N_PROFESORES <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_Profesores;
/


--Permisos
CREATE OR REPLACE PACKAGE BODY Pruebas_Permisos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Permisos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_TIPOPERMISO       IN permisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PERM           PERMISOS%ROWTYPE;
        
    BEGIN
    
    INSERT INTO PERMISOS(TIPOPERMISO) 
                        VALUES (w_TIPOPERMISO);
       
    SELECT * INTO TIPO_PERM FROM PERMISOS WHERE TIPOPERMISO = w_TIPOPERMISO;
    IF (TIPO_PERM.TIPOPERMISO <> w_TIPOPERMISO) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_TIPOPERMISO       IN permisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PERM          PERMISOS%ROWTYPE;
        
    BEGIN
        UPDATE PERMISOS
            SET TIPOPERMISO = w_TIPOPERMISO
            WHERE TIPOPERMISO = w_TIPOPERMISO;
            
        SELECT * INTO TIPO_PERM FROM PERMISOS WHERE TIPOPERMISO = w_TIPOPERMISO;
        
        IF (TIPO_PERM.TIPOPERMISO <> w_TIPOPERMISO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_TIPOPERMISO       IN permisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PERMISOS      INTEGER;
        
    BEGIN
        DELETE FROM PERMISOS WHERE TIPOPERMISO = w_TIPOPERMISO;
        
        SELECT COUNT(*) INTO N_PERMISOS FROM PERMISOS WHERE TIPOPERMISO = w_TIPOPERMISO;
        IF (N_PERMISOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_Permisos;
/


--ProfesoresImpartenPermisos
CREATE OR REPLACE PACKAGE BODY Pruebas_ProfImpartenPerm AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ProfesoresImpartenPermisos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesoresimpartenpermisos.dni%TYPE,
        w_TIPOPERMISO       IN profesoresimpartenpermisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_PIP            PROFESORESIMPARTENPERMISOS%ROWTYPE;
        
    BEGIN
    
    INSERT INTO PROFESORESIMPARTENPERMISOS(DNI,TIPOPERMISO) 
                        VALUES (w_DNI,w_TIPOPERMISO);
       
    SELECT * INTO TIPO_PIP FROM PROFESORESIMPARTENPERMISOS WHERE DNI = w_DNI AND TIPOPERMISO=w_TIPOPERMISO;
    IF (TIPO_PIP.DNI <> w_DNI
    OR TIPO_PIP.TIPOPERMISO <> w_TIPOPERMISO) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesoresimpartenpermisos.dni%TYPE,
        w_TIPOPERMISO       IN profesoresimpartenpermisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_PIP         PROFESORESIMPARTENPERMISOS%ROWTYPE;
        
    BEGIN
        UPDATE PROFESORESIMPARTENPERMISOS
            SET TIPOPERMISO = w_TIPOPERMISO,
                DNI=w_DNI
            WHERE DNI = w_DNI AND TIPOPERMISO=w_TIPOPERMISO;
            
        SELECT * INTO TIPO_PIP FROM PROFESORESIMPARTENPERMISOS WHERE DNI = w_DNI AND TIPOPERMISO=w_TIPOPERMISO;
        
        IF (TIPO_PIP.TIPOPERMISO <> w_TIPOPERMISO
        OR TIPO_PIP.DNI <> w_DNI) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DNI               IN profesoresimpartenpermisos.dni%TYPE,
        w_TIPOPERMISO       IN profesoresimpartenpermisos.tipopermiso%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_PROFESORESIMPARTENPERMISOS   INTEGER;
        
    BEGIN
        DELETE FROM PROFESORESIMPARTENPERMISOS WHERE DNI = w_DNI AND TIPOPERMISO= w_TIPOPERMISO;
        
        SELECT COUNT(*) INTO N_PROFESORESIMPARTENPERMISOS FROM PROFESORESIMPARTENPERMISOS WHERE DNI = w_DNI AND TIPOPERMISO= w_TIPOPERMISO;
        IF (N_PROFESORESIMPARTENPERMISOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_ProfImpartenPerm;
/


--Clases
CREATE OR REPLACE PACKAGE BODY Pruebas_Clases AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Clases;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_TIPOCLASE         IN clases.tipoclase%TYPE,
        w_TIPOPERMISO       IN clases.tipopermiso%TYPE,
        w_FECHA             IN clases.fecha%TYPE,
        w_HORAINICIO        IN clases.horainicio%TYPE,
        w_HORAFIN           IN clases.horafin%TYPE,
        w_DNIPROFESOR       IN clases.dniprofesor%TYPE,
        w_DNIALUMNO         IN clases.dnialumno%TYPE,
        w_PAGOCLASE         IN clases.pagoclase%TYPE,
        w_OFERTA            IN clases.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_CLASES         CLASES%ROWTYPE;
        w_OID_C             INTEGER;
    BEGIN
    
    INSERT INTO CLASES(TIPOCLASE,TIPOPERMISO,FECHA,HORAINICIO,HORAFIN,DNIPROFESOR,DNIALUMNO,PAGOCLASE,OFERTA) 
                        VALUES (w_TIPOCLASE,w_TIPOPERMISO,w_FECHA,w_HORAINICIO,w_HORAFIN,w_DNIPROFESOR,w_DNIALUMNO,w_PAGOCLASE,w_OFERTA);
    
    w_OID_C := SEC_Clases.CURRVAL;
    SELECT * INTO TIPO_CLASES FROM CLASES WHERE OID_C = w_OID_C;
    IF (TIPO_CLASES.OID_C <> w_OID_C) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_C             IN clases.oid_c%TYPE,
        w_TIPOCLASE         IN clases.tipoclase%TYPE,
        w_TIPOPERMISO       IN clases.tipopermiso%TYPE,
        w_FECHA             IN clases.fecha%TYPE,
        w_HORAINICIO        IN clases.horainicio%TYPE,
        w_HORAFIN           IN clases.horafin%TYPE,
        w_DNIPROFESOR       IN clases.dniprofesor%TYPE,
        w_DNIALUMNO         IN clases.dnialumno%TYPE,
        w_PAGOCLASE         IN clases.pagoclase%TYPE,
        w_OFERTA            IN clases.oferta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_CLASES     CLASES%ROWTYPE;
        
    BEGIN
        UPDATE CLASES
            SET TIPOCLASE = w_TIPOCLASE,
                TIPOPERMISO = w_TIPOPERMISO,
                FECHA = w_FECHA,
                HORAINICIO = w_HORAINICIO,
                HORAFIN = w_HORAFIN,
                DNIPROFESOR = w_DNIPROFESOR,
                DNIALUMNO = w_DNIALUMNO,
                PAGOCLASE = w_PAGOCLASE,
                OFERTA = w_OFERTA
            WHERE OID_C = w_OID_C;
            
        SELECT * INTO TIPO_CLASES FROM CLASES WHERE OID_C = w_OID_C;
        
        IF (TIPO_CLASES.TIPOCLASE <> w_TIPOCLASE
            OR TIPO_CLASES.TIPOPERMISO <> w_TIPOPERMISO
            OR TIPO_CLASES.FECHA <> w_FECHA
            OR TIPO_CLASES.HORAINICIO <> w_HORAINICIO
            OR TIPO_CLASES.HORAFIN <> w_HORAFIN
            OR TIPO_CLASES.DNIPROFESOR <> w_DNIPROFESOR
            OR TIPO_CLASES.DNIALUMNO <> w_DNIALUMNO
            OR TIPO_CLASES.PAGOCLASE <> w_PAGOCLASE
            OR TIPO_CLASES.OFERTA <> w_OFERTA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_OID_C         IN clases.oid_c%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_CLASES        INTEGER;
        
    BEGIN
        DELETE FROM CLASES WHERE OID_C = w_OID_C;
        
        SELECT COUNT(*) INTO N_CLASES FROM CLASES WHERE OID_C = w_OID_C;
        IF (N_CLASES <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_Clases;
/


--Turismos
CREATE OR REPLACE PACKAGE BODY Pruebas_Turismos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Turismos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA         IN turismos.matricula%TYPE,
        w_ESTADO            IN turismos.estado%TYPE,
        w_MODELO            IN turismos.modelo%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_TU             TURISMOS%ROWTYPE;
        
    BEGIN
    
    INSERT INTO TURISMOS(MATRICULA,ESTADO,MODELO) 
                        VALUES (w_MATRICULA,w_ESTADO,w_MODELO);
       
    SELECT * INTO TIPO_TU FROM TURISMOS WHERE MATRICULA = w_MATRICULA;
    IF (TIPO_TU.MATRICULA <> w_MATRICULA) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA         IN turismos.matricula%TYPE,
        w_ESTADO            IN turismos.estado%TYPE,
        w_MODELO            IN turismos.modelo%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_TU         TURISMOS%ROWTYPE;
        
    BEGIN
        UPDATE TURISMOS
            SET ESTADO = w_ESTADO,
                MODELO = w_MODELO
            WHERE MATRICULA = w_MATRICULA;
            
        SELECT * INTO TIPO_TU FROM TURISMOS WHERE MATRICULA = w_MATRICULA;
        
        IF (TIPO_TU.MATRICULA <> w_MATRICULA
            OR TIPO_TU.ESTADO <> w_ESTADO
            OR TIPO_TU.MODELO <> w_MODELO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA         IN turismos.matricula%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_TURISMOS   INTEGER;
        
    BEGIN
        DELETE FROM TURISMOS WHERE MATRICULA = w_MATRICULA;
        
        SELECT COUNT(*) INTO N_TURISMOS FROM TURISMOS WHERE MATRICULA = w_MATRICULA;
        IF (N_TURISMOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_Turismos;
/


--Motocicletas
CREATE OR REPLACE PACKAGE BODY Pruebas_Motocicletas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Motocicletas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA         IN motocicletas.matricula%TYPE,
        w_ESTADO            IN motocicletas.estado%TYPE,
        w_MODELO            IN motocicletas.modelo%TYPE,
        w_CC                IN motocicletas.cc%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_MO             MOTOCICLETAS%ROWTYPE;
    BEGIN
    
    INSERT INTO MOTOCICLETAS(MATRICULA,ESTADO,MODELO,CC) 
                        VALUES (w_MATRICULA,w_ESTADO,w_MODELO,w_CC);
                        
    SELECT * INTO TIPO_MO FROM MOTOCICLETAS WHERE MATRICULA = w_MATRICULA;
    IF (TIPO_MO.MATRICULA <> w_MATRICULA) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA         IN motocicletas.matricula%TYPE,
        w_ESTADO            IN motocicletas.estado%TYPE,
        w_MODELO            IN motocicletas.modelo%TYPE,
        w_CC                IN motocicletas.cc%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_MO         MOTOCICLETAS%ROWTYPE;
        
    BEGIN
        UPDATE MOTOCICLETAS
            SET MATRICULA = w_MATRICULA,
                ESTADO = w_ESTADO,
                MODELO = w_MODELO,
                CC = w_CC
            WHERE MATRICULA = w_MATRICULA;
            
        SELECT * INTO TIPO_MO FROM MOTOCICLETAS WHERE MATRICULA = w_MATRICULA;
        
        IF (TIPO_MO.MATRICULA <> w_MATRICULA
            OR TIPO_MO.ESTADO <> w_ESTADO
            OR TIPO_MO.MODELO <> w_MODELO
            OR TIPO_MO.CC <> w_CC) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_MATRICULA            IN motocicletas.matricula%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_MOTOCICLETAS       INTEGER;
        
    BEGIN
        DELETE FROM MOTOCICLETAS WHERE MATRICULA = w_MATRICULA;
        
        SELECT COUNT(*) INTO N_MOTOCICLETAS FROM MOTOCICLETAS WHERE MATRICULA = w_MATRICULA;
        IF (N_MOTOCICLETAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_Motocicletas;
/


--AlumnoConduceTurismos
CREATE OR REPLACE PACKAGE BODY Pruebas_AlumnoConduceTurismos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM AlumnoConduceTurismos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ALUMNO            IN alumnoconduceturismos.alumno%TYPE,
        w_TURISMO           IN alumnoconduceturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ALCOTU         ALUMNOCONDUCETURISMOS%ROWTYPE;
    BEGIN
    
    INSERT INTO ALUMNOCONDUCETURISMOS(ALUMNO,TURISMO) 
                        VALUES (w_ALUMNO,w_TURISMO);
    SELECT * INTO TIPO_ALCOTU FROM ALUMNOCONDUCETURISMOS WHERE ALUMNO = w_ALUMNO AND TURISMO = w_TURISMO;
    IF (TIPO_ALCOTU.ALUMNO <> w_ALUMNO
        OR TIPO_ALCOTU.TURISMO <> w_TURISMO) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ALUMNO            IN alumnoconduceturismos.alumno%TYPE,
        w_TURISMO           IN alumnoconduceturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ALCOTU     ALUMNOCONDUCETURISMOS%ROWTYPE;
        
    BEGIN
        UPDATE ALUMNOCONDUCETURISMOS
            SET ALUMNO = w_ALUMNO,
                TURISMO = w_TURISMO
            WHERE ALUMNO = w_ALUMNO AND TURISMO = w_TURISMO;
            
        SELECT * INTO TIPO_ALCOTU FROM ALUMNOCONDUCETURISMOS WHERE ALUMNO = w_ALUMNO AND TURISMO = w_TURISMO;
        
        IF (TIPO_ALCOTU.ALUMNO <> w_ALUMNO
            OR TIPO_ALCOTU.TURISMO <> w_TURISMO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_ALUMNO            IN alumnoconduceturismos.alumno%TYPE,
        w_TURISMO           IN alumnoconduceturismos.turismo%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ALUMNOCONDUCETURISMOS        INTEGER;
        
    BEGIN
        DELETE FROM ALUMNOCONDUCETURISMOS WHERE ALUMNO = w_ALUMNO AND TURISMO = w_TURISMO;
        
        SELECT COUNT(*) INTO N_ALUMNOCONDUCETURISMOS FROM ALUMNOCONDUCETURISMOS WHERE ALUMNO = w_ALUMNO AND TURISMO = w_TURISMO;
        IF (N_ALUMNOCONDUCETURISMOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_AlumnoConduceTurismos;
/


--AlumnoConduceMotocicletas
CREATE OR REPLACE PACKAGE BODY Pruebas_AlumnoConduceMotos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM AlumnoConduceMotocicletas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ALUMNO            IN alumnoconducemotocicletas.alumno%TYPE,
        w_MOTOCICLETA       IN alumnoconducemotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ALCOMO         ALUMNOCONDUCEMOTOCICLETAS%ROWTYPE;
    BEGIN
    
    INSERT INTO ALUMNOCONDUCEMOTOCICLETAS(ALUMNO,MOTOCICLETA) 
                        VALUES (w_ALUMNO,w_MOTOCICLETA);
    SELECT * INTO TIPO_ALCOMO FROM ALUMNOCONDUCEMOTOCICLETAS WHERE ALUMNO = w_ALUMNO AND MOTOCICLETA = w_MOTOCICLETA;
    IF (TIPO_ALCOMO.ALUMNO <> w_ALUMNO
        OR TIPO_ALCOMO.MOTOCICLETA <> w_MOTOCICLETA) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_ALUMNO            IN alumnoconducemotocicletas.alumno%TYPE,
        w_MOTOCICLETA       IN alumnoconducemotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ALCOMO     ALUMNOCONDUCEMOTOCICLETAS%ROWTYPE;
        
    BEGIN
        UPDATE ALUMNOCONDUCEMOTOCICLETAS
            SET ALUMNO = w_ALUMNO,
                MOTOCICLETA = w_MOTOCICLETA
            WHERE ALUMNO = w_ALUMNO AND MOTOCICLETA = w_MOTOCICLETA;
            
        SELECT * INTO TIPO_ALCOMO FROM ALUMNOCONDUCEMOTOCICLETAS WHERE ALUMNO = w_ALUMNO AND MOTOCICLETA = w_MOTOCICLETA;
        
        IF (TIPO_ALCOMO.ALUMNO <> w_ALUMNO
            OR TIPO_ALCOMO.MOTOCICLETA <> w_MOTOCICLETA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA    VARCHAR2,
        w_ALUMNO        IN alumnoconducemotocicletas.alumno%TYPE,
        w_MOTOCICLETA   IN alumnoconducemotocicletas.motocicleta%TYPE,
        SALIDAESPERADA  BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ALUMNOCONDUCEMOTOCICLETAS        INTEGER;
        
    BEGIN
        DELETE FROM ALUMNOCONDUCEMOTOCICLETAS WHERE ALUMNO = w_ALUMNO AND MOTOCICLETA = w_MOTOCICLETA;
        
        SELECT COUNT(*) INTO N_ALUMNOCONDUCEMOTOCICLETAS FROM ALUMNOCONDUCEMOTOCICLETAS WHERE ALUMNO = w_ALUMNO AND MOTOCICLETA = w_MOTOCICLETA;
        IF (N_ALUMNOCONDUCEMOTOCICLETAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_AlumnoConduceMotos;
/


--SegurosTurismos
CREATE OR REPLACE PACKAGE BODY Pruebas_SegurosTurismos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM SegurosTurismos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_COMPAÑIA          IN segurosturismos.compañia%TYPE,
        w_TIPOSEGURO        IN segurosturismos.tiposeguro%TYPE,
        w_FECHACONTRATO     IN segurosturismos.fechacontrato%TYPE,
        w_TIPOCUOTA         IN segurosturismos.tipocuota%TYPE,
        w_IMPORTECUOTA      IN segurosturismos.importecuota%TYPE,
        w_TURISMO           IN segurosturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ST             SEGUROSTURISMOS%ROWTYPE;
        w_OID_ST            INTEGER;
        
    BEGIN
    
    INSERT INTO SEGUROSTURISMOS(COMPAÑIA,TIPOSEGURO,FECHACONTRATO,TIPOCUOTA,IMPORTECUOTA,TURISMO) 
                        VALUES (w_COMPAÑIA,w_TIPOSEGURO,w_FECHACONTRATO,w_TIPOCUOTA,w_IMPORTECUOTA,w_TURISMO);
       
    w_OID_ST := SEC_SegurosTurismos.CURRVAL;
    SELECT * INTO TIPO_ST FROM SEGUROSTURISMOS WHERE OID_ST = w_OID_ST;
    IF (TIPO_ST.OID_ST <> w_OID_ST) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_ST            IN segurosturismos.oid_st%TYPE,
        w_COMPAÑIA          IN segurosturismos.compañia%TYPE,
        w_TIPOSEGURO        IN segurosturismos.tiposeguro%TYPE,
        w_FECHACONTRATO     IN segurosturismos.fechacontrato%TYPE,
        w_TIPOCUOTA         IN segurosturismos.tipocuota%TYPE,
        w_IMPORTECUOTA      IN segurosturismos.importecuota%TYPE,
        w_TURISMO           IN segurosturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ST         SEGUROSTURISMOS%ROWTYPE;
        
    BEGIN
        UPDATE SEGUROSTURISMOS
            SET COMPAÑIA = w_COMPAÑIA,
                TIPOSEGURO = w_TIPOSEGURO,
                FECHACONTRATO = w_FECHACONTRATO,
                TIPOCUOTA = w_TIPOCUOTA,
                IMPORTECUOTA = w_IMPORTECUOTA,
                TURISMO = w_TURISMO
            WHERE OID_ST = w_OID_ST;
            
        SELECT * INTO TIPO_ST FROM SEGUROSTURISMOS WHERE OID_ST = w_OID_ST;
        
        IF (TIPO_ST.COMPAÑIA <> w_COMPAÑIA
            OR TIPO_ST.TIPOSEGURO <> w_TIPOSEGURO
            OR TIPO_ST.FECHACONTRATO <> w_FECHACONTRATO
            OR TIPO_ST.TIPOCUOTA <> w_TIPOCUOTA
            OR TIPO_ST.IMPORTECUOTA <> w_IMPORTECUOTA
            OR TIPO_ST.TURISMO <> w_TURISMO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_ST            IN segurosturismos.oid_st%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_SEGUROSTURISMOS   INTEGER;
        
    BEGIN
        DELETE FROM SEGUROSTURISMOS WHERE OID_ST = w_OID_ST;
        
        SELECT COUNT(*) INTO N_SEGUROSTURISMOS FROM SEGUROSTURISMOS WHERE OID_ST = w_OID_ST;
        IF (N_SEGUROSTURISMOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_SegurosTurismos;
/


--SegurosMotocicletas
CREATE OR REPLACE PACKAGE BODY Pruebas_SegurosMotocicletas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM SegurosMotocicletas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_COMPAÑIA          IN segurosmotocicletas.compañia%TYPE,
        w_TIPOSEGURO        IN segurosmotocicletas.tiposeguro%TYPE,
        w_FECHACONTRATO     IN segurosmotocicletas.fechacontrato%TYPE,
        w_TIPOCUOTA         IN segurosmotocicletas.tipocuota%TYPE,
        w_IMPORTECUOTA      IN segurosmotocicletas.importecuota%TYPE,
        w_MOTOCICLETA       IN segurosmotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_SM             SEGUROSMOTOCICLETAS%ROWTYPE;
        w_OID_SM            INTEGER;
        
    BEGIN
    
    INSERT INTO SEGUROSMOTOCICLETAS(COMPAÑIA,TIPOSEGURO,FECHACONTRATO,TIPOCUOTA,IMPORTECUOTA,MOTOCICLETA) 
                        VALUES (w_COMPAÑIA,w_TIPOSEGURO,w_FECHACONTRATO,w_TIPOCUOTA,w_IMPORTECUOTA,w_MOTOCICLETA);
       
    w_OID_SM := SEC_SegurosMotocicletas.CURRVAL;
    SELECT * INTO TIPO_SM FROM SEGUROSMOTOCICLETAS WHERE OID_SM = w_OID_SM;
    IF (TIPO_SM.OID_SM <> w_OID_SM) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_SM            IN segurosmotocicletas.oid_sm%TYPE,
        w_COMPAÑIA          IN segurosmotocicletas.compañia%TYPE,
        w_TIPOSEGURO        IN segurosmotocicletas.tiposeguro%TYPE,
        w_FECHACONTRATO     IN segurosmotocicletas.fechacontrato%TYPE,
        w_TIPOCUOTA         IN segurosmotocicletas.tipocuota%TYPE,
        w_IMPORTECUOTA      IN segurosmotocicletas.importecuota%TYPE,
        w_MOTOCICLETA       IN segurosmotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_SM         SEGUROSMOTOCICLETAS%ROWTYPE;
        
    BEGIN
        UPDATE SEGUROSMOTOCICLETAS
            SET COMPAÑIA = w_COMPAÑIA,
                TIPOSEGURO = w_TIPOSEGURO,
                FECHACONTRATO = w_FECHACONTRATO,
                TIPOCUOTA = w_TIPOCUOTA,
                IMPORTECUOTA = w_IMPORTECUOTA,
                MOTOCICLETA = w_MOTOCICLETA
            WHERE OID_SM = w_OID_SM;
            
        SELECT * INTO TIPO_SM FROM SEGUROSMOTOCICLETAS WHERE OID_SM = w_OID_SM;
        
        IF (TIPO_SM.COMPAÑIA <> w_COMPAÑIA
            OR TIPO_SM.TIPOSEGURO <> w_TIPOSEGURO
            OR TIPO_SM.FECHACONTRATO <> w_FECHACONTRATO
            OR TIPO_SM.TIPOCUOTA <> w_TIPOCUOTA
            OR TIPO_SM.IMPORTECUOTA <> w_IMPORTECUOTA
            OR TIPO_SM.MOTOCICLETA <> w_MOTOCICLETA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_SM            IN segurosmotocicletas.oid_sm%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_SEGUROSMOTOCICLETAS   INTEGER;
        
    BEGIN
        DELETE FROM SEGUROSMOTOCICLETAS WHERE OID_SM = w_OID_SM;
        
        SELECT COUNT(*) INTO N_SEGUROSMOTOCICLETAS FROM SEGUROSMOTOCICLETAS WHERE OID_SM = w_OID_SM;
        IF (N_SEGUROSMOTOCICLETAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_SegurosMotocicletas;
/


--ITVTurismos
CREATE OR REPLACE PACKAGE BODY Pruebas_ITVTurismos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ITVTurismos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN itvturismos.fecha%TYPE,
        w_FECHAEXPIRA       IN itvturismos.fechaexpira%TYPE,
        w_COSTE             IN itvturismos.coste%TYPE,
        w_REVISION          IN itvturismos.revision%TYPE,
        w_TURISMO           IN itvturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ITVT           ITVTURISMOS%ROWTYPE;
        w_OID_IT            INTEGER;
    BEGIN
    
    INSERT INTO ITVTURISMOS(FECHA,FECHAEXPIRA,COSTE,REVISION,TURISMO) 
                        VALUES (w_FECHA,w_FECHAEXPIRA,w_COSTE,w_REVISION,w_TURISMO);
                        
    w_OID_IT := SEC_ITVTurismos.CURRVAL;
    SELECT * INTO TIPO_ITVT FROM ITVTURISMOS WHERE OID_IT = w_OID_IT;
    IF (TIPO_ITVT.OID_IT <> w_OID_IT) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_IT            IN itvturismos.oid_it%TYPE,
        w_FECHA             IN itvturismos.fecha%TYPE,
        w_FECHAEXPIRA       IN itvturismos.fechaexpira%TYPE,
        w_COSTE             IN itvturismos.coste%TYPE,
        w_REVISION          IN itvturismos.revision%TYPE,
        w_TURISMO           IN itvturismos.turismo%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ITVT       ITVTURISMOS%ROWTYPE;
        
    BEGIN
        UPDATE ITVTURISMOS
            SET FECHA = w_FECHA,
                FECHAEXPIRA = w_FECHAEXPIRA,
                COSTE = w_COSTE,
                REVISION = w_REVISION,
                TURISMO = w_TURISMO
            WHERE OID_IT = w_OID_IT;
            
        SELECT * INTO TIPO_ITVT FROM ITVTURISMOS WHERE OID_IT = w_OID_IT;
        
        IF (TIPO_ITVT.FECHA <> w_FECHA
            OR TIPO_ITVT.FECHAEXPIRA <> w_FECHAEXPIRA
            OR TIPO_ITVT.COSTE <> w_COSTE
            OR TIPO_ITVT.REVISION <> w_REVISION
            OR TIPO_ITVT.TURISMO <> w_TURISMO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_IT            IN itvturismos.oid_it%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ITVTURISMOS       INTEGER;
        
    BEGIN
        DELETE FROM ITVTURISMOS WHERE OID_IT = w_OID_IT;
        
        SELECT COUNT(*) INTO N_ITVTURISMOS FROM ITVTURISMOS WHERE OID_IT = w_OID_IT;
        IF (N_ITVTURISMOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_ITVTurismos;
/


--ITVMotocicletas
CREATE OR REPLACE PACKAGE BODY Pruebas_ITVMotocicletas AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ITVMotocicletas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_FECHA             IN itvmotocicletas.fecha%TYPE,
        w_FECHAEXPIRA       IN itvmotocicletas.fechaexpira%TYPE,
        w_COSTE             IN itvmotocicletas.coste%TYPE,
        w_REVISION          IN itvmotocicletas.revision%TYPE,
        w_MOTOCICLETA       IN itvmotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_ITVM           ITVMOTOCICLETAS%ROWTYPE;
        w_OID_IM            INTEGER;
    BEGIN
    
    INSERT INTO ITVMOTOCICLETAS(FECHA,FECHAEXPIRA,COSTE,REVISION,MOTOCICLETA) 
                        VALUES (w_FECHA,w_FECHAEXPIRA,w_COSTE,w_REVISION,w_MOTOCICLETA);
                        
    w_OID_IM := SEC_ITVMotocicletas.CURRVAL;
    SELECT * INTO TIPO_ITVM FROM ITVMOTOCICLETAS WHERE OID_IM = w_OID_IM;
    IF (TIPO_ITVM.OID_IM <> w_OID_IM) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_IM            IN itvmotocicletas.oid_IM%TYPE,
        w_FECHA             IN itvmotocicletas.fecha%TYPE,
        w_FECHAEXPIRA       IN itvmotocicletas.fechaexpira%TYPE,
        w_COSTE             IN itvmotocicletas.coste%TYPE,
        w_REVISION          IN itvmotocicletas.revision%TYPE,
        w_MOTOCICLETA       IN itvmotocicletas.motocicleta%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_ITVM       ITVMOTOCICLETAS%ROWTYPE;
        
    BEGIN
        UPDATE ITVMOTOCICLETAS
            SET FECHA = w_FECHA,
                FECHAEXPIRA = w_FECHAEXPIRA,
                COSTE = w_COSTE,
                REVISION = w_REVISION,
                MOTOCICLETA = w_MOTOCICLETA
            WHERE OID_IM = w_OID_IM;
            
        SELECT * INTO TIPO_ITVM FROM ITVMOTOCICLETAS WHERE OID_IM = w_OID_IM;
        
        IF (TIPO_ITVM.FECHA <> w_FECHA
            OR TIPO_ITVM.FECHAEXPIRA <> w_FECHAEXPIRA
            OR TIPO_ITVM.COSTE <> w_COSTE
            OR TIPO_ITVM.REVISION <> w_REVISION
            OR TIPO_ITVM.MOTOCICLETA <> w_MOTOCICLETA) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_IM            IN itvmotocicletas.oid_im%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_ITVMOTOCICLETAS       INTEGER;
        
    BEGIN
        DELETE FROM ITVMOTOCICLETAS WHERE OID_IM = w_OID_IM;
        
        SELECT COUNT(*) INTO N_ITVMOTOCICLETAS FROM ITVMOTOCICLETAS WHERE OID_IM = w_OID_IM;
        IF (N_ITVMOTOCICLETAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_ITVMotocicletas;
/


--Talleres
CREATE OR REPLACE PACKAGE BODY Pruebas_Talleres AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM Talleres;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_NOMBRE            IN talleres.nombre%TYPE,
        w_DIRECCION         IN talleres.direccion%TYPE,
        w_TELEFONO          IN talleres.telefono%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_TAL            TALLERES%ROWTYPE;
        
    BEGIN
    
    INSERT INTO TALLERES(NOMBRE,DIRECCION,TELEFONO) 
                        VALUES (w_NOMBRE,w_DIRECCION,w_TELEFONO);
       
    SELECT * INTO TIPO_TAL FROM TALLERES WHERE NOMBRE = w_NOMBRE;
    IF (TIPO_TAL.NOMBRE <> w_NOMBRE) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_NOMBRE            IN talleres.nombre%TYPE,
        w_DIRECCION         IN talleres.direccion%TYPE,
        w_TELEFONO          IN talleres.telefono%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_TAL        TALLERES%ROWTYPE;
        
    BEGIN
        UPDATE TALLERES
            SET DIRECCION = w_DIRECCION,
                TELEFONO = w_TELEFONO
            WHERE NOMBRE = w_NOMBRE;
            
        SELECT * INTO TIPO_TAL FROM TALLERES WHERE NOMBRE = w_NOMBRE;
        
        IF (TIPO_TAL.NOMBRE <> w_NOMBRE
            OR TIPO_TAL.DIRECCION <> w_DIRECCION
            OR TIPO_TAL.TELEFONO <> w_TELEFONO) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_NOMBRE            IN talleres.nombre%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_TALLERES   INTEGER;
        
    BEGIN
        DELETE FROM TALLERES WHERE NOMBRE = w_NOMBRE;
        
        SELECT COUNT(*) INTO N_TALLERES FROM TALLERES WHERE NOMBRE = w_NOMBRE;
        IF (N_TALLERES <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_Talleres;
/


--ReparacionesTurismos
CREATE OR REPLACE PACKAGE BODY Pruebas_ReparacionesTurismos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ReparacionesTurismos;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DESCRIPCION       IN reparacionesturismos.descripcion%TYPE,
        w_FECHA             IN reparacionesturismos.fecha%TYPE,
        w_COSTE             IN reparacionesturismos.coste%TYPE,
        w_TURISMO           IN reparacionesturismos.turismo%TYPE,
        w_TALLER            IN reparacionesturismos.taller%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_RTU            REPARACIONESTURISMOS%ROWTYPE;
        w_OID_RT            INTEGER;
        
    BEGIN
    
    INSERT INTO REPARACIONESTURISMOS(DESCRIPCION,FECHA,COSTE,TURISMO,TALLER) 
                        VALUES (w_DESCRIPCION,w_FECHA,w_COSTE,w_TURISMO,w_TALLER);
       
    w_OID_RT := SEC_ReparacionesTurismos.CURRVAL;
    SELECT * INTO TIPO_RTU FROM REPARACIONESTURISMOS WHERE OID_RT = w_OID_RT;
    IF (TIPO_RTU.OID_RT <> w_OID_RT) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_RT            IN reparacionesturismos.oid_rt%TYPE,
        w_DESCRIPCION       IN reparacionesturismos.descripcion%TYPE,
        w_FECHA             IN reparacionesturismos.fecha%TYPE,
        w_COSTE             IN reparacionesturismos.coste%TYPE,
        w_TURISMO           IN reparacionesturismos.turismo%TYPE,
        w_TALLER            IN reparacionesturismos.taller%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_RTU        REPARACIONESTURISMOS%ROWTYPE;
        
    BEGIN
        UPDATE REPARACIONESTURISMOS
            SET DESCRIPCION = w_DESCRIPCION,
                FECHA = w_FECHA,
                COSTE = w_COSTE,
                TURISMO = w_TURISMO,
                TALLER = w_TALLER
            WHERE OID_RT = w_OID_RT;
            
        SELECT * INTO TIPO_RTU FROM REPARACIONESTURISMOS WHERE OID_RT = w_OID_RT;
        
        IF (TIPO_RTU.DESCRIPCION <> w_DESCRIPCION
            OR TIPO_RTU.FECHA <> w_FECHA
            OR TIPO_RTU.COSTE <> w_COSTE
            OR TIPO_RTU.TURISMO <> w_TURISMO
            OR TIPO_RTU.TALLER <> w_TALLER) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_RT            IN reparacionesturismos.oid_rt%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_REPARACIONESTURISMOS   INTEGER;
        
    BEGIN
        DELETE FROM REPARACIONESTURISMOS WHERE OID_RT = w_OID_RT;
        
        SELECT COUNT(*) INTO N_REPARACIONESTURISMOS FROM REPARACIONESTURISMOS WHERE OID_RT = w_OID_RT;
        IF (N_REPARACIONESTURISMOS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
      
    
END Pruebas_ReparacionesTurismos;
/


--ReparacionesMotocicletas
CREATE OR REPLACE PACKAGE BODY Pruebas_ReparacionesMotos AS
    
    /* INICIALIZACION */
    PROCEDURE inicializar AS
    BEGIN
        /* Borrar contenido de la tabla */
        DELETE FROM ReparacionesMotocicletas;
    END inicializar;
    
    
    PROCEDURE INSERTAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_DESCRIPCION       IN reparacionesmotocicletas.descripcion%TYPE,
        w_FECHA             IN reparacionesmotocicletas.fecha%TYPE,
        w_COSTE             IN reparacionesmotocicletas.coste%TYPE,
        w_MOTOCICLETA       IN reparacionesmotocicletas.motocicleta%TYPE,
        w_TALLER            IN reparacionesmotocicletas.taller%TYPE,
        SALIDAESPERADA      BOOLEAN
    ) AS
        SALIDA              BOOLEAN := TRUE;
        TIPO_RMO            REPARACIONESMOTOCICLETAS%ROWTYPE;
        w_OID_RM            INTEGER;
        
    BEGIN
    
    INSERT INTO REPARACIONESMOTOCICLETAS(DESCRIPCION,FECHA,COSTE,MOTOCICLETA,TALLER) 
                        VALUES (w_DESCRIPCION,w_FECHA,w_COSTE,w_MOTOCICLETA,w_TALLER);
       
    w_OID_RM := SEC_ReparacionesMotocicletas.CURRVAL;
    SELECT * INTO TIPO_RMO FROM REPARACIONESMOTOCICLETAS WHERE OID_RM = w_OID_RM;
    IF (TIPO_RMO.OID_RM <> w_OID_RM) THEN
        SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END INSERTAR;
    
    PROCEDURE ACTUALIZAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_RM            IN reparacionesmotocicletas.oid_rm%TYPE,
        w_DESCRIPCION       IN reparacionesmotocicletas.descripcion%TYPE,
        w_FECHA             IN reparacionesmotocicletas.fecha%TYPE,
        w_COSTE             IN reparacionesmotocicletas.coste%TYPE,
        w_MOTOCICLETA       IN reparacionesmotocicletas.motocicleta%TYPE,
        w_TALLER            IN reparacionesmotocicletas.taller%TYPE,
        SALIDAESPERADA      BOOLEAN
    )
    AS
        SALIDA          BOOLEAN := TRUE;
        TIPO_RMO        REPARACIONESMOTOCICLETAS%ROWTYPE;
        
    BEGIN
        UPDATE REPARACIONESMOTOCICLETAS
            SET DESCRIPCION = w_DESCRIPCION,
                FECHA = w_FECHA,
                COSTE = w_COSTE,
                MOTOCICLETA = w_MOTOCICLETA,
                TALLER = w_TALLER
            WHERE OID_RM = w_OID_RM;
            
        SELECT * INTO TIPO_RMO FROM REPARACIONESMOTOCICLETAS WHERE OID_RM = w_OID_RM;
        
        IF (TIPO_RMO.DESCRIPCION <> w_DESCRIPCION
            OR TIPO_RMO.FECHA <> w_FECHA
            OR TIPO_RMO.COSTE <> w_COSTE
            OR TIPO_RMO.MOTOCICLETA <> w_MOTOCICLETA
            OR TIPO_RMO.TALLER <> w_TALLER) THEN
            
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ACTUALIZAR;
    
    PROCEDURE ELIMINAR(
        NOMBRE_PRUEBA        VARCHAR2,
        w_OID_RM            IN reparacionesmotocicletas.oid_rm%TYPE,
        SALIDAESPERADA      BOOLEAN)  
    AS
        SALIDA          BOOLEAN := TRUE;
        N_REPARACIONESMOTOCICLETAS   INTEGER;
        
    BEGIN
        DELETE FROM REPARACIONESMOTOCICLETAS WHERE OID_RM = w_OID_RM;
        
        SELECT COUNT(*) INTO N_REPARACIONESMOTOCICLETAS FROM REPARACIONESMOTOCICLETAS WHERE OID_RM = w_OID_RM;
        IF (N_REPARACIONESMOTOCICLETAS <> 0) THEN
            SALIDA := FALSE;
        END IF;
        COMMIT WORK;
                
        DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(SALIDA, SALIDAESPERADA));
                
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(NOMBRE_PRUEBA || ': ' || ASSERT_EQUALS(FALSE, SALIDAESPERADA));
            ROLLBACK;
    END ELIMINAR;
    
    
END Pruebas_ReparacionesMotos;
/