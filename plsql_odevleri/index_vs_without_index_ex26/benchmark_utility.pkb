/*
 *    author    Taha Yasir Kıroğlu
 *    date      16.07.2018
 *    version   1.0.0
 *    file_name staj_utilities.pkb
 */

 CREATE OR REPLACE PACKAGE BODY hr.BENCHMARK_UTILITY AS
   
 	FUNCTION INSERT_N_VALUE_TIMER(pin_row_count IN NUMBER)
 		RETURN NUMBER
 	IS
 		vn_start_time NUMBER;
        vn_end_time NUMBER;
 	BEGIN
	 	vn_start_time := DBMS_UTILITY.GET_TIME();

 		FOR n IN 1..pin_row_count LOOP
 			INSERT INTO stajyer(STAJYER_NO, STAJYER_ADI, STAJYER_SOYADI) 
              VALUES (stajyer_insert_sequence.nextval, 'EXAMPLE USER', 'INSERTED');
        END LOOP;

        vn_end_time := DBMS_UTILITY.GET_TIME();

        RETURN((vn_end_time - vn_start_time) / 100);
 	END INSERT_N_VALUE_TIMER;

    -- delete
    FUNCTION DELETE_ALL_BIGGER_THEN_TIMER(pin_row_count IN NUMBER)
 		RETURN NUMBER
 	IS
 		vn_start_time NUMBER;
        vn_end_time NUMBER;
 	BEGIN
	 	vn_start_time := DBMS_UTILITY.GET_TIME();

        DELETE FROM STAJYER WHERE STAJYER_NO > pin_row_count;
        vn_end_time := DBMS_UTILITY.GET_TIME();

        RETURN((vn_end_time - vn_start_time) / 100);
 	END DELETE_ALL_BIGGER_THEN_TIMER;

    -- select
    FUNCTION SELECT_VALUE_TIMER(pin_row_count IN NUMBER)
 		RETURN NUMBER
 	IS
 		vn_start_time NUMBER;
        vn_end_time NUMBER;
        vn_stajyer_no HR.STAJYER.STAJYER_NO%TYPE;
        vn_expected_value HR.STAJYER.STAJYER_NO%TYPE;
 	BEGIN
	 	vn_start_time := DBMS_UTILITY.GET_TIME();
        vn_expected_value := (pin_row_count);
        
        SELECT STAJYER_NO INTO vn_stajyer_no 
          FROM HR.STAJYER 
        WHERE STAJYER_NO = vn_expected_value;

        vn_end_time := DBMS_UTILITY.GET_TIME();

        RETURN((vn_end_time - vn_start_time) / 100);
 	END SELECT_VALUE_TIMER;
    
    -- insert n value
    PROCEDURE INSERT_N_VALUE(pin_row_count IN NUMBER)
    IS
        vn_insert_time NUMBER;
    BEGIN
    	vn_insert_time := INSERT_N_VALUE_TIMER(pin_row_count);
        dbms_output.put_line('INSERT TIME : '|| TO_CHAR(vn_insert_time) || ' second');
    END INSERT_N_VALUE;

    -- select n value
    PROCEDURE SELECT_VALUE(pin_row_count IN NUMBER)
    IS
        vn_select_time NUMBER;
    BEGIN
    	vn_select_time := SELECT_VALUE_TIMER(pin_row_count);
        dbms_output.put_line('SELECT TIME : '|| TO_CHAR(vn_select_time) || ' second');
    END SELECT_VALUE;
    
    -- print delete time to screen
    PROCEDURE DELETE_ALL_VALUE_BIGGER_THEN(pin_row_count IN NUMBER)
    IS
        vn_delete_time NUMBER;
    BEGIN
    	vn_delete_time := DELETE_ALL_BIGGER_THEN_TIMER(pin_row_count);
        dbms_output.put_line('DELETE TIME : '|| TO_CHAR(vn_delete_time) || ' second');
    END DELETE_ALL_VALUE_BIGGER_THEN;
    
END BENCHMARK_UTILITY;