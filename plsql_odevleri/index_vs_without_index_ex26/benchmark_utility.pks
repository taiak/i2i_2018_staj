/*
	author    Taha Yasir Kıroğlu
	date      16.07.2018
	version   1.0.0
	explain   benchmark package definition
    file_name crud_benchmark_utilities.pks
*/

CREATE OR REPLACE PACKAGE hr.BENCHMARK_UTILITY AS
    PROCEDURE INSERT_N_VALUE(pin_row_count IN NUMBER);
    PROCEDURE SELECT_VALUE(pin_row_count IN NUMBER);
    PROCEDURE DELETE_ALL_VALUE_BIGGER_THEN(pin_row_count IN NUMBER);
END BENCHMARK_UTILITY;