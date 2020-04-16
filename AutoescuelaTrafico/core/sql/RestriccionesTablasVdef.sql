-- RESTRICCIONES

ALTER TABLE WebTests ADD CONSTRAINT RE_Estado_WebTests CHECK (Estado IN ('Online','Offline')); 

ALTER TABLE AccesoWeb ADD CONSTRAINT RE_USR_AccesoWeb CHECK (REGEXP_LIKE(USUARIO, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));

ALTER TABLE Alumnos ADD CONSTRAINT RE_DNI_Alumnos CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Alumnos ADD CONSTRAINT RE_Telefono_Alumnos CHECK (REGEXP_LIKE(Telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')); 
ALTER TABLE Alumnos ADD CONSTRAINT RE_RecMedico_Alumnos CHECK (ReconocimientoMedico IN ('Valido', 'No valido'));

ALTER TABLE PagoClases ADD CONSTRAINT RE_Importe_PagoClases CHECK (Importe>0);

ALTER TABLE Ordenadores ADD CONSTRAINT RE_EstadoPC_Ordenadores CHECK (EstadoPC IN ('Nuevo', 'BuenEstado', 'Aceptable', 'MalEstado', 'Inutilizable'));

ALTER TABLE UsoPC ADD CONSTRAINT RE_HoraComienzo_UsoPC CHECK (REGEXP_LIKE(HoraComienzo,'[0-2][0-9]:[0-5][0-9]'));
ALTER TABLE UsoPC ADD CONSTRAINT RE_HoraFin_UsoPC CHECK (REGEXP_LIKE(HoraFin,'[0-2][0-9]:[0-5][0-9]'));

ALTER TABLE ExamenesPracticoCirculacion ADD CONSTRAINT RE_Calificacion_ExamPractCirc CHECK (Calificacion IN ('Apto', 'No Apto'));
ALTER TABLE ExamenesPracticoCirculacion ADD CONSTRAINT RE_OID_EPC_ExamPractCirc CHECK (REGEXP_LIKE(OID_EPC, 'EPC[1-99999]'));
ALTER TABLE ExamenesPracticoCirculacion ADD CONSTRAINT RE_Faltas_ExamenPractCirc CHECK (FaltasLeves<=10 AND FaltasDeficientes<=2 AND FaltasEliminatorias<=1);

ALTER TABLE ExamenesPracticoPista ADD CONSTRAINT RE_Calificacion_ExamPractPista CHECK (Calificacion IN ('Apto', 'No Apto'));
ALTER TABLE ExamenesPracticoPista ADD CONSTRAINT RE_OID_EPP_ExamPractPista CHECK (REGEXP_LIKE(OID_EPP, 'EPP[1-99999]'));
ALTER TABLE ExamenesPracticoPista ADD CONSTRAINT RE_Faltas_ExamenPractPista CHECK (FaltasLeves<=10 AND FaltasDeficientes<=2 AND FaltasEliminatorias<=1);

ALTER TABLE ExamenesTeoricos ADD CONSTRAINT RE_Calificacion_ExamTeoricos CHECK (Calificacion IN ('Apto', 'No Apto'));
ALTER TABLE ExamenesTeoricos ADD CONSTRAINT RE_nFallos_ExamenesTeoricos CHECK (nFallos <=30);
ALTER TABLE ExamenesTeoricos ADD CONSTRAINT RE_OID_ET_ExamTeoricos CHECK (REGEXP_LIKE(OID_ET, 'ET[1-99999]'));

ALTER TABLE Oferta ADD CONSTRAINT RE_Precio_Oferta CHECK (Precio>0);

ALTER TABLE Matriculas ADD CONSTRAINT RE_PermisoMatriculado CHECK (PermisoMatriculado IN ('Permiso B','Permiso A2'));

ALTER TABLE PagoTasas ADD CONSTRAINT RE_Importe_PagoTasas CHECK (Importe>0);

ALTER TABLE Tasas ADD CONSTRAINT RE_Importe_Tasas CHECK (Importe>0);
ALTER TABLE Tasas ADD CONSTRAINT RE_Codigo_Tasas CHECK (REGEXP_LIKE(Codigo,'^([1-5]\.[1-7])(\.[1-4])?$'));

ALTER TABLE Profesores ADD CONSTRAINT RE_DNI_Profesores CHECK (REGEXP_LIKE(DNI,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Profesores ADD CONSTRAINT RE_Telefono_Profesores CHECK (REGEXP_LIKE(Telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')); 
ALTER TABLE Profesores ADD CONSTRAINT RE_Salario_Profesores CHECK(Salario>0);
ALTER TABLE Profesores ADD CONSTRAINT RE_Nss_Profesores CHECK (REGEXP_LIKE(Nss, '[0-9][0-9] [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));

ALTER TABLE Permisos ADD CONSTRAINT RE_TipoPermiso_Permisos CHECK (TipoPermiso IN ('Permiso B','Permiso A2'));

ALTER TABLE Clases ADD CONSTRAINT RE_TipoClase_Clases CHECK (TipoClase IN ('Simple en pista', 'Doble en pista','Simple circulacion', 'Doble circulacion'));
ALTER TABLE Clases ADD CONSTRAINT RE_TipoPermiso_Clases CHECK (TipoPermiso IN ('Permiso B', 'Permiso A2'));
ALTER TABLE Clases ADD CONSTRAINT RE_HoraInicio_Clases CHECK (REGEXP_LIKE(HoraInicio, '[0-2][0-9]:[0-5][0-9]'));
ALTER TABLE Clases ADD CONSTRAINT RE_HoraFin_Clases CHECK (REGEXP_LIKE(HoraFin, '[0-2][0-9]:[0-5][0-9]'));
ALTER TABLE Clases ADD CONSTRAINT RE_Pago_Oferta CHECK (PagoClase IS NOT NULL AND OFERTA IS NULL OR PAGOCLASE IS NULL AND Oferta IS NOT NULL);

ALTER TABLE Turismos ADD CONSTRAINT RE_Matricula_Turismos CHECK (REGEXP_LIKE(Matricula, '[0-9][0-9][0-9][0-9] [A-Z][A-Z][A-Z]'));
ALTER TABLE Turismos ADD CONSTRAINT RE_Estado_Turismos CHECK (Estado IN ('Averiado', 'EnTaller', 'ListoParaSuUso'));

ALTER TABLE Motocicletas ADD CONSTRAINT RE_Matricula_Motocicletas CHECK (REGEXP_LIKE(Matricula, '[0-9][0-9][0-9][0-9] [A-Z][A-Z][A-Z]'));
ALTER TABLE Motocicletas ADD CONSTRAINT RE_Estado_Motocicletas CHECK (Estado IN ('Averiado', 'EnTaller', 'ListoParaSuUso'));

ALTER TABLE SegurosTurismos ADD CONSTRAINT RE_ImporteCuota_SegurosT CHECK (ImporteCuota>0);
ALTER TABLE SegurosTurismos ADD CONSTRAINT RE_TipoSeguro_SegurosT CHECK (TipoSeguro IN ('Terceros', 'TercerosAmpliado', 'TercerosCompleto','TodoRiesgo'));
ALTER TABLE SegurosTurismos ADD CONSTRAINT RE_TipoCuota_SegurosT CHECK (TipoCuota IN ('Mensual', 'Trimestral', 'Semestral', 'Anual'));

ALTER TABLE SegurosMotocicletas ADD CONSTRAINT RE_ImporteCuota_SegurosM CHECK (ImporteCuota>0);
ALTER TABLE SegurosMotocicletas ADD CONSTRAINT RE_TipoSeguro_SegurosM CHECK (TipoSeguro IN ('Terceros', 'TercerosAmpliado', 'TercerosCompleto','TodoRiesgo'));
ALTER TABLE SegurosMotocicletas ADD CONSTRAINT RE_TipoCuota_SegurosM CHECK (TipoCuota IN ('Mensual', 'Trimestral', 'Semestral', 'Anual'));

ALTER TABLE ITVTurismos ADD CONSTRAINT RE_Coste_ITVT CHECK (Coste>0);
ALTER TABLE ITVTurismos ADD CONSTRAINT RE_Revision_ITVT CHECK(Revision IN ('Favorable', 'Desfavorable', 'Negativa'));
ALTER TABLE ITVTurismos ADD CONSTRAINT RE_FechaITVT CHECK (Fecha<FechaExpira);

ALTER TABLE ITVMotocicletas ADD CONSTRAINT RE_Coste_ITVM CHECK (Coste>0);
ALTER TABLE ITVMotocicletas ADD CONSTRAINT RE_Revision_ITVM CHECK(Revision IN ('Favorable', 'Desfavorable', 'Negativa'));
ALTER TABLE ITVMotocicletas ADD CONSTRAINT RE_FechaITVM CHECK (Fecha<FechaExpira);

ALTER TABLE Talleres ADD CONSTRAINT RE_Telefono_Talleres CHECK (REGEXP_LIKE(Telefono, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));

ALTER TABLE ReparacionesTurismos ADD CONSTRAINT RE_Coste_ReparacionesT CHECK (Coste>0);

ALTER TABLE ReparacionesMotocicletas ADD CONSTRAINT RE_Coste_ReparacionesM CHECK (Coste>0);

ALTER TABLE Login ADD CONSTRAINT RE_Login_TIPO CHECK (Tipo IN ('Profesor', 'Alumno', 'Administrador'));
ALTER TABLE Login ADD CONSTRAINT RE_DNI_Login CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));