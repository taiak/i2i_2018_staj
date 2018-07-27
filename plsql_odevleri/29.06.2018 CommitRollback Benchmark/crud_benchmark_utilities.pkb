/*
 *    author    Taha Yasir Kıroğlu
 *    date      15.07.2018
 *    version   1.2.0
 *    file_name crud_benchmark_utilities.pkb
 *    explain   
 */

CREATE OR REPLACE PACKAGE BODY HR.CRUD_BENCHMARK_UTILITIES
AS
    PROCEDURE COMMIT_TIME(pis_crud_type VARCHAR2)
    IS
        vn_start_time BINARY_INTEGER;
        vn_finish_time BINARY_INTEGER;
    BEGIN
        vn_start_time := dbms_utility.get_time();
        COMMIT;
        vn_finish_time := dbms_utility.get_time();
        dbms_output.put('COMMIT:   '||pis_crud_type||' TIME : ');
        dbms_output.put((vn_finish_time - vn_start_time)/100);
        dbms_output.put_line(' second');
    END;
    
    PROCEDURE ROLLBACK_TIME(pis_crud_type VARCHAR2)
    IS
        vn_start_time BINARY_INTEGER;
        vn_finish_time BINARY_INTEGER;
    BEGIN
        vn_start_time := dbms_utility.get_time();
        ROLLBACK;
        vn_finish_time := dbms_utility.get_time();
        dbms_output.put('ROLLBACK: '||pis_crud_type||' TIME : ');
        dbms_output.put((vn_finish_time - vn_start_time)/100);
        dbms_output.put_line(' second');
    END;
    
    PROCEDURE INSERT_N_VALUES(pin_number_count NUMBER)
    IS
    BEGIN
        for n in 1..pin_number_count LOOP
            INSERT INTO stajyer(STAJYER_NO, STAJYER_ADI, STAJYER_SOYADI) VALUES (n, 'INSERTED', 'USER');
        END LOOP;
    END INSERT_N_VALUES;

    PROCEDURE DELETE_FIRST_N_VALUES(pin_number_count NUMBER)
    IS
    BEGIN
        DELETE FROM STAJYER WHERE 0 < STAJYER_NO AND STAJYER_NO < pin_number_count;
    END DELETE_FIRST_N_VALUES;

    PROCEDURE UPDATE_FIRST_N_VALUES(pin_number_count NUMBER)
    IS
    BEGIN
        FOR n IN 1..pin_number_count LOOP
            UPDATE STAJYER SET STAJYER_ADI = 'UPDATED', STAJYER_SOYADI = 'UPDATED' WHERE STAJYER_NO = n;
        END LOOP;
    END UPDATE_FIRST_N_VALUES;
    
    PROCEDURE INSERT_N_VALUES_BENCHMARK(pin_number_count NUMBER)
    IS
    BEGIN
        -- roolback
        HR.CRUD_BENCHMARK_UTILITIES.INSERT_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.ROLLBACK_TIME(TO_CHAR(pin_number_count)||' value INSERT');
        -- commit
        HR.CRUD_BENCHMARK_UTILITIES.INSERT_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.COMMIT_TIME((pin_number_count)||' value INSERT');
    END INSERT_N_VALUES_BENCHMARK;
    
    PROCEDURE UPDATE_N_VALUES_BENCHMARK(pin_number_count NUMBER)
    IS
    BEGIN
        -- rollback
        HR.CRUD_BENCHMARK_UTILITIES.UPDATE_FIRST_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.ROLLBACK_TIME(TO_CHAR(pin_number_count)||' value UPDATE');
        -- commit
        HR.CRUD_BENCHMARK_UTILITIES.UPDATE_FIRST_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.COMMIT_TIME((pin_number_count)||' value UPDATE');
    END UPDATE_N_VALUES_BENCHMARK;

    PROCEDURE DELETE_N_VALUES_BENCHMARK(pin_number_count NUMBER)
    IS
    BEGIN
        -- rollback
        HR.CRUD_BENCHMARK_UTILITIES.DELETE_FIRST_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.ROLLBACK_TIME(TO_CHAR(pin_number_count)||' value DELETE');
        -- commit
        HR.CRUD_BENCHMARK_UTILITIES.DELETE_FIRST_N_VALUES(pin_number_count);
        HR.CRUD_BENCHMARK_UTILITIES.COMMIT_TIME((pin_number_count)||' value DELETE');
    END DELETE_N_VALUES_BENCHMARK;
        
    PROCEDURE CRUD_SEQUANCIAL_BENCHMARK(pin_number_count NUMBER)
    IS
        vn_start_time  BINARY_INTEGER;
        vn_finish_time BINARY_INTEGER;
    BEGIN
        vn_start_time := dbms_utility.get_time();
        -- calculate sequential benchmark
        INSERT_N_VALUES_BENCHMARK(pin_number_count);
        UPDATE_N_VALUES_BENCHMARK(pin_number_count);
        DELETE_N_VALUES_BENCHMARK(pin_number_count);
        
        vn_finish_time := dbms_utility.get_time();
        dbms_output.put('SEQUENCE TIME : ');
        dbms_output.put((vn_finish_time - vn_start_time)/100);
        dbms_output.put_line(' second');
    END CRUD_SEQUANCIAL_BENCHMARK;

END CRUD_BENCHMARK_UTILITIES;