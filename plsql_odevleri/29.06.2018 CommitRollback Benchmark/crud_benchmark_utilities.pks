/*
	author    Taha Yasir Kıroğlu
	date      15.07.2018
	version   1.2.0
	explain   benchmark package definition
    file_name crud_benchmark_utilities.pks
*/

CREATE OR REPLACE PACKAGE HR.CRUD_BENCHMARK_UTILITIES
AS
    -- CRUD operation for N value
    PROCEDURE INSERT_N_VALUES(pin_number_count NUMBER);
    PROCEDURE DELETE_FIRST_N_VALUES(pin_number_count NUMBER);
    PROCEDURE UPDATE_FIRST_N_VALUES(pin_number_count NUMBER);
    -- compute time difference between commit and roolback
    PROCEDURE DELETE_N_VALUES_BENCHMARK(pin_number_count NUMBER);
    PROCEDURE UPDATE_N_VALUES_BENCHMARK(pin_number_count NUMBER);
    PROCEDURE INSERT_N_VALUES_BENCHMARK(pin_number_count NUMBER);
    -- insert, update and delete items with sequencially
    PROCEDURE CRUD_SEQUANCIAL_BENCHMARK(pin_number_count NUMBER);
END CRUD_BENCHMARK_UTILITIES;