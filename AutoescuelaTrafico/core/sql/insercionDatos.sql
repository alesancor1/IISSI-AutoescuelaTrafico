SET SERVEROUTPUT ON;

BEGIN
/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA WEBTESTS
**********************************************************************************************************/
Pruebas_WebTests.inicializar;

Pruebas_WebTests.insertar('Prueba 1 - Inserci�n WebTest','Online',TRUE);


dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA OFERTA
**********************************************************************************************************/
Pruebas_Oferta.inicializar;

Pruebas_Oferta.insertar('Prueba 1 - Inserci�n Oferta',179, 10, 3,1, TRUE);
Pruebas_Oferta.insertar('Prueba 2 - Inserci�n Oferta',295, 10, 3,1, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ACCESOWEB
**********************************************************************************************************/
INSERT INTO LOGIN VALUES ('alesancor','77850301Q','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('belcorgar','09973707X','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('antpergut','54720204F','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('juagarlop','06854766F','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('margonrui','08049124K','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('ignnunmun','56207746R','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('marsanmun','24173215P','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('pepmarlop','94187735K','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('domlopgom','29189437E','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('marruisan','40995425H','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('carpermat','13457295H','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('davfermar','46517059L','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('frajimher','52252397P','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('blaramvaz','64344800T','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('marmatfer','02841581T','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('feraloser','89876288Q','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('aguviclor','75118377D','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('luidurben','19320559F','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('evatornav','52478537N','traficoALUM','Alumno');
INSERT INTO LOGIN VALUES ('sardomcas','88540629J','traficoALUM','Alumno');

INSERT INTO LOGIN VALUES ('joslopgom','65624245R','traficoPROF','Profesor');
INSERT INTO LOGIN VALUES ('pacpersan','35228740P','traficoPROF','Profesor');
INSERT INTO LOGIN VALUES ('jesnavcas','61789624D','traficoPROF','Profesor');

INSERT INTO LOGIN VALUES ('admin',null,'traficoADM','Administrador');


/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ACCESOWEB
**********************************************************************************************************/
Pruebas_AccesoWeb.inicializar;

Pruebas_AccesoWeb.insertar('Prueba 1 - Inserci�n AccesoWeb', '77850301Q',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 2 - Inserci�n AccesoWeb', '09973707X',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 3 - Inserci�n AccesoWeb', '54720204F',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 4 - Inserci�n AccesoWeb', '06854766F',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 5 - Inserci�n AccesoWeb', '08049124K',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 6 - Inserci�n AccesoWeb', '56207746R',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 7 - Inserci�n AccesoWeb', '24173215P',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 8 - Inserci�n AccesoWeb', '94187735K',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 9 - Inserci�n AccesoWeb', '29189437E',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 10 - Inserci�n AccesoWeb', '40995425H',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 11 - Inserci�n AccesoWeb', '13457295H',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 12 - Inserci�n AccesoWeb', '46517059L',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 13 - Inserci�n AccesoWeb', '52252397P',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 14 - Inserci�n AccesoWeb', '64344800T',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 15 - Inserci�n AccesoWeb', '02841581T',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 16 - Inserci�n AccesoWeb', '89876288Q',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 17 - Inserci�n AccesoWeb', '75118377D',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 18 - Inserci�n AccesoWeb', '19320559F',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 19 - Inserci�n AccesoWeb', '52478537N',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);
Pruebas_AccesoWeb.insertar('Prueba 20 - Inserci�n AccesoWeb', '88540629J',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ALUMNOS
**********************************************************************************************************/
Pruebas_Alumnos.inicializar;

Pruebas_Alumnos.insertar('Prueba 1 - Inserci�n Alumno', '77850301Q', 'Alejandro', 'Santisteban Corchos', null, 10, to_date('17/08/1980','DD/MM/YYYY'),'Valido','77850301Q', TRUE);
Pruebas_Alumnos.insertar('Prueba 2 - Inserci�n Alumno', '09973707X', 'Beltran', 'Coronado Garcia', '418029010', 20, to_date('19/09/1977','DD/MM/YYYY'),'Valido','09973707X' , TRUE);
Pruebas_Alumnos.insertar('Prueba 3 - Inserci�n Alumno', '54720204F', 'Antonio', 'Perez Gutierrez', null, 5, to_date('17/08/1979','DD/MM/YYYY'),'Valido','54720204F', TRUE);
Pruebas_Alumnos.insertar('Prueba 4 - Inserci�n Alumno', '06854766F', 'Juan', 'Garcia Lopez', '100202191', 10, to_date('11/01/1976','DD/MM/YYYY'),'Valido','06854766F', TRUE);
Pruebas_Alumnos.insertar('Prueba 5 - Inserci�n Alumno', '08049124K', 'Marta', 'Gonzalez Ruiz', null, 5, to_date('17/08/1976','DD/MM/YYYY'),'Valido','08049124K', TRUE);
Pruebas_Alumnos.insertar('Prueba 6 - Inserci�n Alumno', '56207746R', 'Ignacio', 'Nunez Mu�oz', '777273718', 10, to_date('17/10/1976','DD/MM/YYYY'),'Valido','56207746R', TRUE);
Pruebas_Alumnos.insertar('Prueba 7 - Inserci�n Alumno', '24173215P', 'Martin', 'Sanchez Munoz', '786450851', 10, to_date('07/10/1976','DD/MM/YYYY'),'Valido','24173215P', TRUE);
Pruebas_Alumnos.insertar('Prueba 8 - Inserci�n Alumno', '94187735K', 'Pepe', 'Martinez Lopez', '786442111', 10, to_date('07/11/1976','DD/MM/YYYY'),'Valido','94187735K', TRUE);
Pruebas_Alumnos.insertar('Prueba 9 - Inserci�n Alumno', '29189437E', 'Domingo', 'Lopez Gomez', null, 10, to_date('04/08/1976','DD/MM/YYYY'),'Valido','29189437E', TRUE);
Pruebas_Alumnos.insertar('Prueba 10 - Inserci�n Alumno', '40995425H', 'Maria', 'Ruiz Sanchez', null, 10, to_date('01/02/1976','DD/MM/YYYY'),'Valido','40995425H', TRUE);
Pruebas_Alumnos.insertar('Prueba 11 - Inserci�n Alumno', '13457295H', 'Carmen', 'Perez Mateos', null, 10, to_date('22/04/1976','DD/MM/YYYY'),'Valido','13457295H', TRUE);
Pruebas_Alumnos.insertar('Prueba 12 - Inserci�n Alumno', '46517059L', 'David', 'Fernandez Martin', null, 10, to_date('20/09/1976','DD/MM/YYYY'),'Valido','46517059L', TRUE);
Pruebas_Alumnos.insertar('Prueba 13 - Inserci�n Alumno', '52252397P', 'Francisco', 'Jimenez Hernandez', null, 10, to_date('24/11/1976','DD/MM/YYYY'),'Valido','52252397P', TRUE);
Pruebas_Alumnos.insertar('Prueba 14 - Inserci�n Alumno', '64344800T', 'Blanca', 'Ramos Vazquez', null, 10, to_date('04/03/1976','DD/MM/YYYY'),'Valido','64344800T', TRUE);
Pruebas_Alumnos.insertar('Prueba 15 - Inserci�n Alumno', '02841581T', 'Marcos', 'Mateos Fernandez', null, 10, to_date('09/06/1976','DD/MM/YYYY'),'Valido','02841581T', TRUE);
Pruebas_Alumnos.insertar('Prueba 16 - Inserci�n Alumno', '89876288Q', 'Fernando', 'Alonso Serrano', null, 10, to_date('23/12/1976','DD/MM/YYYY'),'Valido','89876288Q', TRUE);
Pruebas_Alumnos.insertar('Prueba 17 - Inserci�n Alumno', '75118377D', 'Agustin', 'Vicente Lorenzo', null, 10, to_date('10/06/1976','DD/MM/YYYY'),'Valido','75118377D', TRUE);
Pruebas_Alumnos.insertar('Prueba 18 - Inserci�n Alumno', '19320559F', 'Luis', 'Duran Benitez', null, 10, to_date('17/11/1976','DD/MM/YYYY'),'Valido','19320559F', TRUE);
Pruebas_Alumnos.insertar('Prueba 19 - Inserci�n Alumno', '52478537N', 'Evaristo', 'Torres Navarro', null, 10, to_date('20/11/1976','DD/MM/YYYY'),'Valido','52478537N', TRUE);
Pruebas_Alumnos.insertar('Prueba 20 - Inserci�n Alumno', '88540629J', 'Sara', 'Dominguez Castro', null, 10, to_date('10/05/1976','DD/MM/YYYY'),'Valido','88540629J', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOCLASES
**********************************************************************************************************/
Pruebas_PagoClases.inicializar;

Pruebas_PagoClases.insertar('Prueba 1 - Inserci�n PagoClase', '77850301Q', to_date('06/06/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 2 - Inserci�n PagoClase', '09973707X', to_date('02/07/2018','DD/MM/YYYY'), 360, 20, TRUE);
Pruebas_PagoClases.insertar('Prueba 3 - Inserci�n PagoClase', '54720204F', to_date('12/08/2018','DD/MM/YYYY'), 36, 2, TRUE);
Pruebas_PagoClases.insertar('Prueba 4 - Inserci�n PagoClase', '06854766F', to_date('17/09/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 5 - Inserci�n PagoClase', '08049124K', to_date('19/10/2018','DD/MM/YYYY'), 90, 5, TRUE);
Pruebas_PagoClases.insertar('Prueba 6 - Inserci�n PagoClase', '56207746R', to_date('22/11/2018','DD/MM/YYYY'), 36, 2, TRUE);
Pruebas_PagoClases.insertar('Prueba 7 - Inserci�n PagoClase', '24173215P', to_date('08/12/2018','DD/MM/YYYY'), 36, 2, TRUE);
Pruebas_PagoClases.insertar('Prueba 8 - Inserci�n PagoClase', '94187735K', to_date('11/07/2018','DD/MM/YYYY'), 54, 3, TRUE);
Pruebas_PagoClases.insertar('Prueba 9 - Inserci�n PagoClase', '29189437E', to_date('25/08/2018','DD/MM/YYYY'), 72, 4, TRUE);
Pruebas_PagoClases.insertar('Prueba 10 - Inserci�n PagoClase', '40995425H', to_date('05/08/2018','DD/MM/YYYY'), 90, 5, TRUE);
Pruebas_PagoClases.insertar('Prueba 11 - Inserci�n PagoClase', '13457295H', to_date('23/10/2018','DD/MM/YYYY'), 108, 6, TRUE);
Pruebas_PagoClases.insertar('Prueba 12 - Inserci�n PagoClase', '46517059L', to_date('02/11/2018','DD/MM/YYYY'), 126, 7, TRUE);
Pruebas_PagoClases.insertar('Prueba 13 - Inserci�n PagoClase', '52252397P', to_date('07/12/2018','DD/MM/YYYY'), 144, 8, TRUE);
Pruebas_PagoClases.insertar('Prueba 14 - Inserci�n PagoClase', '64344800T', to_date('09/08/2018','DD/MM/YYYY'), 162, 9, TRUE);
Pruebas_PagoClases.insertar('Prueba 15 - Inserci�n PagoClase', '02841581T', to_date('13/07/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 16 - Inserci�n PagoClase', '89876288Q', to_date('14/07/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 17 - Inserci�n PagoClase', '75118377D', to_date('15/07/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 18 - Inserci�n PagoClase', '19320559F', to_date('11/07/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 19 - Inserci�n PagoClase', '52478537N', to_date('12/07/2018','DD/MM/YYYY'), 180, 10, TRUE);
Pruebas_PagoClases.insertar('Prueba 20 - Inserci�n PagoClase', '88540629J', to_date('13/07/2018','DD/MM/YYYY'), 180, 10, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ORDENADORES
**********************************************************************************************************/
Pruebas_Ordenadores.inicializar;

Pruebas_Ordenadores.insertar('Prueba 1 - Inserci�n Ordenador', 'BuenEstado','TOSHIBA 279XLP', 'Windows10', TRUE);
Pruebas_Ordenadores.insertar('Prueba 2 - Inserci�n Ordenador', 'Nuevo','ACER 1810S', 'Ubuntu 18.04', TRUE);
Pruebas_Ordenadores.insertar('Prueba 3 - Inserci�n Ordenador', 'MalEstado','HP 192C', 'Windows10', TRUE);
Pruebas_Ordenadores.insertar('Prueba 4 - Inserci�n Ordenador', 'Aceptable','LENOVO 1828X', 'Ubuntu 18.04', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA USOPC
**********************************************************************************************************/
Pruebas_UsoPC.inicializar;

Pruebas_UsoPC.insertar('Prueba 1 - Inserci�n UsoPC', to_date('01/01/2018','DD/MM/YYYY'),'12:30','14:00', '77850301Q',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 2 - Inserci�n UsoPC', to_date('13/02/2018','DD/MM/YYYY'),'11:30','12:30', '09973707X',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 3 - Inserci�n UsoPC', to_date('05/03/2018','DD/MM/YYYY'),'16:30','17:00', '54720204F',3, TRUE);
Pruebas_UsoPC.insertar('Prueba 4 - Inserci�n UsoPC', to_date('16/04/2018','DD/MM/YYYY'),'17:30','18:00', '06854766F',4, TRUE);
Pruebas_UsoPC.insertar('Prueba 5 - Inserci�n UsoPC', to_date('17/05/2018','DD/MM/YYYY'),'17:30','18:30', '08049124K',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 6 - Inserci�n UsoPC', to_date('11/01/2018','DD/MM/YYYY'),'18:30','19:00', '56207746R',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 7 - Inserci�n UsoPC', to_date('12/03/2018','DD/MM/YYYY'),'19:30','20:00', '24173215P',3, TRUE);
Pruebas_UsoPC.insertar('Prueba 8 - Inserci�n UsoPC', to_date('14/04/2018','DD/MM/YYYY'),'11:00','12:00', '94187735K',4, TRUE);
Pruebas_UsoPC.insertar('Prueba 9 - Inserci�n UsoPC', to_date('22/01/2018','DD/MM/YYYY'),'12:30','14:00', '29189437E',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 10 - Inserci�n UsoPC', to_date('24/05/2018','DD/MM/YYYY'),'16:30','17:00', '40995425H',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 11 - Inserci�n UsoPC', to_date('03/01/2018','DD/MM/YYYY'),'17:30','18:00', '13457295H',3, TRUE);
Pruebas_UsoPC.insertar('Prueba 12 - Inserci�n UsoPC', to_date('15/04/2018','DD/MM/YYYY'),'18:30','19:00', '46517059L',4, TRUE);
Pruebas_UsoPC.insertar('Prueba 13 - Inserci�n UsoPC', to_date('10/01/2018','DD/MM/YYYY'),'20:00','20:30', '52252397P',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 14 - Inserci�n UsoPC', to_date('03/02/2018','DD/MM/YYYY'),'12:30','13:00', '64344800T',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 15 - Inserci�n UsoPC', to_date('05/03/2018','DD/MM/YYYY'),'13:30','14:00', '02841581T',3, TRUE);
Pruebas_UsoPC.insertar('Prueba 16 - Inserci�n UsoPC', to_date('02/04/2018','DD/MM/YYYY'),'11:30','12:00', '89876288Q',4, TRUE);
Pruebas_UsoPC.insertar('Prueba 17 - Inserci�n UsoPC', to_date('05/05/2018','DD/MM/YYYY'),'16:30','18:00', '75118377D',1, TRUE);
Pruebas_UsoPC.insertar('Prueba 18 - Inserci�n UsoPC', to_date('07/03/2018','DD/MM/YYYY'),'19:30','20:00', '19320559F',2, TRUE);
Pruebas_UsoPC.insertar('Prueba 19 - Inserci�n UsoPC', to_date('09/04/2018','DD/MM/YYYY'),'12:30','13:00', '52478537N',3, TRUE);
Pruebas_UsoPC.insertar('Prueba 20 - Inserci�n UsoPC', to_date('01/05/2018','DD/MM/YYYY'),'19:30','20:00', '88540629J',4, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA MATRICULA
**********************************************************************************************************/
Pruebas_Matriculas.inicializar;

Pruebas_Matriculas.insertar('Prueba 1 - Inserci�n Matricula', to_date('20/12/2017','DD/MM/YYYY'),'Permiso B','77850301Q',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 2 - Inserci�n Matricula', to_date('21/12/2017','DD/MM/YYYY'),'Permiso B','09973707X',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 3 - Inserci�n Matricula', to_date('22/12/2017','DD/MM/YYYY'),'Permiso B','54720204F',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 4 - Inserci�n Matricula', to_date('23/12/2017','DD/MM/YYYY'),'Permiso B','06854766F',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 5 - Inserci�n Matricula', to_date('24/12/2017','DD/MM/YYYY'),'Permiso B','08049124K',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 6 - Inserci�n Matricula', to_date('25/12/2017','DD/MM/YYYY'),'Permiso B','56207746R',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 7 - Inserci�n Matricula', to_date('26/12/2017','DD/MM/YYYY'),'Permiso B','24173215P',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 8 - Inserci�n Matricula', to_date('27/12/2017','DD/MM/YYYY'),'Permiso B','94187735K',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 9 - Inserci�n Matricula', to_date('28/12/2017','DD/MM/YYYY'),'Permiso B','29189437E',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 10 - Inserci�n Matricula', to_date('29/12/2017','DD/MM/YYYY'),'Permiso B','40995425H',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 11 - Inserci�n Matricula', to_date('20/12/2017','DD/MM/YYYY'),'Permiso B','13457295H',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 12 - Inserci�n Matricula', to_date('21/12/2017','DD/MM/YYYY'),'Permiso B','46517059L',1,TRUE);
Pruebas_Matriculas.insertar('Prueba 13 - Inserci�n Matricula', to_date('22/12/2017','DD/MM/YYYY'),'Permiso A2','52252397P',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 14 - Inserci�n Matricula', to_date('23/12/2017','DD/MM/YYYY'),'Permiso A2','64344800T',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 15 - Inserci�n Matricula', to_date('24/12/2017','DD/MM/YYYY'),'Permiso A2','02841581T',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 16 - Inserci�n Matricula', to_date('25/12/2017','DD/MM/YYYY'),'Permiso A2','89876288Q',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 17 - Inserci�n Matricula', to_date('26/12/2017','DD/MM/YYYY'),'Permiso A2','75118377D',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 18 - Inserci�n Matricula', to_date('27/12/2017','DD/MM/YYYY'),'Permiso A2','19320559F',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 19 - Inserci�n Matricula', to_date('28/12/2017','DD/MM/YYYY'),'Permiso A2','52478537N',2,TRUE);
Pruebas_Matriculas.insertar('Prueba 20 - Inserci�n Matricula', to_date('29/12/2017','DD/MM/YYYY'),'Permiso B','88540629J',1,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOTASAS
**********************************************************************************************************/
Pruebas_PagoTasas.inicializar;

Pruebas_PagoTasas.insertar('Prueba 1 - Inserci�n PagoTasas', 138, to_date('01/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 2 - Inserci�n PagoTasas', 138, to_date('02/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 3 - Inserci�n PagoTasas', 120, to_date('03/07/2018','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 4 - Inserci�n PagoTasas', 120, to_date('04/07/2018','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 5 - Inserci�n PagoTasas', 120, to_date('05/07/2018','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 6 - Inserci�n PagoTasas', 138, to_date('06/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 7 - Inserci�n PagoTasas', 138, to_date('07/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 8 - Inserci�n PagoTasas', 138, to_date('08/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 9 - Inserci�n PagoTasas', 138, to_date('09/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 10 - Inserci�n PagoTasas', 138, to_date('10/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 11 - Inserci�n PagoTasas', 138, to_date('11/07/2018','DD/MM/YYYY'), 1, TRUE);
Pruebas_PagoTasas.insertar('Prueba 12 - Inserci�n PagoTasas', 120, to_date('12/07/2018','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 13 - Inserci�n PagoTasas', 120, to_date('13/07/2018','DD/MM/YYYY'), 2, TRUE);
Pruebas_PagoTasas.insertar('Prueba 14 - Inserci�n PagoTasas', 120, to_date('14/07/2018','DD/MM/YYYY'), 2, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TASAS
**********************************************************************************************************/
Pruebas_Tasas.inicializar;

Pruebas_Tasas.insertar('Prueba 1 - Inserci�n Tasa', '2.2', 'Examen dentro y fuera de la capital', 'Obtencion de licencia de conducion', 43, TRUE);
Pruebas_Tasas.insertar('Prueba 2 - Inserci�n Tasa', '1.1', 'Permiso de circulacion', 'Expedicion Permiso circulacion', 95, TRUE);
Pruebas_Tasas.insertar('Prueba 3 - Inserci�n Tasa', '4.2', 'Inspeccion autoescuela y centro medico', 'Inspeccion reglamentaria', 100, TRUE);
Pruebas_Tasas.insertar('Prueba 4 - Inserci�n Tasa', '3.1', 'Tasa obligatoria', 'Obligacion trafico', 76, TRUE);
Pruebas_Tasas.insertar('Prueba 5 - Inserci�n Tasa', '3.2', 'Tasa obligatoria', 'Obligacion trafico', 77, TRUE);
Pruebas_Tasas.insertar('Prueba 6 - Inserci�n Tasa', '3.3', 'Tasa obligatoria', 'Obligacion trafico', 34, TRUE);
Pruebas_Tasas.insertar('Prueba 7 - Inserci�n Tasa', '4.1', 'Tasa obligatoria', 'Obligacion trafico', 74, TRUE);
Pruebas_Tasas.insertar('Prueba 8 - Inserci�n Tasa', '4.3', 'Tasa obligatoria', 'Obligacion trafico', 44, TRUE);
Pruebas_Tasas.insertar('Prueba 9 - Inserci�n Tasa', '2.1', 'Tasa obligatoria', 'Obligacion trafico', 55, TRUE);
Pruebas_Tasas.insertar('Prueba 10 - Inserci�n Tasa', '1.2', 'Tasa obligatoria', 'Obligacion trafico', 90, TRUE);
Pruebas_Tasas.insertar('Prueba 11 - Inserci�n Tasa', '1.3', 'Tasa obligatoria', 'Obligacion trafico', 95, TRUE);
Pruebas_Tasas.insertar('Prueba 12 - Inserci�n Tasa', '1.4', 'Tasa obligatoria', 'Obligacion trafico', 33, TRUE);
Pruebas_Tasas.insertar('Prueba 13 - Inserci�n Tasa', '2.3', 'Tasa obligatoria', 'Obligacion trafico', 44, TRUE);
Pruebas_Tasas.insertar('Prueba 14 - Inserci�n Tasa', '2.4', 'Tasa obligatoria', 'Obligacion trafico', 100, TRUE);
Pruebas_Tasas.insertar('Prueba 15 - Inserci�n Tasa', '2.5', 'Tasa obligatoria', 'Obligacion trafico', 68, TRUE);
Pruebas_Tasas.insertar('Prueba 16 - Inserci�n Tasa', '1.6', 'Tasa obligatoria', 'Obligacion trafico', 76, TRUE);
Pruebas_Tasas.insertar('Prueba 17 - Inserci�n Tasa', '1.7', 'Tasa obligatoria', 'Obligacion trafico', 77, TRUE);
Pruebas_Tasas.insertar('Prueba 19 - Inserci�n Tasa', '2.6', 'Tasa obligatoria', 'Obligacion trafico', 74, TRUE);
Pruebas_Tasas.insertar('Prueba 20 - Inserci�n Tasa', '2.7', 'Tasa obligatoria', 'Obligacion trafico', 44, TRUE);
Pruebas_Tasas.insertar('Prueba 22 - Inserci�n Tasa', '3.6', 'Tasa obligatoria', 'Obligacion trafico', 90, TRUE);
Pruebas_Tasas.insertar('Prueba 23 - Inserci�n Tasa', '3.7', 'Tasa obligatoria', 'Obligacion trafico', 95, TRUE);
Pruebas_Tasas.insertar('Prueba 25 - Inserci�n Tasa', '4.6', 'Tasa obligatoria', 'Obligacion trafico', 44, TRUE);
Pruebas_Tasas.insertar('Prueba 26 - Inserci�n Tasa', '4.7', 'Tasa obligatoria', 'Obligacion trafico', 100, TRUE);
Pruebas_Tasas.insertar('Prueba 28 - Inserci�n Tasa', '1.5', 'Tasa obligatoria', 'Obligacion trafico', 68, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PAGOCONTIENETASAS
**********************************************************************************************************/
Pruebas_PagoContieneTasas.inicializar;

Pruebas_PagoContieneTasas.insertar('Prueba 1 - Inserci�n PagoContieneTasa', 1,'1.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 2 - Inserci�n PagoContieneTasa', 1,'1.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 3 - Inserci�n PagoContieneTasa', 2,'1.3', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 4 - Inserci�n PagoContieneTasa', 2,'1.4', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 5 - Inserci�n PagoContieneTasa', 3,'1.5', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 6 - Inserci�n PagoContieneTasa', 3,'1.6', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 7 - Inserci�n PagoContieneTasa', 4,'1.7', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 9 - Inserci�n PagoContieneTasa', 5,'2.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 10 - Inserci�n PagoContieneTasa', 5,'2.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 11 - Inserci�n PagoContieneTasa', 6,'2.3', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 12 - Inserci�n PagoContieneTasa', 6,'2.4', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 13 - Inserci�n PagoContieneTasa', 7,'2.5', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 14 - Inserci�n PagoContieneTasa', 7,'2.6', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 15 - Inserci�n PagoContieneTasa', 8,'2.7', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 17 - Inserci�n PagoContieneTasa', 9,'3.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 18 - Inserci�n PagoContieneTasa', 9,'3.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 19 - Inserci�n PagoContieneTasa', 10,'3.3', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 20 - Inserci�n PagoContieneTasa', 10,'3.6', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 21 - Inserci�n PagoContieneTasa', 11,'3.7', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 23 - Inserci�n PagoContieneTasa', 12,'4.1', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 24 - Inserci�n PagoContieneTasa', 12,'4.2', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 25 - Inserci�n PagoContieneTasa', 13,'4.3', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 26 - Inserci�n PagoContieneTasa', 13,'4.6', TRUE);
Pruebas_PagoContieneTasas.insertar('Prueba 27 - Inserci�n PagoContieneTasa', 14,'4.7', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROFESORES
**********************************************************************************************************/
Pruebas_Profesores.inicializar;

Pruebas_Profesores.insertar('Prueba 1 - Inserci�n Profesor', '65624245R', 'Jose Manuel', 'Lopez Gomez',to_date('11/10/2017','DD/MM/YYYY') , '700445566', 2200, '41 2828381939',TRUE);
Pruebas_Profesores.insertar('Prueba 2 - Inserci�n Profesor', '35228740P', 'Paco', 'Perez Sanchez',to_date('19/10/2017','DD/MM/YYYY') , '701325321', 2100, '41 1849291038',TRUE);
Pruebas_Profesores.insertar('Prueba 3 - Inserci�n Profesor', '61789624D', 'Jesus', 'Navas Casillas',to_date('09/10/2017','DD/MM/YYYY') , '677001122', 2000, '41 1849267218',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PERMISOS
**********************************************************************************************************/
Pruebas_Permisos.inicializar;

Pruebas_Permisos.insertar('Prueba 1 - Inserci�n Permiso', 'Permiso B',TRUE);
Pruebas_Permisos.insertar('Prueba 2 - Inserci�n Permiso', 'Permiso A2',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROFESORESIMPARTENPERMISOS
**********************************************************************************************************/
Pruebas_ProfImpartenPerm.inicializar;

Pruebas_ProfImpartenPerm.insertar('Prueba 1 - Inserci�n ProfesorImpartePermiso', '65624245R','Permiso B',TRUE);
Pruebas_ProfImpartenPerm.insertar('Prueba 2 - Inserci�n ProfesorImpartePermiso', '35228740P','Permiso B',TRUE);
Pruebas_ProfImpartenPerm.insertar('Prueba 3 - Inserci�n ProfesorImpartePermiso', '61789624D','Permiso A2',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA EXAMEN TEORICO
**********************************************************************************************************/

Pruebas_ExamenesPracticoCirc.inicializar;
Pruebas_ExamenesPracticoPista.inicializar;
Pruebas_ExamenesTeoricos.inicializar;

Pruebas_ExamenesTeoricos.insertar('Prueba 1 - Inserci�n ExamenTeorico',to_date('01/06/2018','DD/MM/YYYY'),'77850301Q','No Apto', 4, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 2 - Inserci�n ExamenTeorico',to_date('02/06/2018','DD/MM/YYYY'),'09973707X','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 3 - Inserci�n ExamenTeorico',to_date('03/06/2018','DD/MM/YYYY'),'54720204F','Apto', 2, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 4 - Inserci�n ExamenTeorico',to_date('04/06/2018','DD/MM/YYYY'),'06854766F','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 5 - Inserci�n ExamenTeorico',to_date('05/06/2018','DD/MM/YYYY'),'08049124K','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 6 - Inserci�n ExamenTeorico',to_date('06/06/2018','DD/MM/YYYY'),'56207746R','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 7 - Inserci�n ExamenTeorico',to_date('07/06/2018','DD/MM/YYYY'),'24173215P','Apto', 2, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 8 - Inserci�n ExamenTeorico',to_date('08/06/2018','DD/MM/YYYY'),'94187735K','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 9 - Inserci�n ExamenTeorico',to_date('09/06/2018','DD/MM/YYYY'),'29189437E','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 10 - Inserci�n ExamenTeorico',to_date('10/06/2018','DD/MM/YYYY'),'40995425H','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 11 - Inserci�n ExamenTeorico',to_date('11/06/2018','DD/MM/YYYY'),'13457295H','Apto', 3, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 12 - Inserci�n ExamenTeorico',to_date('12/06/2018','DD/MM/YYYY'),'46517059L','No Apto', 4, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 13 - Inserci�n ExamenTeorico',to_date('13/06/2018','DD/MM/YYYY'),'52252397P','No Apto', 5, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 14 - Inserci�n ExamenTeorico',to_date('14/06/2018','DD/MM/YYYY'),'64344800T','No Apto', 5, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 15 - Inserci�n ExamenTeorico',to_date('15/06/2018','DD/MM/YYYY'),'02841581T','No Apto', 4, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 16 - Inserci�n ExamenTeorico',to_date('16/06/2018','DD/MM/YYYY'),'89876288Q','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 17 - Inserci�n ExamenTeorico',to_date('17/06/2018','DD/MM/YYYY'),'75118377D','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 18 - Inserci�n ExamenTeorico',to_date('18/06/2018','DD/MM/YYYY'),'19320559F','Apto', 2, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 19 - Inserci�n ExamenTeorico',to_date('19/06/2018','DD/MM/YYYY'),'52478537N','Apto', 3, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 20 - Inserci�n ExamenTeorico',to_date('20/06/2018','DD/MM/YYYY'),'88540629J','Apto', 3, TRUE);

Pruebas_ExamenesTeoricos.insertar('Prueba 21 - Inserci�n ExamenTeorico',to_date('01/07/2018','DD/MM/YYYY'),'77850301Q','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 22 - Inserci�n ExamenTeorico',to_date('01/07/2018','DD/MM/YYYY'),'46517059L','Apto', 0, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 23 - Inserci�n ExamenTeorico',to_date('02/07/2018','DD/MM/YYYY'),'52252397P','Apto', 1, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 24 - Inserci�n ExamenTeorico',to_date('03/07/2018','DD/MM/YYYY'),'64344800T','Apto', 2, TRUE);
Pruebas_ExamenesTeoricos.insertar('Prueba 25 - Inserci�n ExamenTeorico',to_date('04/07/2018','DD/MM/YYYY'),'02841581T','Apto', 3, TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA CLASES
**********************************************************************************************************/
Pruebas_Clases.inicializar;

Pruebas_Clases.insertar('Prueba 1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'10:00','10:40','65624245R','77850301Q',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 1.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'10:00','10:40','65624245R','77850301Q',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 2 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'10:00','10:40','35228740P','09973707X',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 2.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'10:00','10:40','35228740P','09973707X',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 3 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'12:00','12:40','65624245R','54720204F',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 3.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'12:00','12:40','65624245R','54720204F',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 4 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'12:00','12:40','35228740P','06854766F',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 4.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'12:00','12:40','35228740P','06854766F',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 5 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'13:20','14:00','65624245R','08049124K',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 5.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'13:20','14:00','65624245R','08049124K',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 6 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'13:20','14:00','35228740P','56207746R',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 6.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'13:20','14:00','35228740P','56207746R',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 7 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'16:00','16:40','65624245R','24173215P',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 7.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'16:00','16:40','65624245R','24173215P',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 8 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'16:00','16:40','35228740P','94187735K',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 8.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'16:00','16:40','35228740P','94187735K',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 9 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'17:20','18:00','65624245R','29189437E',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 9.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'17:20','18:00','65624245R','29189437E',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 10 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'17:20','18:00','35228740P','40995425H',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 10.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'17:20','18:00','35228740P','40995425H',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 11 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'18:40','19:20','65624245R','13457295H',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 11.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'18:40','19:20','65624245R','13457295H',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 12 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'18:40','19:20','35228740P','46517059L',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 12.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'18:40','19:20','35228740P','46517059L',null,1,TRUE);

Pruebas_Clases.insertar('Prueba 13 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'10:00','10:40','61789624D','52252397P',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 13.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'10:00','10:40','61789624D','52252397P',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 14 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'12:00','12:40','61789624D','64344800T',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 14.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'12:00','12:40','61789624D','64344800T',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 15 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'13:20','14:00','61789624D','02841581T',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 15.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'13:20','14:00','61789624D','02841581T',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 16 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'16:00','16:40','61789624D','89876288Q',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 16.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'16:00','16:40','61789624D','89876288Q',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 17 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'17:20','18:00','61789624D','75118377D',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 17.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'17:20','18:00','61789624D','75118377D',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 18 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'18:40','19:20','61789624D','19320559F',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 18.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'18:40','19:20','61789624D','19320559F',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 19 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('15/07/2018','DD/MM/YYYY'),'19:20','20:00','61789624D','52478537N',null,2,TRUE);
Pruebas_Clases.insertar('Prueba 19.1 - Inserci�n Clase', 'Simple en pista','Permiso A2',to_date('17/07/2018','DD/MM/YYYY'),'19:20','20:00','61789624D','52478537N',null,2,TRUE);

Pruebas_Clases.insertar('Prueba 20 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('15/07/2018','DD/MM/YYYY'),'19:20','20:00','65624245R','88540629J',null,1,TRUE);
Pruebas_Clases.insertar('Prueba 20.1 - Inserci�n Clase', 'Simple circulacion','Permiso B',to_date('17/07/2018','DD/MM/YYYY'),'19:20','20:00','65624245R','88540629J',null,1,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES DE LAS TABLAS DE EXAMENES PRACTICOS
**********************************************************************************************************/

Pruebas_ExamenesPracticoCirc.insertar('Prueba 1 - Inserci�n ExamenPracticoCirculacion',to_date('01/08/2018','DD/MM/YYYY'),'77850301Q','Apto',2,0,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 2 - Inserci�n ExamenPracticoCirculacion',to_date('05/08/2018','DD/MM/YYYY'),'09973707X','No Apto',0,0,1,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 3 - Inserci�n ExamenPracticoCirculacion',to_date('06/08/2018','DD/MM/YYYY'),'54720204F','No Apto',2,2,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 4 - Inserci�n ExamenPracticoCirculacion',to_date('07/08/2018','DD/MM/YYYY'),'06854766F','Apto',0,1,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 5 - Inserci�n ExamenPracticoCirculacion',to_date('08/08/2018','DD/MM/YYYY'),'08049124K','Apto',3,0,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 6 - Inserci�n ExamenPracticoCirculacion',to_date('09/08/2018','DD/MM/YYYY'),'56207746R','No Apto',0,0,1,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 7 - Inserci�n ExamenPracticoCirculacion',to_date('11/08/2018','DD/MM/YYYY'),'24173215P','No Apto',2,2,0,TRUE);
Pruebas_ExamenesPracticoCirc.insertar('Prueba 8 - Inserci�n ExamenPracticoCirculacion',to_date('12/08/2018','DD/MM/YYYY'),'94187735K','No Apto',4,2,0,TRUE);

Pruebas_ExamenesPracticoPista.insertar('Prueba 1 - Inserci�n ExamenesPracticoPista',to_date('03/08/2018','DD/MM/YYYY'),'52252397P','Apto',0,0,0,TRUE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 2 - Inserci�n ExamenesPracticoPista',to_date('04/08/2018','DD/MM/YYYY'),'64344800T','No Apto',2,0,1,TRUE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 3 - Inserci�n ExamenesPracticoPista',to_date('05/08/2018','DD/MM/YYYY'),'02841581T','No Apto',2,2,0,TRUE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 4 - Inserci�n ExamenesPracticoPista',to_date('06/08/2018','DD/MM/YYYY'),'89876288Q','Apto',4,0,0,TRUE);
Pruebas_ExamenesPracticoPista.insertar('Prueba 5 - Inserci�n ExamenesPracticoPista',to_date('07/08/2018','DD/MM/YYYY'),'75118377D','No Apto',5,0,1,TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA VEHICULOS
**********************************************************************************************************/
Pruebas_Motocicletas.inicializar;
Pruebas_Turismos.inicializar;

Pruebas_Motocicletas.insertar('Prueba 1 - Inserci�n Motocicleta', '0929 MTC','ListoParaSuUso','Piagio 1729X',125, TRUE);
Pruebas_Motocicletas.insertar('Prueba 2 - Inserci�n Motocicleta', '1579 FFI','ListoParaSuUso','Honda 333A',150, TRUE);
Pruebas_Motocicletas.insertar('Prueba 3 - Inserci�n Motocicleta', '2561 ASA','ListoParaSuUso','Suzuki 167F',150, TRUE);

Pruebas_Turismos.insertar('Prueba 1 - Inserci�n Turismo', '2819 WCT', 'ListoParaSuUso', 'Volkswagen Polo TDI', TRUE);
Pruebas_Turismos.insertar('Prueba 2 - Inserci�n Turismo', '1829 WCT', 'ListoParaSuUso', 'Renault Clio TDI', TRUE);
Pruebas_Turismos.insertar('Prueba 3 - Inserci�n Turismo', '2231 FFL', 'ListoParaSuUso', 'Mercedes STR', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ALUMNOCONDUCEVEHICULO
**********************************************************************************************************/
Pruebas_AlumnoConduceMotos.inicializar;
Pruebas_AlumnoConduceTurismos.inicializar;

Pruebas_AlumnoConduceMotos.insertar('Prueba 1 - Inserci�n AlumnoConduceMotocicleta', '52252397P', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 2 - Inserci�n AlumnoConduceMotocicleta', '64344800T', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 3 - Inserci�n AlumnoConduceMotocicleta', '02841581T', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 4 - Inserci�n AlumnoConduceMotocicleta', '89876288Q', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 5 - Inserci�n AlumnoConduceMotocicleta', '75118377D', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 6 - Inserci�n AlumnoConduceMotocicleta', '19320559F', '0929 MTC',TRUE);
Pruebas_AlumnoConduceMotos.insertar('Prueba 7 - Inserci�n AlumnoConduceMotocicleta', '52478537N', '0929 MTC',TRUE);

Pruebas_AlumnoConduceTurismos.insertar('Prueba 1 - Inserci�n AlumnoConduceTurismo', '77850301Q', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 2 - Inserci�n AlumnoConduceTurismo', '09973707X', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 3 - Inserci�n AlumnoConduceTurismo', '54720204F', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 4 - Inserci�n AlumnoConduceTurismo', '06854766F', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 5 - Inserci�n AlumnoConduceTurismo', '08049124K', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 6 - Inserci�n AlumnoConduceTurismo', '56207746R', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 7 - Inserci�n AlumnoConduceTurismo', '24173215P', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 8 - Inserci�n AlumnoConduceTurismo', '94187735K', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 9 - Inserci�n AlumnoConduceTurismo', '29189437E', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 10 - Inserci�n AlumnoConduceTurismo', '40995425H', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 11 - Inserci�n AlumnoConduceTurismo', '13457295H', '1829 WCT',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 12 - Inserci�n AlumnoConduceTurismo', '46517059L', '2231 FFL',TRUE);
Pruebas_AlumnoConduceTurismos.insertar('Prueba 13 - Inserci�n AlumnoConduceTurismo', '88540629J', '1829 WCT',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA SEGUROS
**********************************************************************************************************/
Pruebas_SegurosMotocicletas.inicializar;
Pruebas_SegurosTurismos.inicializar;

Pruebas_SegurosMotocicletas.insertar('Prueba 1 - Inserci�n SeguroMotocicleta', 'MUTUA', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 240, '0929 MTC',TRUE);
Pruebas_SegurosMotocicletas.insertar('Prueba 2 - Inserci�n SeguroMotocicleta', 'MUTUA', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 250, '1579 FFI',TRUE);
Pruebas_SegurosMotocicletas.insertar('Prueba 3 - Inserci�n SeguroMotocicleta', 'MUTUA', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 260, '2561 ASA',TRUE);

Pruebas_SegurosTurismos.insertar('Prueba 1 - Inserci�n SeguroTurismo', 'MAPFRE', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 340, '1829 WCT',TRUE);
Pruebas_SegurosTurismos.insertar('Prueba 2 - Inserci�n SeguroTurismo', 'MAPFRE', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 330, '2819 WCT',TRUE);
Pruebas_SegurosTurismos.insertar('Prueba 3 - Inserci�n SeguroTurismo', 'MAPFRE', 'TodoRiesgo',to_date('01/01/2018','DD/MM/YYYY'), 'Anual', 400, '2231 FFL',TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA ITV
**********************************************************************************************************/
Pruebas_ITVMotocicletas.inicializar;
Pruebas_ITVTurismos.inicializar;

Pruebas_ITVMotocicletas.insertar('Prueba 1 - Inserci�n ITVMotocicleta', to_date('12/12/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 90, 'Favorable', '0929 MTC', TRUE);
Pruebas_ITVMotocicletas.insertar('Prueba 2 - Inserci�n ITVMotocicleta', to_date('14/12/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 100, 'Favorable', '1579 FFI', TRUE);
Pruebas_ITVMotocicletas.insertar('Prueba 3 - Inserci�n ITVMotocicleta', to_date('16/12/2017','DD/MM/YYYY'), to_date('12/12/2021','DD/MM/YYYY'), 80, 'Favorable', '2561 ASA', TRUE);

Pruebas_ITVTurismos.insertar('Prueba 1 - Inserci�n ITVTurismos', to_date('17/12/2017','DD/MM/YYYY'), to_date('12/12/2018','DD/MM/YYYY'), 120, 'Favorable', '1829 WCT', TRUE);
Pruebas_ITVTurismos.insertar('Prueba 2 - Inserci�n ITVTurismos', to_date('20/12/2017','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 100, 'Favorable', '2819 WCT', TRUE);
Pruebas_ITVTurismos.insertar('Prueba 3 - Inserci�n ITVTurismos', to_date('24/12/2017','DD/MM/YYYY'), to_date('05/12/2022','DD/MM/YYYY'), 130, 'Favorable', '2231 FFL', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA TALLERES
**********************************************************************************************************/
Pruebas_Talleres.inicializar;

Pruebas_Talleres.insertar('Prueba 1 - Inserci�n Taller', 'Taller Paco', 'Av Reina Mercedes', '954131234', TRUE);
Pruebas_Talleres.insertar('Prueba 2 - Inserci�n Taller', 'Taller ReparaCoches', 'San Jacinto', '954001122', TRUE);
Pruebas_Talleres.insertar('Prueba 3 - Inserci�n Taller', 'Taller IISSITrafico', 'Los Remedios', '954998877', TRUE);

dbms_output.new_line;

/*********************************************************************************************************
                    PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA REPARACIONES
**********************************************************************************************************/
Pruebas_ReparacionesMotos.inicializar;
Pruebas_ReparacionesTurismos.inicializar;

Pruebas_ReparacionesMotos.insertar('Prueba 1 - Inserci�n Reparaci�nMotocicleta', 'Rueda trasera pinchazo', to_date('01/12/2017','DD/MM/YYYY'), 70, '0929 MTC', 'Taller Paco', TRUE);
Pruebas_ReparacionesMotos.insertar('Prueba 2 - Inserci�n Reparaci�nMotocicleta', 'Direccion correcion', to_date('02/12/2017','DD/MM/YYYY'), 80, '0929 MTC', 'Taller ReparaCoches', TRUE);
Pruebas_ReparacionesMotos.insertar('Prueba 3 - Inserci�n Reparaci�nMotocicleta', 'Revision previa a ITV', to_date('05/12/2017','DD/MM/YYYY'), 90, '0929 MTC', 'Taller IISSITrafico', TRUE);

Pruebas_ReparacionesTurismos.insertar('Prueba 1 - Inserci�n Reparaci�nTurismo', 'Reparacion luna trasera', to_date('04/12/2017','DD/MM/YYYY'), 50, '1829 WCT', 'Taller Paco', TRUE);
Pruebas_ReparacionesTurismos.insertar('Prueba 2 - Inserci�n Reparaci�nTurismo', 'Direccion del volante', to_date('05/12/2017','DD/MM/YYYY'), 60, '1829 WCT', 'Taller ReparaCoches', TRUE);
Pruebas_ReparacionesTurismos.insertar('Prueba 3 - Inserci�n Reparaci�nTurismo', 'Revision previa ITV', to_date('10/09/2016','DD/MM/YYYY'), 90, '1829 WCT', 'Taller IISSITrafico', TRUE);

Pruebas_ReparacionesTurismos.insertar('Prueba 4 - Inserci�n Reparaci�nTurismo', 'Reparacion intermitente', to_date('04/12/2017','DD/MM/YYYY'), 30, '2231 FFL', 'Taller Paco', TRUE);
Pruebas_ReparacionesTurismos.insertar('Prueba 5 - Inserci�n Reparaci�nTurismo', 'Parabrisas trasero', to_date('05/12/2017','DD/MM/YYYY'), 40, '2231 FFL', 'Taller ReparaCoches', TRUE);
Pruebas_ReparacionesTurismos.insertar('Prueba 6 - Inserci�n Reparaci�nTurismo', 'Revision previa ITV', to_date('10/09/2016','DD/MM/YYYY'), 90, '2231 FFL', 'Taller IISSITrafico', TRUE);

END;
/