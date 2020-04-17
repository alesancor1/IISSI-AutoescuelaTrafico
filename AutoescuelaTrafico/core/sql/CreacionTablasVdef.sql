--CREACION DE TABLAS

CREATE TABLE WebTests(
    OID_W NUMBER NOT NULL,
    Estado VARCHAR2(7) NOT NULL,
    
    PRIMARY KEY (OID_W)
);

CREATE TABLE AccesoWeb (
    Usuario VARCHAR2(20) NOT NULL,
    ClavePorDefecto VARCHAR2(20),
    FechaRenovacion DATE,
    FechaCaducidad DATE,
    Web NUMBER NOT NULL,
    
    PRIMARY KEY(Usuario),
    CONSTRAINT AccesoWeb_Web_FK FOREIGN KEY(Web) REFERENCES WebTests(OID_W) ON DELETE CASCADE
);

CREATE TABLE Alumnos (
    DNI VARCHAR2(9) NOT NULL,
    Nombre VARCHAR2(20) NOT NULL,
    Apellidos VARCHAR2(30) NOT NULL,
    Telefono VARCHAR2(9),
    ClasesPagadas NUMBER,
    FechaNacimiento DATE NOT NULL,
    ReconocimientoMedico VARCHAR2(9),
    AccesoWeb VARCHAR2(20),
    
    PRIMARY KEY (DNI),
    CONSTRAINT Alumnos_AccesoWeb_FK FOREIGN KEY(AccesoWeb) REFERENCES AccesoWeb(Usuario) ON DELETE SET NULL
);

CREATE TABLE PagoClases (
    OID_PaC NUMBER NOT NULL,
    Alumno VARCHAR2(9) NOT NULL,
    Fecha DATE,
    Importe NUMBER,
    Cantidad NUMBER,
    
    PRIMARY KEY (OID_PaC),
    
    CONSTRAINT PagoClases_alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE
);

CREATE TABLE Ordenadores (
    OID_PC NUMBER NOT NULL,
    EstadoPC VARCHAR2(20) NOT NULL,
    Modelo VARCHAR2(20) NOT NULL,
    SO VARCHAR2(20) NOT NULL,
    
    PRIMARY KEY (OID_PC)    
);

CREATE TABLE UsoPC (
    OID_U NUMBER NOT NULL,
    Fecha DATE,
    HoraComienzo VARCHAR2(5),
    HoraFin VARCHAR2(5),
    Alumno VARCHAR2(9) NOT NULL,
    PC NUMBER NOT NULL,
    
    PRIMARY KEY (OID_U),
    
    CONSTRAINT usopc_alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE,
    CONSTRAINT usopc_ordenadores_FK FOREIGN KEY(PC) REFERENCES Ordenadores(OID_PC) ON DELETE CASCADE
);

CREATE TABLE ExamenesPracticoCirculacion (
    OID_EPC VARCHAR2(10) NOT NULL,
    Fecha DATE NOT NULL,
    Alumno VARCHAR2(9) NOT NULL,
    Calificacion VARCHAR2(8),
    FaltasLeves NUMBER,
    FaltasDeficientes NUMBER,
    FaltasEliminatorias NUMBER,
    
    PRIMARY KEY (OID_EPC),
    CONSTRAINT EPC_Alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE
);

CREATE TABLE ExamenesPracticoPista (
    OID_EPP VARCHAR2(10) NOT NULL,
    Fecha DATE NOT NULL,
    Alumno VARCHAR2(9) NOT NULL,
    Calificacion VARCHAR2(8),
    FaltasLeves NUMBER,
    FaltasDeficientes NUMBER,
    FaltasEliminatorias NUMBER,
    
    PRIMARY KEY (OID_EPP),
    CONSTRAINT EPP_Alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE
);

CREATE TABLE ExamenesTeoricos (
    OID_ET VARCHAR2(10) NOT NULL,
    Fecha DATE NOT NULL,
    Alumno VARCHAR2(9) NOT NULL,
    Calificacion VARCHAR2(8),
    nFallos NUMBER,
    
    PRIMARY KEY (OID_ET),
    CONSTRAINT ET_Alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE
);

CREATE TABLE Oferta ( 
    OID_O NUMBER NOT NULL,
    Precio NUMBER NOT NULL,
    nClasesContenidas NUMBER,
    nIntentosExamenes NUMBER,
    Web NUMBER,
    
    PRIMARY KEY (OID_O),
    CONSTRAINT Oferta_webtests_FK FOREIGN KEY(Web) REFERENCES WebTests(OID_W) ON DELETE SET NULL

);

CREATE TABLE Matriculas (
    OID_M NUMBER NOT NULL,
    Fecha DATE NOT NULL,
    PermisoMatriculado VARCHAR2(10) NOT NULL,
    Alumno VARCHAR2(9) NOT NULL,
    Oferta NUMBER NOT NULL,
    
    PRIMARY KEY (OID_M),
    
    CONSTRAINT Matriculas_alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE,
    CONSTRAINT Matriculas_Oferta_FK FOREIGN KEY(Oferta) REFERENCES Oferta(OID_O) ON DELETE CASCADE
);

CREATE TABLE PagoTasas (
    OID_PaT NUMBER NOT NULL,
    Importe NUMBER,
    Fecha DATE,
    Oferta NUMBER NOT NULL,
    
    PRIMARY KEY (OID_PaT),
    
    CONSTRAINT PagoTasas_Oferta_FK FOREIGN KEY(Oferta) REFERENCES Oferta(OID_O) ON DELETE CASCADE
);

CREATE TABLE Tasas (
    Codigo VARCHAR2(5) NOT NULL,
    Tramite VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(50),
    Importe NUMBER NOT NULL,
    
    PRIMARY KEY (Codigo)
);

CREATE TABLE PagoContieneTasas (
    PagoTasas NUMBER NOT NULL,
    Tasa VARCHAR2(4) NOT NULL,
    
    PRIMARY KEY(PagoTasas,Tasa),
    
    CONSTRAINT PagoContieneTasas_PagoTasas_FK FOREIGN KEY(PagoTasas) REFERENCES PagoTasas(OID_PaT) ON DELETE CASCADE,
    CONSTRAINT PagoContieneTasas_Tasas_FK FOREIGN KEY(Tasa) REFERENCES Tasas(Codigo) ON DELETE CASCADE
);

CREATE TABLE Profesores (
    DNI VARCHAR2(9) NOT NULL,
    Nombre VARCHAR2(20) NOT NULL,
    Apellidos VARCHAR2(20) NOT NULL,
    FechaContrato DATE NOT NULL,
    Telefono VARCHAR2(9),
    Salario NUMBER NOT NULL,
    nSS VARCHAR2(13) NOT NULL,
    
    PRIMARY KEY (DNI),
    
    CONSTRAINT profesores_ak UNIQUE (nSS)
);

CREATE TABLE Permisos (
    TipoPermiso VARCHAR2(10) NOT NULL,
    
    PRIMARY KEY (TipoPermiso)
);

CREATE TABLE ProfesoresImpartenPermisos (
    DNI VARCHAR2(9) NOT NULL,
    TipoPermiso VARCHAR2(10) NOT NULL,
    
    PRIMARY KEY (DNI,TipoPermiso),
    
    CONSTRAINT ProfImpPer_Permisos_FK FOREIGN KEY(TipoPermiso) REFERENCES Permisos(TipoPermiso) ON DELETE CASCADE,
    CONSTRAINT ProfImpPer_Profesores_FK FOREIGN KEY(DNI) REFERENCES Profesores(DNI) ON DELETE CASCADE
);

CREATE TABLE Clases (
    OID_C NUMBER NOT NULL,
    TipoClase VARCHAR2(20) NOT NULL,
    TipoPermiso VARCHAR2(10) NOT NULL,
    Fecha DATE NOT NULL,
    HoraInicio VARCHAR2(5) NOT NULL,
    HoraFin VARCHAR2(5) NOT NULL,
    DNIProfesor VARCHAR2(9) NOT NULL,
    DNIAlumno VARCHAR2(9) NOT NULL,
    PagoClase NUMBER,
    Oferta NUMBER,
    
    PRIMARY KEY (OID_C),
    
    CONSTRAINT clases_ak UNIQUE (Fecha,HoraInicio,DNIProfesor), --Cumple la RN-007
    
    CONSTRAINT clases_alumnos_FK FOREIGN KEY(DNIAlumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE,
    CONSTRAINT clases_profesores_FK FOREIGN KEY(DNIProfesor) REFERENCES Profesores(DNI) ON DELETE CASCADE,
    CONSTRAINT clases_PagoClases_FK FOREIGN KEY(PagoClase) REFERENCES PagoClases(OID_PaC) ON DELETE CASCADE,
    CONSTRAINT clases_Oferta_FK FOREIGN KEY(Oferta) REFERENCES Oferta(OID_O) ON DELETE CASCADE
);

CREATE TABLE Turismos (
    Matricula VARCHAR2(8) NOT NULL,
    Estado VARCHAR2(15) NOT NULL,
    Modelo VARCHAR2(20) NOT NULL,
    
    PRIMARY KEY (Matricula)
);

CREATE TABLE Motocicletas (
    Matricula VARCHAR2(8) NOT NULL,
    Estado VARCHAR2(15) NOT NULL,
    Modelo VARCHAR2(20) NOT NULL,
    CC NUMBER NOT NULL,
    
    PRIMARY KEY (Matricula)
);

CREATE TABLE AlumnoConduceTurismos (
    Alumno VARCHAR2(9) NOT NULL,
    Turismo VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (Alumno,Turismo),
  
    CONSTRAINT alumnoconduceT_alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE,
    CONSTRAINT alumnoconduceT_turismos_FK FOREIGN KEY(Turismo) REFERENCES Turismos(Matricula) ON DELETE CASCADE    
);

CREATE TABLE AlumnoConduceMotocicletas (
    Alumno VARCHAR2(9) NOT NULL,
    Motocicleta VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (Alumno,Motocicleta),
  
    CONSTRAINT alumnoconduceM_alumnos_FK FOREIGN KEY(Alumno) REFERENCES Alumnos(DNI) ON DELETE CASCADE,
    CONSTRAINT alumnoconduceM_motocicletas_FK FOREIGN KEY(Motocicleta) REFERENCES Motocicletas(Matricula) ON DELETE CASCADE    
);

CREATE TABLE SegurosTurismos (
    OID_ST NUMBER NOT NULL,
    Compañia VARCHAR2(15) NOT NULL,
    TipoSeguro VARCHAR2(15) NOT NULL,
    FechaContrato DATE NOT NULL,
    TipoCuota VARCHAR2(10) NOT NULL,
    ImporteCuota NUMBER NOT NULL,
    Turismo VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (OID_ST),
    
    CONSTRAINT segurosT_turismos_FK FOREIGN KEY(Turismo) REFERENCES Turismos(Matricula) ON DELETE CASCADE
);

CREATE TABLE SegurosMotocicletas (
    OID_SM NUMBER NOT NULL,
    Compañia VARCHAR2(15) NOT NULL,
    TipoSeguro VARCHAR2(15) NOT NULL,
    FechaContrato DATE NOT NULL,
    TipoCuota VARCHAR2(10) NOT NULL,
    ImporteCuota NUMBER NOT NULL,
    Motocicleta VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (OID_SM),
    
    CONSTRAINT segurosM_motocicletas_FK FOREIGN KEY(Motocicleta) REFERENCES Motocicletas(Matricula) ON DELETE CASCADE
);

CREATE TABLE ITVTurismos (
    OID_IT NUMBER NOT NULL,
    Fecha DATE NOT NULL,
    FechaExpira DATE NOT NULL,
    Coste NUMBER NOT NULL,
    Revision VARCHAR2(15) NOT NULL,
    Turismo VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (OID_IT),
    
    CONSTRAINT ITVT_turismos_FK FOREIGN KEY(Turismo) REFERENCES Turismos(Matricula) ON DELETE CASCADE
);

CREATE TABLE ITVMotocicletas (
    OID_IM NUMBER NOT NULL,
    Fecha DATE NOT NULL,
    FechaExpira DATE NOT NULL,
    Coste NUMBER NOT NULL,
    Revision VARCHAR2(15) NOT NULL,
    Motocicleta VARCHAR2(8) NOT NULL,
    
    PRIMARY KEY (OID_IM),
    
    CONSTRAINT ITVM_motocicletas_FK FOREIGN KEY(Motocicleta) REFERENCES Motocicletas(Matricula) ON DELETE CASCADE
);

CREATE TABLE Talleres (
    Nombre VARCHAR2(20) NOT NULL,
    Direccion VARCHAR2(20) NOT NULL,
    Telefono VARCHAR2(9),
    
    PRIMARY KEY (Nombre)
);

CREATE TABLE ReparacionesTurismos (
    OID_RT NUMBER,
    Descripcion VARCHAR2(50),
    Fecha DATE,
    Coste NUMBER,
    Turismo VARCHAR2(8) NOT NULL,
    Taller VARCHAR2(20) NOT NULL,
    
    PRIMARY KEY (OID_RT),
    
    CONSTRAINT ReparacionesT_turismos_FK FOREIGN KEY(Turismo) REFERENCES Turismos(Matricula) ON DELETE CASCADE,
    CONSTRAINT ReparacionesT_Talleres_FK FOREIGN KEY(Taller) REFERENCES Talleres(Nombre) ON DELETE CASCADE
);

CREATE TABLE ReparacionesMotocicletas (
    OID_RM NUMBER,
    Descripcion VARCHAR2(50),
    Fecha DATE,
    Coste NUMBER,
    Motocicleta VARCHAR2(8) NOT NULL,
    Taller VARCHAR2(20) NOT NULL,
    
    PRIMARY KEY (OID_RM),
    
    CONSTRAINT ReparacionesM_motocicletas_FK FOREIGN KEY(Motocicleta) REFERENCES Motocicletas(Matricula) ON DELETE CASCADE,
    CONSTRAINT ReparacionesM_Talleres_FK FOREIGN KEY(Taller) REFERENCES Talleres(Nombre) ON DELETE CASCADE
);

CREATE TABLE Login (
    Usuario VARCHAR2(20),
    DNI VARCHAR2(9),
    Pass VARCHAR2(20),
    Tipo VARCHAR2(20),
    
    PRIMARY KEY (Usuario)
);
INSERT INTO Login VALUES ('profesor1','82939193S','traficoPROF','Profesor');
INSERT INTO Login VALUES ('alumno1','77850301Q','traficoALUM','Alumno');
INSERT INTO Login VALUES ('administrador1','71456891V','traficoADM','Administrador');

CREATE TABLE Anuncios (
    OID_ANUN NUMBER,
    Fecha DATE,
    Titulo VARCHAR2(30),
    Texto CLOB,

    PRIMARY KEY (OID_ANUN)
);

create table z_calendar(c_date date);
insert into z_calendar
select to_date(to_char(20120601), 'yyyymmdd') + lvl d
from ( select level -1 lvl
from dual
connect by level <= 20000);