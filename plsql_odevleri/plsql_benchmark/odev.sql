/* stajyer table
CREATE TABLE stajyer( 
    stajyer_no    number(10) ,
    stajyer_adi   varchar2(50) NOT NULL,
    stajyer_soyadi   varchar2(50) NOT NULL);
*/
--@odev.pks
--@odev.pkb

INSERT INTO hr.stajyer (stajyer_no, stajyer_adi, stajyer_soyadi) values(5, 'Tatar', 'ramazan');
DELETE FROM hr.stajyer STAJYER WHERE STAJYER.stajyer_no = 5;
UPDATE hr.stajyer STAJYER SET STAJYER.stajyer_adi = 'RAMBO' WHERE STAJYER.stajyer_no = 5;
time_before := DBMS_UTILITY.GET_TIME;
   
select * from hr.stajyer;
/

DECLARE
   time_after  NUMBER;
   time_before NUMBER;
   limit number;
BEGIN
    limit := 10000;
    FOR i in 1..limit 
    LOOP
--        DELETE FROM hr.stajyer STAJYER WHERE STAJYER.stajyer_no = i;
        INSERT INTO hr.stajyer (stajyer_no, stajyer_adi, stajyer_soyadi) values(i, 'Tatar', 'ramazan');
    END LOOP;
    say('-----------------------------');
    time_before := DBMS_UTILITY.GET_TIME;
    say(time_before);
    APEX_UTIL.PAUSE(1);
    --ROLLBACK;
    time_after := DBMS_UTILITY.GET_TIME;
    say(time_after);
    say((time_after - time_before)/100);
    say('#############################');
    say(CALCULATE_AND_CLEAR_TIME(time_before, time_after));
    say(time_before);
    say(time_after);
END;
/
dbms_output.put_line('deneme');
/

CREATE OR REPLACE FUNCTiON CALCULATE_AND_CLEAR_TIME(pion_past IN OUT NUMBER, pion_future IN OUT NUMBER)
    RETURN NUMBER
IS
    difference NUMBER := 0;
BEGIN
    difference := CALCULATE_TIME(pion_past, pion_future, 100);
    pion_past := pion_future;
    pion_future := 0;
    RETURN difference;
END CALCULATE_AND_CLEAR_TIME;
/
-- calculate time in future and past
-- return milimetric values
--------------------------------------------completed
CREATE OR REPLACE FUNCTiON CALCULATE_TIME(
    pion_past NUMBER, 
    pion_future NUMBER, 
    pin_divisor NUMBER default 1
    )
    RETURN NUMBER
IS
BEGIN
    RETURN (pion_future - pion_past)/pin_divisor;
END CALCULATE_TIME;
/
----------------------------

SELECT * from user_errors where name = 'CALCULATE_TIME';



CREATE OR REPLACE procedure say(thing IN varchar2)
AS
BEGIN
    dbms_output.put_line(thing);
END;
/
BEGIN
--    SAY('deneme');
END;