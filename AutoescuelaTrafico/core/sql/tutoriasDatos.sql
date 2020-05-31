DECLARE 
existe INTEGER;

BEGIN
    select count(*) INTO existe
    from all_objects
    where object_type in ('TABLE','VIEW')
    and object_name = 'AUX_T';
    
    IF (existe!=0) THEN
         EXECUTE IMMEDIATE('DROP TABLE AUX_T');
    END IF;
    
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