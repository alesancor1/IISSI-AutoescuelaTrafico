--PRUEBAS DE LOS PAQUETES

SET SERVEROUTPUT ON;

BEGIN
/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA WEBTESTS
**********************************************************************************************************/
Pruebas_WebTests.inicializar;

Pruebas_WebTests.insertar('Prueba 1 - Inserci�n WebTest','Online',TRUE);

Pruebas_WebTests.insertar('Prueba 2 - Inserci�n WebTest violando Constraint Estado','En Linea',FALSE);

Pruebas_WebTests.actualizar('Prueba 3 - Actualizaci�n WebTest violando Constraint Estado',1,'En Linea',FALSE);
Pruebas_WebTests.actualizar('Prueba 4 - Actualizaci�n WebTest violando PK',null,'En Linea',FALSE);

--Pruebas_WebTests.eliminar('Prueba 5 - Eliminar WebTest',1,TRUE); no tiene sentido eliminar.

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA OFERTA
**********************************************************************************************************/
Pruebas_Oferta.inicializar;

Pruebas_Oferta.insertar('Prueba 1 - Inserci�n Oferta',179, 10, 3,1, TRUE);
Pruebas_Oferta.insertar('Prueba 2 - Inserci�n Oferta',295, 10, 3,1, TRUE);

Pruebas_Oferta.insertar('Prueba 3 - Inserci�n Oferta violando Constraint del precio', 0, 10, 3,1,FALSE);

Pruebas_Oferta.actualizar('Prueba 4 - Actualizaci�n Oferta violando Constraint del precio',2, 0, 10, 3,1,FALSE);
Pruebas_Oferta.actualizar('Prueba 5 - Actualizaci�n Oferta violando PK',null, 295, 10, 3,1,FALSE);

--Pruebas_Oferta.eliminar('Prueba 5 - Eliminaci�n Oferta', 2, TRUE); No tiene sentido

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ACCESOWEB
**********************************************************************************************************/
Pruebas_AccesoWeb.inicializar;

Pruebas_AccesoWeb.insertar('Prueba 1 - Inserci�n AccesoWeb', '77850301Q','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('17/03/2020','DD/MM/YYYY'),1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 2 - Inserci�n AccesoWeb', '77850282K','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('17/03/2020','DD/MM/YYYY'),1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 3 - Inserci�n AccesoWeb', '77852929O','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('17/03/2020','DD/MM/YYYY'),1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 4 - Inserci�n AccesoWeb', '29190910A','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('17/03/2020','DD/MM/YYYY'),1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 5 - Inserci�n AccesoWeb', '02903829A','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('15/03/2020','DD/MM/YYYY'),1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 6 - Inserci�n AccesoWeb', '77202010P','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('16/03/2020','DD/MM/YYYY'),1, TRUE);

Pruebas_AccesoWeb.insertar('Prueba 8 - Inserci�n AccesoWeb violando Constraint FormatoUsuario', 'AlexSC123','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('16/03/2020','DD/MM/YYYY'),1, FALSE);
Pruebas_AccesoWeb.insertar('Prueba 9 - Inserci�n AccesoWeb violando PK', null,'182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('16/03/2020','DD/MM/YYYY'),1, FALSE);
Pruebas_AccesoWeb.insertar('Prueba 10 - Inserci�n AccesoWeb sin cumplir RN-013', '77202010P','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('10/10/2019','DD/MM/YYYY'),1, FALSE);

Pruebas_AccesoWeb.actualizar('Prueba 11 - Actualizaci�n AccesoWeb violando Constraint FormatoUsuario', 'AlexSC123','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('16/03/2020','DD/MM/YYYY'),1, FALSE);
Pruebas_AccesoWeb.actualizar('Prueba 12 - Actualizaci�n AccesoWeb violando PK', null,'182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('16/03/2020','DD/MM/YYYY'),1, FALSE);
Pruebas_AccesoWeb.actualizar('Prueba 13 - Actualizaci�n AccesoWeb sin cumplir RN-013', '77202010P','182910101',to_date('17/11/2019','DD/MM/YYYY'),to_date('10/10/2019','DD/MM/YYYY'),1, FALSE);

Pruebas_AccesoWeb.eliminar('Prueba 14 - Eliminar AccesoWeb','77202010P',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ALUMNOS
**********************************************************************************************************/
Pruebas_Alumnos.inicializar;

Pruebas_Alumnos.insertar('Prueba 1 - Inserci�n Alumno', '77850301Q', 'Alejandro', 'Santisteban Corchos', null, 10, to_date('17/08/2000','DD/MM/YYYY'),'Valido','77850301Q', TRUE);
Pruebas_Alumnos.insertar('Prueba 2 - Inserci�n Alumno', '77850282K', 'Beltran', 'Coronado Garcia', '418029010', 20, to_date('19/09/1998','DD/MM/YYYY'),'Valido','77850282K' , TRUE);
Pruebas_Alumnos.insertar('Prueba 3 - Inserci�n Alumno', '77852929O', 'Antonio', 'Perez Gutierrez', null, 5, to_date('17/08/1998','DD/MM/YYYY'),'Valido','77852929O', TRUE);
Pruebas_Alumnos.insertar('Prueba 4 - Inserci�n Alumno', '29190910A', 'Juan', 'Garcia Lopez', '100202191', 10, to_date('11/01/2000','DD/MM/YYYY'),'Valido','29190910A', TRUE);
Pruebas_Alumnos.insertar('Prueba 5 - Inserci�n Alumno', '02903829A', 'Marta', 'Gonzalez Ruiz', null, 5, to_date('17/08/1996','DD/MM/YYYY'),'Valido','02903829A', TRUE);
Pruebas_Alumnos.insertar('Prueba 6 - Inserci�n Alumno', '77202010P', 'Ignacio', 'Nu�ez Mu�oz', '777273718', 10, to_date('17/10/2001','DD/MM/YYYY'),'No valido',null, TRUE);
Pruebas_Alumnos.insertar('Prueba 7 - Inserci�n Alumno', '41232010P', 'Martin', 'Sanchez Mu�oz', '786450851', 10, to_date('07/10/2000','DD/MM/YYYY'),'Valido',null, TRUE);
Pruebas_Alumnos.insertar('Prueba 8 - Inserci�n Alumno', '41118010S', 'Pepe', 'Martinez Lopez', '786442111', 10, to_date('07/10/2000','DD/MM/YYYY'),'Valido',null, TRUE);

Pruebas_Alumnos.insertar('Prueba 9 - Inserci�n Alumno violando Constraint del FormatoDe(DNI,Telefono,RecMedico)', '772020102', 'Pepe', 'Jimenez Vazquez', '7714E3518', 10, to_date('19/10/2001','DD/MM/YYYY'),'Aceptable',null, FALSE);
Pruebas_Alumnos.insertar('Prueba 10 - Inserci�n Alumno violando PK', null, 'Pepe', 'Jimenez Vazquez', '771433518', 10, to_date('19/10/2001','DD/MM/YYYY'),'Valido',null, FALSE);
Pruebas_Alumnos.insertar('Prueba 11 - Inserci�n Alumno sin cumplir RN-006', '77207910P', 'Pepe', 'Jimenez Vazquez', '771433518', 10, to_date('19/10/2005','DD/MM/YYYY'),'Valido',null, FALSE);

Pruebas_Alumnos.actualizar('Prueba 12 - Actualizaci�n Alumno violando Constraint del FormatoDe(DNI,Telefono,RecMedico)', '772020102', 'Pepe', 'Jimenez Vazquez', '7714E3518', 10, to_date('19/10/2001','DD/MM/YYYY'),'Aceptable',null, FALSE);
Pruebas_Alumnos.actualizar('Prueba 13 - Actualizaci�n Alumno violando PK', null, 'Pepe', 'Sanchez Mu�oz', '786450851', 10, to_date('19/10/2001','DD/MM/YYYY'),'Valido',null, FALSE);
--Pruebas_Alumnos.actualizar('Prueba 14 - Actualizaci�n Alumno sin cumplir RN-003', '41232010P', 'Martin', 'Sanchez Mu�oz', '786450851', 10, to_date('19/10/2000','DD/MM/YYYY'),'Valido','41232010P', FALSE); 
Pruebas_Alumnos.actualizar('Prueba 15 - Actualizaci�n Alumno sin cumplir RN-006', '77202010P', 'Pepe', 'Sanchez Mu�oz', '786450851', 10, to_date('19/10/2005','DD/MM/YYYY'),'Valido',null, FALSE);

Pruebas_Alumnos.eliminar('Prueba 16 - Eliminar Alumno', '41118010S', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOCLASES
**********************************************************************************************************/
Pruebas_PagoClases.inicializar;

Pruebas_PagoClases.insertar('Prueba 1 - Inserci�n PagoClase', '77850301Q', to_date('12/12/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 2 - Inserci�n PagoClase', '77850282K', to_date('12/12/2017','DD/MM/YYYY'), 360, 20, TRUE);
Pruebas_PagoClases.insertar('Prueba 3 - Inserci�n PagoClase', '77852929O', to_date('12/11/2018','DD/MM/YYYY'), 36, 2 , TRUE);
Pruebas_PagoClases.insertar('Prueba 4 - Inserci�n PagoClase', '29190910A', to_date('10/12/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 5 - Inserci�n PagoClase', '02903829A', to_date('12/07/2019','DD/MM/YYYY'), 90, 5, TRUE);
Pruebas_PagoClases.insertar('Prueba 6 - Inserci�n PagoClase', '77202010P', to_date('12/07/2019','DD/MM/YYYY'), 18, 1, TRUE);
Pruebas_PagoClases.insertar('Prueba 7 - Inserci�n PagoClase', '41232010P', to_date('12/07/2019','DD/MM/YYYY'), 180, 10, TRUE);

Pruebas_PagoClases.insertar('Prueba 8 - Inserci�n PagoClase violando Constraint del Importe', '41232010P', to_date('12/07/2019','DD/MM/YYYY'), 0, 10, FALSE);

Pruebas_PagoClases.actualizar('Prueba 9 - Actualizaci�n PagoClase violando Constraint del Importe', 6,'77202010P', to_date('12/07/2019','DD/MM/YYYY'), 0, 10, FALSE);
Pruebas_PagoClases.actualizar('Prueba 10 - Actualizaci�n PagoClase violando PK',null,'77202010P', to_date('12/07/2019','DD/MM/YYYY'), 180, 10, FALSE);

Pruebas_PagoClases.eliminar('Prueba 11 - Eliminar PagoClase', 7, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ORDENADORES
**********************************************************************************************************/
Pruebas_Ordenadores.inicializar;

Pruebas_Ordenadores.insertar('Prueba 1 - Inserci�n Ordenador', 'BuenEstado','TOSHIBA 279XLP', 'Windows10', TRUE);
Pruebas_Ordenadores.insertar('Prueba 2 - Inserci�n Ordenador', 'Nuevo','ACER 1810S', 'Ubuntu 18.04', TRUE);
Pruebas_Ordenadores.insertar('Prueba 3 - Inserci�n Ordenador', 'MalEstado','HP 192C', 'Windows10', TRUE);
Pruebas_Ordenadores.insertar('Prueba 4 - Inserci�n Ordenador', 'Aceptable','LENOVO 1828X', 'Ubuntu 18.04', TRUE);

Pruebas_Ordenadores.insertar('Prueba 5 - Inserci�n Ordenador violando Constraint del Estado', 'Roto','ASUS 777C', 'Ubuntu 18.04', FALSE);

Pruebas_Ordenadores.actualizar('Prueba 6 - Actualizaci�n Ordenador violando Constraint del Estado', 1,'Roto','ASUS 777C', 'Ubuntu 18.04', FALSE);
Pruebas_Ordenadores.actualizar('Prueba 7 - Actualizaci�n Ordenador violando PK', null, 'Aceptable','LENOVO 1828X', 'Ubuntu 18.04', FALSE);

Pruebas_Ordenadores.eliminar('Prueba 8 - Eliminar Ordenador', 3, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA USOPC
**********************************************************************************************************/
Pruebas_UsoPC.inicializar;

Pruebas_UsoPC.insertar('Prueba 1 - Inserci�n UsoPC', to_date('10/11/2018','DD/MM/YYYY'),'12:30','14:00', '77850301Q',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 2 - Inserci�n UsoPC', to_date('11/11/2018','DD/MM/YYYY'),'12:30','14:30', '77850301Q',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 3 - Inserci�n UsoPC', to_date('10/12/2018','DD/MM/YYYY'),'12:00','12:30', '77850301Q',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 4 - Inserci�n UsoPC', to_date('12/10/2018','DD/MM/YYYY'),'10:30','12:30', '77852929O',4, TRUE);
Pruebas_UsoPC.insertar('Prueba 5 - Inserci�n UsoPC', to_date('16/07/2019','DD/MM/YYYY'),'17:30','19:30', '02903829A',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 6 - Inserci�n UsoPC', to_date('19/06/2019','DD/MM/YYYY'),'17:30','19:30', '77852929O',2, TRUE);

Pruebas_UsoPC.insertar('Prueba 7 - Inserci�n UsoPC violando Constraint FormatoHora', to_date('23/06/2019','DD/MM/YYYY'),'11,30','12.30', '77852929O',2, FALSE);
Pruebas_UsoPC.insertar('Prueba 8 - Inserci�n UsoPC sin cumplir RN-019', to_date('23/06/2019','DD/MM/YYYY'),'14:30','17:30', '77852929O',2, FALSE);

Pruebas_UsoPC.actualizar('Prueba 9 - Actualizaci�n UsoPC violando Constraint FormatoHora',1, to_date('22/06/2019','DD/MM/YYYY'),'14,30','15.30', '77852929O',2, FALSE);
Pruebas_UsoPC.actualizar('Prueba 10 - Actualizaci�n UsoPC violando PK', null, to_date('19/06/2019','DD/MM/YYYY'),'17:30','19:30', '77852929O',2, FALSE);
Pruebas_UsoPC.actualizar('Prueba 11 - Actualizaci�n UsoPC sin cumplir RN-019', 1, to_date('19/06/2019','DD/MM/YYYY'),'17:30','20:30', '77852929O',2, FALSE);

Pruebas_UsoPC.eliminar('Prueba 12 - Eliminar UsoPC', 6, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA MATRICULA
**********************************************************************************************************/
Pruebas_Matriculas.inicializar;

Pruebas_Matriculas.insertar('Prueba 1 - Inserci�n Matricula', to_date('12/12/2018','DD/MM/YYYY'),'Permiso B','77850301Q',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 2 - Inserci�n Matricula', to_date('12/04/2017','DD/MM/YYYY'),'Permiso B','77850282K',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 3 - Inserci�n Matricula', to_date('12/02/2018','DD/MM/YYYY'),'Permiso B','77852929O',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 4 - Inserci�n Matricula', to_date('12/02/2017','DD/MM/YYYY'),'Permiso A2','29190910A',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 5 - Inserci�n Matricula', to_date('10/09/2016','DD/MM/YYYY'),'Permiso A2','02903829A',2,TRUE);
--Pruebas_Matriculas.insertar('Prueba 6 - Inserci�n Matricula', to_date('12/12/2017','DD/MM/YYYY'),'Permiso B','02903829A',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 6 - Inserci�n Matricula', to_date('11/08/2016','DD/MM/YYYY'),'Permiso A2','77202010P',2,TRUE);

Pruebas_Matriculas.insertar('Prueba 7 - Inserci�n Matricula violando Constraint Permiso', to_date('11/08/2016','DD/MM/YYYY'),'Permiso A1','41232010P',2,FALSE);
Pruebas_Matriculas.insertar('Prueba 8 - Inserci�n Matricula sin cumplir RN-002', to_date('12/02/2017','DD/MM/YYYY'),'Permiso B','29190910A',1,FALSE);

Pruebas_Matriculas.actualizar('Prueba 9 - Actualizacion Matricula violando Constraint Permiso', 7,to_date('11/08/2016','DD/MM/YYYY'),'Permiso A1','77202010P',2,FALSE);
Pruebas_Matriculas.actualizar('Prueba 10 - Actualizacion Matricula violando PK', null,to_date('11/08/2016','DD/MM/YYYY'),'Permiso A2','77202010P',2,FALSE);

Pruebas_Matriculas.eliminar('Prueba 11 - Eliminar Matricula', 6,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOTASAS
**********************************************************************************************************/
Pruebas_PagoTasas.inicializar;

Pruebas_PagoTasas.insertar('Prueba 1 - Inserci�n PagoTasas', 138, to_date('12/12/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 2 - Inserci�n PagoTasas', 138, to_date('12/04/2017','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 3 - Inserci�n PagoTasas', 120, to_date('12/02/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 4 - Inserci�n PagoTasas', 120, to_date('12/02/2017','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 5 - Inserci�n PagoTasas', 120, to_date('10/09/2016','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 6 - Inserci�n PagoTasas', 138, to_date('12/12/2017','DD/MM/YYYY'), 1, TRUE);

Pruebas_PagoTasas.insertar('Prueba 7 - Inserci�n PagoTasas violando Constraint Importe', 0, to_date('15/12/2017','DD/MM/YYYY'), 1, FALSE);

Pruebas_PagoTasas.actualizar('Prueba 8 - Actualizaci�n PagoTasas violando Constraint Importe', 6,0, to_date('15/12/2017','DD/MM/YYYY'), 1, FALSE);
Pruebas_PagoTasas.actualizar('Prueba 9 - Actualizaci�n PagoTasas violando PK', null,0, to_date('15/12/2017','DD/MM/YYYY'), 1, FALSE);

Pruebas_PagoTasas.eliminar('Prueba 10 - Eliminar PagoTasa', 6, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TASAS
**********************************************************************************************************/
Pruebas_Tasas.inicializar;

Pruebas_Tasas.insertar('Prueba 1 - Inserci�n Tasa', '2.2', 'Examen dentro y fuera de la capital', 'Obtencion de licencia de conducion', 43, TRUE);
Pruebas_Tasas.insertar('Prueba 2 - Inserci�n Tasa', '1.1', 'Permiso de circulacion', 'Expedicion Permiso circulacion', 95, TRUE);
Pruebas_Tasas.insertar('Prueba 3 - Inserci�n Tasa', '4.2', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 77, TRUE);

Pruebas_Tasas.insertar('Prueba 4 - Inserci�n Tasa violando Constraint Importe', '4.1', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 0, FALSE);
Pruebas_Tasas.insertar('Prueba 5 - Inserci�n Tasa violando Constraint Codigo', '4,2', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 77, FALSE);
Pruebas_Tasas.insertar('Prueba 6 - Inserci�n Tasa violando PK', null, 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 77, FALSE);

Pruebas_Tasas.actualizar('Prueba 7 - Actualizaci�n Tasa violando Constraint Importe', '4.2', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 0, FALSE);
Pruebas_Tasas.actualizar('Prueba 8 - Actualizaci�n Tasa violando Constraint Codigo', '4,2', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 77, FALSE);
Pruebas_Tasas.actualizar('Prueba 9 - Actualizaci�n Tasa violando PK', null, 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 77, FALSE);

Pruebas_Tasas.eliminar('Prueba 10 - Eliminar Tasa', '4.2', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOCONTIENETASAS
**********************************************************************************************************/
Pruebas_PagoContieneTasas.inicializar;

Pruebas_PagoContieneTasas.insertar('Prueba 1 - Inserci�n PagoContieneTasa', 1,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 2 - Inserci�n PagoContieneTasa', 1,'1.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 3 - Inserci�n PagoContieneTasa', 2,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 4 - Inserci�n PagoContieneTasa', 2,'1.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 5 - Inserci�n PagoContieneTasa', 3,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 6 - Inserci�n PagoContieneTasa', 3,'1.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 7 - Inserci�n PagoContieneTasa', 4,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 8 - Inserci�n PagoContieneTasa', 4,'1.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 9 - Inserci�n PagoContieneTasa', 5,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 10 - Inserci�n PagoContieneTasa', 5,'1.1', TRUE);

Pruebas_PagoContieneTasas.insertar('Prueba 14 - Inserci�n PagoContieneTasa violando PK', null,null, FALSE);

Pruebas_PagoContieneTasas.actualizar('Prueba 15 - Actualizaci�n PagoContieneTasa violando PK', null,null, FALSE);

Pruebas_PagoContieneTasas.eliminar('Prueba 16 - Eliminar PagoContieneTasa', 6,'1.1',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROFESORES
**********************************************************************************************************/
Pruebas_Profesores.inicializar;

Pruebas_Profesores.insertar('Prueba 1 - Inserci�n Profesor', '82939193S', 'Jose Manuel', 'Lopez Gomez',to_date('11/06/2012','DD/MM/YYYY') , null, 2100, '41 2828381939',TRUE);
Pruebas_Profesores.insertar('Prueba 2 - Inserci�n Profesor', '01929391L', 'Paco', 'Perez Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '701325321', 2100, '41 1849291038',TRUE);
Pruebas_Profesores.insertar('Prueba 3 - Inserci�n Profesor', '56749302R', 'Jesus', 'Navas Casillas',to_date('09/04/2016','DD/MM/YYYY') , null, 2000, '41 1849267218',TRUE);

Pruebas_Profesores.insertar('Prueba 4 - Inserci�n Profesor violando Constraint Formato (DNI,Tlf,nSS)','019293A12', 'Paco', 'Perez As',to_date('19/04/2014','DD/MM/YYYY') , '42344A', 2100, '4B1A49291038' ,FALSE);
Pruebas_Profesores.insertar('Prueba 5 - Inserci�n Profesor violando Constraint Salario', '34295839S', 'Pepe', 'Ruiz Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '701325421', 0, '41 1849293058',FALSE);
Pruebas_Profesores.insertar('Prueba 6 - Inserci�n Profesor violando PK', null, 'Juan', 'Perez Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '701125321', 0, '41 1249291038',FALSE);

Pruebas_Profesores.actualizar('Prueba 7 - Actualizaci�n Profesor violando Constraint Formato (DNI,Tlf,nSS)','019293A12', 'Paco', 'Perez Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '42344A0', 2100, '4B1A49291038' ,FALSE);
Pruebas_Profesores.actualizar('Prueba 8 - Actualizaci�n Profesor violando Constraint Salario', '01929391L', 'Paco', 'Perez Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '701325321', 0, '41 1849291038',FALSE);
Pruebas_Profesores.actualizar('Prueba 9 - Actualizaci�n Profesor violando PK', null, 'Paco', 'Perez Sanchez',to_date('19/04/2014','DD/MM/YYYY') , '701325321', 0, '41 1849291038',FALSE);

Pruebas_Profesores.eliminar('Prueba 10 - Eliminar Profesor', '56749302R', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PERMISOS
**********************************************************************************************************/
Pruebas_Permisos.inicializar;

Pruebas_Permisos.insertar('Prueba 1 - Inserci�n Permiso', 'Permiso B',TRUE);
Pruebas_Permisos.insertar('Prueba 2 - Inserci�n Permiso', 'Permiso A2',TRUE);

Pruebas_Permisos.insertar('Prueba 3 - Inserci�n Permiso violando Constraint de TipoPermiso','Permiso A1' ,FALSE);
Pruebas_Permisos.insertar('Prueba 4 - Inserci�n Permiso violando PK',null ,FALSE);

Pruebas_Permisos.actualizar('Prueba 5 - Actualizaci�n Permiso Constraint de TipoPermiso', 'Permiso A1',FALSE);
Pruebas_Permisos.actualizar('Prueba 6 - Actualizaci�n Permiso violando PK',null ,FALSE);

--Pruebas_Permisos.eliminar('Prueba 7 - Eliminar Permiso', 'Permiso A2', TRUE);
-- CUIDADO CON ELIMINAR ESTO...

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROFESORESIMPARTENPERMISOS
**********************************************************************************************************/
Pruebas_ProfImpartenPerm.inicializar;

Pruebas_ProfImpartenPerm.insertar('Prueba 1 - Inserci�n ProfesorImpartePermiso', '82939193S','Permiso B',TRUE);
Pruebas_ProfImpartenPerm.insertar('Prueba 2 - Inserci�n ProfesorImpartePermiso', '82939193S','Permiso A2',TRUE);
Pruebas_ProfImpartenPerm.insertar('Prueba 3 - Inserci�n ProfesorImpartePermiso', '01929391L','Permiso B',TRUE);

Pruebas_ProfImpartenPerm.insertar('Prueba 4 - Inserci�n ProfesorImpartePermiso violando PK', null,null,FALSE);

Pruebas_ProfImpartenPerm.actualizar('Prueba 5 - Actualizaci�n ProfesorImpartePermiso violando PK', null,null,FALSE);

--Pruebas_ProfImpartenPerm.eliminar('Prueba 6 - Eliminar ProfesorImpartePermiso', '01929391L','Permiso B',TRUE);
--NO TIENE SENTIDO ELIMINAR AQUI

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA EXAMEN TEORICO
**********************************************************************************************************/

Pruebas_ExamenesPracticoCirc.inicializar;
Pruebas_ExamenesPracticoPista.inicializar;
Pruebas_ExamenesTeoricos.inicializar;

Pruebas_ExamenesTeoricos.insertar('Prueba 1 - Inserci�n ExamenTeorico',to_date('16/11/2018','DD/MM/YYYY'),'77850301Q','Apto', 2, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 2 - Inserci�n ExamenTeorico',to_date('14/11/2018','DD/MM/YYYY'),'77850282K','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 3 - Inserci�n ExamenTeorico',to_date('17/11/2018','DD/MM/YYYY'),'77852929O','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 4 - Inserci�n ExamenTeorico',to_date('17/11/2018','DD/MM/YYYY'),'29190910A','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 5 - Inserci�n ExamenTeorico',to_date('17/11/2018','DD/MM/YYYY'),'02903829A','No Apto', 4, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 6 - Inserci�n ExamenTeorico',to_date('17/12/2018','DD/MM/YYYY'),'02903829A','No Apto', 5, TRUE);

Pruebas_ExamenesTeoricos.insertar('Prueba 7 - Inserci�n ExamenTeorico de alumno no matriculado',to_date('17/02/2020','DD/MM/YYYY'),'77202010P',null, null, FALSE);
Pruebas_ExamenesTeoricos.insertar('Prueba 8 - Inserci�n ExamenTeorico violando Constraint Calificacion',to_date('19/12/2018','DD/MM/YYYY'),'02903829A','Suspenso', 4, FALSE);
Pruebas_ExamenesTeoricos.insertar('Prueba 9 - Inserci�n ExamenTeorico violando Constraint nFallos',to_date('19/12/2018','DD/MM/YYYY'),'02903829A','No Apto', 33, FALSE);
Pruebas_ExamenesTeoricos.insertar('Prueba 10 - Inserci�n ExamenTeorico sin cumplir RN-005',to_date('20/11/2018','DD/MM/YYYY'),'02903829A',null, null, FALSE);

Pruebas_ExamenesTeoricos.insertar('Prueba 11 - Inserci�n ExamenTeorico',to_date('13/01/2019','DD/MM/YYYY'),'02903829A','No Apto', 4, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 12 - Inserci�n ExamenTeorico sin cumplir RN-018',to_date('13/02/2019','DD/MM/YYYY'),'02903829A',null, null, TRUE);

Pruebas_ExamenesTeoricos.actualizar('Prueba 13 - Actualizacion ExamenTeorico violando Constraint Calificacion','ET5',to_date('17/11/2018','DD/MM/YYYY'),'02903829A','Suspenso', 4, FALSE);
Pruebas_ExamenesTeoricos.actualizar('Prueba 14 - Actualizacion ExamenTeorico violando Constraint nFallos','ET5',to_date('17/11/2018','DD/MM/YYYY'),'02903829A','No Apto', 33, FALSE);
Pruebas_ExamenesTeoricos.actualizar('Prueba 15 - Actualizacion ExamenTeorico violando Constraint OID','5',to_date('17/11/2018','DD/MM/YYYY'),'02903829A','No Apto', 33, FALSE);
Pruebas_ExamenesTeoricos.actualizar('Prueba 16 - Actualizacion ExamenTeorico violando PK',null,to_date('17/11/2018','DD/MM/YYYY'),'02903829A','No Apto', 33, FALSE);

Pruebas_ExamenesTeoricos.eliminar('Prueba 17 - Eliminar ExamenTeorico', 'ET6',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CLASES
**********************************************************************************************************/
Pruebas_Clases.inicializar;

Pruebas_Clases.insertar('Prueba 1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/12/2018','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,TRUE);
Pruebas_Clases.insertar('Prueba 2 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('12/12/2018','DD/MM/YYYY'),'12:00','12:40','82939193S','77850282K',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 3 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('12/12/2018','DD/MM/YYYY'),'19:40','20:20','82939193S','77852929O',3,null,TRUE);
Pruebas_Clases.insertar('Prueba 4 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('12/12/2018','DD/MM/YYYY'),'13:20','14:00','82939193S','29190910A',4,null,TRUE);

Pruebas_Clases.insertar('Prueba 5 - Inserci�n Clase para alumno no matriculado', 'Simple circulacion','Permiso B',to_date('13/12/2018','DD/MM/YYYY'),'10:40','11:20','82939193S','77202010P',null,1,FALSE);
Pruebas_Clases.insertar('Prueba 6 - Inserci�n Clase violando Constraint TipoPermisoyClase', 'Carretera','Permiso A1',to_date('13/12/2017','DD/MM/YYYY'),'10:40','11:20','82939193S','77852929O',null,1,FALSE);
Pruebas_Clases.insertar('Prueba 7 - Inserci�n Clase violando Constraint HoraIF', 'Simple circulacion','Permiso B',to_date('13/12/2017','DD/MM/YYYY'),'10,40','11,20','82939193S','77852929O',null,1,FALSE);
Pruebas_Clases.insertar('Prueba 8 - Inserci�n Clase violando Constraint OfertayPagoClase', 'Simple circulacion','Permiso B',to_date('13/12/2017','DD/MM/YYYY'),'10:40','11:20','82939193S','77852929O',null,null,FALSE);

Pruebas_Clases.insertar('Prueba 9 - Inserci�n Clase sin cumplir RN-001', 'Simple circulacion','Permiso A2',to_date('13/12/2019','DD/MM/YYYY'),'11:00','11:40','82939193S','02903829A',5,null,FALSE);
Pruebas_Clases.insertar('Prueba 10 - Inserci�n Clase sin cumplir RN-002', 'Simple circulacion','Permiso A2',to_date('16/12/2018','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.insertar('Prueba 11 - Inserci�n Clase sin cumplir RN-008', 'Simple circulacion','Permiso B',to_date('16/12/2018','DD/MM/YYYY'),'10:00','11:20','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.insertar('Prueba 12 - Inserci�n Clase sin cumplir RN-009', 'Doble circulacion','Permiso B',to_date('16/12/2018','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.insertar('Prueba 13 - Inserci�n Clase sin cumplir RN-010', 'Simple circulacion','Permiso B',to_date('14/12/2018','DD/MM/YYYY'),'11:00','11:40','82939193S','77852929O',3,null,TRUE);
Pruebas_Clases.insertar('Prueba 14 - Inserci�n Clase sin cumplir RN-011', 'Simple circulacion','Permiso B',to_date('15/02/2019','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,TRUE);
Pruebas_Clases.insertar('Prueba 15 - Inserci�n Clase sin cumplir RN-020', 'Simple circulacion','Permiso B',to_date('13/12/2017','DD/MM/YYYY'),'10:40','11:20','82939193S','77852929O',3,null,FALSE);
Pruebas_Clases.insertar('Prueba 16 - Inserci�n Clase sin cumplir RN-EXTRA', 'Simple circulacion','Permiso B',to_date('16/12/2018','DD/MM/YYYY'),'12:00','11:20','82939193S','77850301Q',1,null,FALSE);

Pruebas_Clases.actualizar('Prueba 17 - Actualizaci�n Clase violando Constraint TipoPermisoyClase', 6,'Carretera','Permiso A1',to_date('12/12/2017','DD/MM/YYYY'),'11:00','11:40','82939193S','77202010P',6,null,FALSE);
Pruebas_Clases.actualizar('Prueba 18 - Actualizaci�n Clase violando Constraint HoraIF', 6,'Simple circulacion','Permiso B',to_date('12/12/2017','DD/MM/YYYY'),'10,40','11,20','82939193S','77202010P',6,null,FALSE);
Pruebas_Clases.actualizar('Prueba 19 - Actualizaci�n Clase violando Constraint OfertayPagoClase', 6,'Simple circulacion','Permiso B',to_date('12/12/2017','DD/MM/YYYY'),'10:40','11:20','82939193S','77202010P',null,null,FALSE);
Pruebas_Clases.actualizar('Prueba 20 - Actualizaci�n Clase violando PK', null,'Simple circulacion','Permiso B',to_date('12/12/2017','DD/MM/YYYY'),'10:40','11:20','82939193S','77202010P',6,null,FALSE);

Pruebas_Clases.actualizar('Prueba 21 - Actualizaci�n Clase sin cumplir RN-002',1, 'Simple circulacion','Permiso A2',to_date('15/12/2018','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.actualizar('Prueba 22 - Actualizaci�n Clase sin cumplir RN-008',1, 'Simple circulacion','Permiso B',to_date('15/12/2018','DD/MM/YYYY'),'10:00','11:20','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.actualizar('Prueba 23 - Actualizaci�n Clase sin cumplir RN-009',1, 'Doble circulacion','Permiso B',to_date('15/12/2018','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.actualizar('Prueba 24 - Actualizaci�n Clase sin cumplir RN-011',1, 'Simple circulacion','Permiso B',to_date('15/02/2019','DD/MM/YYYY'),'10:00','10:40','82939193S','77850301Q',1,null,FALSE);
Pruebas_Clases.actualizar('Prueba 25 - Actualizaci�n Clase sin cumplir RN-EXTRA',1, 'Simple circulacion','Permiso B',to_date('15/12/2018','DD/MM/YYYY'),'12:00','11:20','82939193S','77850301Q',1,null,FALSE);

Pruebas_Clases.eliminar('Prueba 26 - Eliminar Clase', 2,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES DE LAS TABLAS DE EXAMENES PRACTICOS
**********************************************************************************************************/

Pruebas_ExamenesPracticoCirc.insertar('Prueba 1 - Inserci�n ExamenPracticoCirculacion',to_date('27/03/2019','DD/MM/YYYY'),'77850301Q','No Apto',2,2,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 2 - Inserci�n ExamenPracticoCirculacion',to_date('27/03/2019','DD/MM/YYYY'),'77852929O',null,null,null,null,TRUE);

Pruebas_ExamenesPracticoCirc.insertar('Prueba 3 - Inserci�n ExamenPracticoCirculacion violando Constraint FallosyCalificacion',to_date('13/05/2019','DD/MM/YYYY'),'77850301Q','Suspenso',11,7,5,FALSE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 4 - Inserci�n ExamenPracticoCirculacion sin cumplir RN-004',to_date('27/12/2019','DD/MM/YYYY'),'77850282K',null,null,null,null,FALSE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 5 - Inserci�n ExamenPracticoCirculacion sin cumplir RN-005',to_date('29/03/2019','DD/MM/YYYY'),'77850301Q',null,null,null,null,FALSE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 6 - Inserci�n ExamenPracticoCirculacion sin cumplir RN-012',to_date('22/12/2019','DD/MM/YYYY'),'77202010P',null,null,null,null,FALSE);

Pruebas_ExamenesPracticoCirc.insertar('Prueba 7 - Inserci�n ExamenPracticoCirculacion',to_date('30/04/2019','DD/MM/YYYY'),'77850301Q','No Apto',4,1,1,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 8 - Inserci�n ExamenPracticoCirculacion sin cumplir RN-018',to_date('17/05/2019','DD/MM/YYYY'),'77850301Q',null,null,null,null,TRUE);

Pruebas_ExamenesPracticoCirc.actualizar('Prueba 9 - Actualizacion ExamenPracticoCirculacion violando Constraint FallosyCalificacion','EPC1',to_date('27/03/2019','DD/MM/YYYY'),'77850301Q','Suspenso',11,7,5,FALSE);
Pruebas_ExamenesPracticoCirc.actualizar('Prueba 10 - Actualizacion ExamenPracticoCirculacion violando Constraint OID','1',to_date('27/03/2019','DD/MM/YYYY'),'77850301Q','No Apto',2,2,0,FALSE);
Pruebas_ExamenesPracticoCirc.actualizar('Prueba 11 - Actualizaci�n ExamenPracticoCirculacion violando PK',null,to_date('27/03/2019','DD/MM/YYYY'),'77850301Q','No Apto',2,2,0,FALSE);

Pruebas_ExamenesPracticoCirc.eliminar('Prueba 12 - Eliminar ExamenPracticoCirculacion', 'EPC7',TRUE);


Pruebas_ExamenesPracticoPista.insertar('Prueba 1 - Inserci�n ExamenesPracticoPista',to_date('20/01/2018','DD/MM/YYYY'),'29190910A','No Apto',2,2,0,TRUE);

Pruebas_ExamenesPracticoPista.insertar('Prueba 2 - Inserci�n ExamenesPracticoPista violando Constraint FallosyCalificacion',to_date('20/02/2018','DD/MM/YYYY'),'29190910A','Suspenso',11,7,5,FALSE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 3 - Inserci�n ExamenesPracticoPista sin cumplir RN-005',to_date('24/01/2018','DD/MM/YYYY'),'29190910A',null,null,null,null,FALSE);

Pruebas_ExamenesPracticoPista.insertar('Prueba 4 - Inserci�n ExamenesPracticoPista',to_date('20/02/2018','DD/MM/YYYY'),'29190910A','No Apto',2,1,1,TRUE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 5 - Inserci�n ExamenesPracticoPista sin cumplir RN-017',to_date('20/01/2018','DD/MM/YYYY'),'77850301Q',null,null,null,null,FALSE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 6 - Inserci�n ExamenesPracticoPista sin cumplir RN-018',to_date('07/05/2019','DD/MM/YYYY'),'29190910A',null,null,null,null,TRUE);

Pruebas_ExamenesPracticoPista.actualizar('Prueba 7 - Actualizacion ExamenesPracticoPista violando Constraint FallosyCalificacion','EPP1',to_date('20/01/2018','DD/MM/YYYY'),'29190910A','Suspenso',11,7,5,FALSE);
Pruebas_ExamenesPracticoPista.actualizar('Prueba 8 - Actualizacion ExamenesPracticoPista violando Constraint OID','1',to_date('20/01/2018','DD/MM/YYYY'),'29190910A','No Apto',2,2,0,FALSE);
Pruebas_ExamenesPracticoPista.actualizar('Prueba 9 - Actualizaci�n ExamenesPracticoPista violando PK',null,to_date('20/01/2018','DD/MM/YYYY'),'29190910A','No Apto',2,2,0,FALSE);

Pruebas_ExamenesPracticoPista.eliminar('Prueba 10 - Eliminar ExamenesPracticoPista', 'EPP4',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA VEHICULOS
**********************************************************************************************************/
Pruebas_Motocicletas.inicializar;
Pruebas_Turismos.inicializar;

Pruebas_Motocicletas.insertar('Prueba 1 - Inserci�n Motocicleta', '0929 MTC','ListoParaSuUso','Piagio 1729X',125, TRUE);
Pruebas_Motocicletas.insertar('Prueba 2 - Inserci�n Motocicleta', '1579 FFI','ListoParaSuUso','Honda 333A',150, TRUE);
Pruebas_Motocicletas.insertar('Prueba 3 - Inserci�n Motocicleta', '2561 ASA','ListoParaSuUso','Suzuki 167F',150, TRUE);

Pruebas_Motocicletas.insertar('Prueba 4 - Inserci�n Motocicleta violando Constraint Matricula', '092MMTC2','ListoParaSuUso','Piagio 1729X',125, FALSE);
Pruebas_Motocicletas.insertar('Prueba 5 - Inserci�n Motocicleta violando Constraint Estado', '0929 STC','Roto','Piagio 1729X',125, FALSE);
Pruebas_Motocicletas.insertar('Prueba 6 - Inserci�n Motocicleta violando PK', null,'Roto','Piagio 1729X',125, FALSE);

Pruebas_Motocicletas.actualizar('Prueba 7 - Actualizacion Motocicleta violando Constraint Matricula', '092MMTC2','ListoParaSuUso','Piagio 1729X',125, FALSE);
Pruebas_Motocicletas.actualizar('Prueba 8 - Actualizacion Motocicleta violando Constraint Estado', '0929 STC','Roto','Piagio 1729X',125, FALSE);
Pruebas_Motocicletas.actualizar('Prueba 9 - Actualizacion Motocicleta violando PK', null,'Averiado','Honda 333A', 150, FALSE);
Pruebas_Motocicletas.actualizar('Prueba 10 - Actualizacion Motocicleta sin cumplir RN-014', '1579 FFI','Averiado','Honda 333A', 150, TRUE);

Pruebas_Motocicletas.eliminar('Prueba 11 - Eliminar Motocicleta', '2561 ASA', TRUE);

Pruebas_Turismos.insertar('Prueba 1 - Inserci�n Turismo', '2819 WCT', 'ListoParaSuUso', 'Volkswagen Polo TDI', TRUE);
Pruebas_Turismos.insertar('Prueba 2 - Inserci�n Turismo', '1829 WCT', 'ListoParaSuUso', 'Renault Clio TDI', TRUE);
Pruebas_Turismos.insertar('Prueba 3 - Inserci�n Turismo', '2231 FFL', 'ListoParaSuUso', 'Mercedes STR', TRUE);

Pruebas_Turismos.insertar('Prueba 4 - Inserci�n Turismo violando Constraint Matricula', '092MMTC2', 'ListoParaSuUso', 'Renault Clio TDI', FALSE);
Pruebas_Turismos.insertar('Prueba 5 - Inserci�n Turismo violando Constraint Estado', '1829 WCT', 'Roto', 'Renault Clio TDI', FALSE);
Pruebas_Turismos.insertar('Prueba 6 - Inserci�n Turismo violando PK', null, 'ListoParaSuUso', 'Renault Clio TDI', FALSE);

Pruebas_Turismos.actualizar('Prueba 7 - Actualizacion Turismo violando Constraint Matricula', '092MMTC2', 'ListoParaSuUso', 'Renault Clio TDI', FALSE);
Pruebas_Turismos.actualizar('Prueba 8 - Actualizacion Turismo violando Constraint Estado', '1829 WCT', 'Roto', 'Renault Clio TDI', FALSE);
Pruebas_Turismos.actualizar('Prueba 9 - Actualizacion Turismo violando PK', null, 'ListoParaSuUso', 'Renault Clio TDI', FALSE);
Pruebas_Turismos.actualizar('Prueba 10 - Actualizacion Turismo sin cumplir RN-014', '2231 FFL', 'Averiado', 'Mercedes STR', TRUE);

Pruebas_Turismos.eliminar('Prueba 11 - Eliminar Turismo', '2231 FFL', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ALUMNOCONDUCEVEHICULO
**********************************************************************************************************/
Pruebas_AlumnoConduceMotos.inicializar;
Pruebas_AlumnoConduceTurismos.inicializar;

Pruebas_AlumnoConduceMotos.insertar('Prueba 1 - Inserci�n AlumnoConduceMotocicleta', '29190910A', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 2 - Inserci�n AlumnoConduceMotocicleta', '02903829A', '0929 MTC',TRUE);

Pruebas_AlumnoConduceMotos.insertar('Prueba 3 - Inserci�n AlumnoConduceMotocicleta violando PK', null, null,FALSE);

Pruebas_AlumnoConduceMotos.actualizar('Prueba 4 - Actualizaci�n AlumnoConduceMotocicleta violando PK', null, null,FALSE);

--Pruebas_AlumnoConduceMotos.eliminar('Prueba 5 - Eliminar AlumnoConduceMotocicleta', '02903829A', '0929 MTC', TRUE); NO SENTIDO?

Pruebas_AlumnoConduceTurismos.insertar('Prueba 1 - Inserci�n AlumnoConduceTurismo', '77850301Q', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 2 - Inserci�n AlumnoConduceTurismo', '77850282K', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 3 - Inserci�n AlumnoConduceTurismo', '77852929O', '1829 WCT',TRUE);

Pruebas_AlumnoConduceTurismos.insertar('Prueba 4 - Inserci�n AlumnoConduceTurismo violando PK', null, null,FALSE);

Pruebas_AlumnoConduceTurismos.actualizar('Prueba 5 - Actualizaci�n AlumnoConduceTurismo violando PK', null, null,FALSE);

--Pruebas_AlumnoConduceTurismos.eliminar('Prueba 6 - Eliminar AlumnoConduceTurismo', '77852929O', '1829 WCT', TRUE); NO SENTIDO?

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA SEGUROS
**********************************************************************************************************/
Pruebas_SegurosMotocicletas.inicializar;
Pruebas_SegurosTurismos.inicializar;

Pruebas_SegurosMotocicletas.insertar('Prueba 1 - Inserci�n SeguroMotocicleta', 'MUTUA', 'TodoRiesgo',to_date('13/11/2016','DD/MM/YYYY'), 'Anual', 240, '0929 MTC',TRUE);

Pruebas_SegurosMotocicletas.insertar('Prueba 2 - Inserci�n SeguroMotocicleta violando Constraint Importe', 'MUTUA', 'TodoRiesgo',to_date('13/11/2016','DD/MM/YYYY'), 'Anual', 0, '0929 MTC',FALSE);
Pruebas_SegurosMotocicletas.insertar('Prueba 3 - Inserci�n SeguroMotocicleta violando Constraint TipoCuotaySeguro', 'MUTUA', 'Arriesgados',to_date('13/11/2016','DD/MM/YYYY'), 'DosMeses', 240, '0929 MTC',FALSE);

Pruebas_SegurosMotocicletas.actualizar('Prueba 4 - Actualizacion SeguroMotocicleta violando Constraint Importe', 1,'MUTUA', 'TodoRiesgo',to_date('13/11/2016','DD/MM/YYYY'), 'Anual', 0, '0929 MTC',FALSE);
Pruebas_SegurosMotocicletas.actualizar('Prueba 5 - Actualizacion SeguroMotocicleta violando Constraint TipoCuotaySeguro', 1,'MUTUA', 'Arriesgados',to_date('13/11/2016','DD/MM/YYYY'), 'DosMeses', 240, '0929 MTC',FALSE);
Pruebas_SegurosMotocicletas.actualizar('Prueba 6 - Actualizacion SeguroMotocicleta violando PK', null,'MUTUA', 'TodoRiesgo',to_date('13/11/2016','DD/MM/YYYY'), 'Anual', 240, '0929 MTC',FALSE);

--Pruebas_SegurosMotocicletas.eliminar('Prueba 7 - Eliminar SeguroMotocicleta', 1, TRUE); NO TIENE SENTIDO

Pruebas_SegurosTurismos.insertar('Prueba 1 - Inserci�n SeguroTurismo', 'MAPFRE', 'TodoRiesgo',to_date('10/09/2015','DD/MM/YYYY'), 'Anual', 300, '1829 WCT',TRUE);

Pruebas_SegurosTurismos.insertar('Prueba 2 - Inserci�n SeguroTurismo violando Constraint Importe', 'MAPFRE', 'TodoRiesgo',to_date('10/09/2015','DD/MM/YYYY'), 'Anual', 0, '1829 WCT',FALSE);
Pruebas_SegurosTurismos.insertar('Prueba 3 - Inserci�n SeguroTurismo violando Constraint TipoCuotaySeguro', 'MAPFRE', 'Arriesgados',to_date('10/09/2015','DD/MM/YYYY'), 'DosMeses', 300, '1829 WCT',FALSE);

Pruebas_SegurosTurismos.actualizar('Prueba 4 - Actualizacion SeguroTurismo violando Constraint Importe', 1,'MAPFRE', 'TodoRiesgo',to_date('10/09/2015','DD/MM/YYYY'), 'Anual', 0, '1829 WCT',FALSE);
Pruebas_SegurosTurismos.actualizar('Prueba 5 - Actualizacion SeguroTurismo violando Constraint TipoCuotaySeguro', 1,'MAPFRE', 'Arriesgados',to_date('10/09/2015','DD/MM/YYYY'), 'DosMeses', 300, '1829 WCT',FALSE);
Pruebas_SegurosTurismos.actualizar('Prueba 6 - Actualizacion SeguroTurismo violando PK', null,'MAPFRE', 'TodoRiesgo',to_date('10/09/2015','DD/MM/YYYY'), 'Anual', 300, '1829 WCT',FALSE);

--Pruebas_SegurosTurismos.eliminar('Prueba 7 - Eliminar SeguroTurismo', 1, TRUE); NO TIENE SENTIDO

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ITV
**********************************************************************************************************/
Pruebas_ITVMotocicletas.inicializar;
Pruebas_ITVTurismos.inicializar;

Pruebas_ITVMotocicletas.insertar('Prueba 1 - Inserci�n ITVMotocicleta', to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '0929 MTC', TRUE);
Pruebas_ITVMotocicletas.insertar('Prueba 2 - Inserci�n ITVMotocicleta', to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '0929 MTC', TRUE);

Pruebas_ITVMotocicletas.insertar('Prueba 3 - Inserci�n ITVMotocicleta violando Constraint Coste', to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 0, 'Favorable', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.insertar('Prueba 4 - Inserci�n ITVMotocicleta violando Constraint Revision', to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'NoVisto', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.insertar('Prueba 5 - Inserci�n ITVMotocicleta violando Constraint Fecha', to_date('16/12/2022','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.insertar('Prueba 6 - Inserci�n ITVMotocicleta sin cumplir RN-015', to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Desfavorable', '1579 FFI', TRUE);


Pruebas_ITVMotocicletas.actualizar('Prueba 7 - Actualizacion ITVMotocicleta violando Constraint Coste',1, to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 0, 'Favorable', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.actualizar('Prueba 8 - Actualizacion ITVMotocicleta violando Constraint Revision',1, to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'NoVisto', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.actualizar('Prueba 9 - Actualizacion ITVMotocicleta violando Constraint Fecha',1, to_date('16/12/2022','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '0929 MTC', FALSE);
Pruebas_ITVMotocicletas.actualizar('Prueba 10 - Actualizacion ITVMotocicleta violando PK',null, to_date('12/10/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '0929 MTC', FALSE);

Pruebas_ITVMotocicletas.eliminar('Prueba 11 - Eliminar ITVMotocicleta', 2,TRUE);

Pruebas_ITVTurismos.insertar('Prueba 1 - Inserci�n ITVTurismos', to_date('12/12/2014','DD/MM/YYYY'), to_date('12/12/2018','DD/MM/YYYY'), 80, 'Favorable', '1829 WCT', TRUE);
Pruebas_ITVTurismos.insertar('Prueba 2 - Inserci�n ITVTurismos', to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Favorable', '1829 WCT', TRUE);
Pruebas_ITVTurismos.insertar('Prueba 3 - Inserci�n ITVTurismos', to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Favorable', '2819 WCT', TRUE);

Pruebas_ITVTurismos.insertar('Prueba 4 - Inserci�n ITVTurismos violando Constraint Coste', to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 0, 'Favorable', '1829 WCT', FALSE);
Pruebas_ITVTurismos.insertar('Prueba 5 - Inserci�n ITVTurismos violando Constraint Revision', to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'NoVisto', '1829 WCT', FALSE);
Pruebas_ITVTurismos.insertar('Prueba 6 - Inserci�n ITVTurismos violando Constraint Fecha', to_date('13/12/2023','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Favorable', '1829 WCT', FALSE);
Pruebas_ITVTurismos.insertar('Prueba 7 - Inserci�n ITVTurismos sin cumplir RN-015', to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Desfavorable', '2819 WCT', TRUE);


Pruebas_ITVTurismos.actualizar('Prueba 8 - Actualizacion ITVTurismos violando Constraint Coste',1, to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 0, 'Favorable', '1829 WCT', FALSE);
Pruebas_ITVTurismos.actualizar('Prueba 9 - Actualizacion ITVTurismos violando Constraint Revision',1, to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'NoVisto', '1829 WCT', FALSE);
Pruebas_ITVTurismos.actualizar('Prueba 10 - Actualizacion ITVTurismos violando Constraint Fecha',1, to_date('13/12/2023','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Favorable', '1829 WCT', FALSE);
Pruebas_ITVTurismos.actualizar('Prueba 11 - Actualizacion ITVTurismos violando PK',null, to_date('05/12/2018','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 80, 'Favorable', '1829 WCT', FALSE);

Pruebas_ITVTurismos.eliminar('Prueba 12 - Eliminar ITVTurismos', 3,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TALLERES
**********************************************************************************************************/
Pruebas_Talleres.inicializar;

Pruebas_Talleres.insertar('Prueba 1 - Inserci�n Taller', 'Taller Paco', 'Av Reina Mercedes', '954131234', TRUE);

Pruebas_Talleres.insertar('Prueba 2 - Inserci�n Taller violando Constraint Telefono', 'Taller Paco', 'Av Reina Mercedes', '9D4131234', FALSE);
Pruebas_Talleres.insertar('Prueba 3 - Inserci�n Taller violando PK', null, 'Av Reina Mercedes', '954131234', FALSE);

Pruebas_Talleres.actualizar('Prueba 4 - Inserci�n Taller violando Constraint Telefono', 'Taller Paco', 'Av Reina Mercedes', '9D4131234', FALSE);
Pruebas_Talleres.actualizar('Prueba 5 - Inserci�n Taller violando PK', null, 'Av Reina Mercedes', '954131234', FALSE);

--Pruebas_Talleres.eliminar('Prueba 6 - Eliminar Taller', 'Taller Paco',TRUE); NO TIENE SENTIDO

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA REPARACIONES
**********************************************************************************************************/
Pruebas_ReparacionesMotos.inicializar;
Pruebas_ReparacionesTurismos.inicializar;

Pruebas_ReparacionesMotos.insertar('Prueba 1 - Inserci�n Reparaci�nMotocicleta', 'Rueda trasera', to_date('10/01/2017','DD/MM/YYYY'), 70, '0929 MTC', 'Taller Paco', TRUE);

Pruebas_ReparacionesMotos.insertar('Prueba 2 - Inserci�n Reparaci�nMotocicleta violando Constraint Coste', 'Rueda trasera', to_date('10/01/2017','DD/MM/YYYY'), 0, '0929 MTC', 'Taller Paco', FALSE);

Pruebas_ReparacionesMotos.actualizar('Prueba 3 - Actualizacion Reparaci�nMotocicleta violando Constraint Coste',1, 'Rueda trasera', to_date('10/01/2017','DD/MM/YYYY'), 0, '0929 MTC', 'Taller Paco', FALSE);
Pruebas_ReparacionesMotos.actualizar('Prueba 4 - Actualizacion Reparaci�nMotocicleta violando PK',null, 'Rueda trasera', to_date('10/01/2017','DD/MM/YYYY'), 70, '0929 MTC', 'Taller Paco', FALSE);

--Pruebas_ReparacionesMotos.eliminar('Prueba 5 - Eliminacion Reparaci�nMotocicleta', 1, TRUE); NO TIENE SENTIDO

Pruebas_ReparacionesTurismos.insertar('Prueba 1 - Inserci�n Reparaci�nTurismo', 'reparacion luna trasera', to_date('10/09/2016','DD/MM/YYYY'), 90, '1829 WCT', 'Taller Paco', TRUE);

Pruebas_ReparacionesTurismos.insertar('Prueba 2 - Inserci�n Reparaci�nTurismo violando Constraint Coste', 'reparacion luna trasera', to_date('10/09/2016','DD/MM/YYYY'), 0, '1829 WCT', 'Taller Paco', FALSE);

Pruebas_ReparacionesTurismos.actualizar('Prueba 3 - Actualizacion Reparaci�nTurismo violando Constraint Coste',1, 'reparacion luna trasera', to_date('10/09/2016','DD/MM/YYYY'), 0, '1829 WCT', 'Taller Paco', FALSE);
Pruebas_ReparacionesTurismos.actualizar('Prueba 4 - Actualizacion Reparaci�nTurismo violando PK',null, 'reparacion luna trasera', to_date('10/09/2016','DD/MM/YYYY'), 90, '1829 WCT', 'Taller Paco', FALSE);

--Pruebas_ReparacionesTurismos.eliminar('Prueba 5 - Eliminacion Reparaci�nTurismo', 1, TRUE); NO TIENE SENTIDO


END;
