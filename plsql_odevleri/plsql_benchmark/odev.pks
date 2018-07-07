CREATE OR REPLACE procedure insert_much(n number)
AS
BEGIN
    dbms_output.put_line('deneme');
END;

/
CREATE OR REPLACE PROCEDURE INSERTER(pin_number_count number)
AS
BEGIN
    for n in 1..number
    LOOP
        INSERT INTO stajyer VALUES STAJYER_NO = n, STAJYER_ADI = 'INSERTED', STAJYER_SOYADI = 'USER';
        dbms_output.put_line('deneme' || to_char(n) );
    END LOOP;
END INSERTER;
/