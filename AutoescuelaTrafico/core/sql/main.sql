SET SERVEROUTPUT ON;

--CREACION DE USUARIO
DECLARE 
existe INTEGER;
BEGIN
SELECT COUNT(*) INTO existe FROM all_users WHERE UPPER(username) = 'AUTOESCUELATRAFICO';
    IF (existe=0) THEN
        EXECUTE IMMEDIATE ('CREATE USER AutoEscuelaTrafico IDENTIFIED BY IISSI');
        EXECUTE IMMEDIATE ('GRANT CONNECT,RESOURCE TO AutoEscuelaTrafico');
    END IF;
END;
/
--Conexion a ese usuario
CONNECT AutoEscuelaTrafico/IISSI;

@"BorradoTablasySecVdef.sql";                --script de borrado de tablas y secuencias
@"CreacionTablasVdef.sql";                   --script de creacion de tablas
@"RestriccionesTablasVdef.sql";              --script de restricciones de tablas
@"SecuenciasyTriggersSecVdef.sql"            --script de secuencias y triggers asociados
@"TriggersRNVdef.sql";                   --script de triggers no asociados a sec
@"Procedimientos_y_FuncionesVdef.sql";   --script procedimientos y funciones
@"PAQUETESVdef.sql";                     --script de paquetes

--CONNECT AutoEscuelaTrafico/IISSI;
@"PruebasPaquetesVdef.sql";       --pruebas de paquetes
--@"PruebasProcFuncionesVdef.sql";      --pruebas procedimientos

-- Cierre automático de la conexion--

