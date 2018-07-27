/*
 *    author    Taha Yasir Kıroğlu
 *    date      15.07.2018
 *    version   1.2.0
 *    file_name crud_benchmark_utilities.sql
 *    explain:  make sequencial benchmark
 */
 @COMMIT_ROLLBACK_BENCHMARK.pks
 @COMMIT_ROLLBACK_BENCHMARK.pkb

BEGIN
    -- delete all value for benchmark. if we don't del items here, we must declare it in procedures
    DELETE FROM STAJYER WHERE 0 < STAJYER_NO;
    COMMIT;
    HR.CRUD_BENCHMARK_UTILITIES.CRUD_SEQUANCIAL_BENCHMARK(100);
    HR.CRUD_BENCHMARK_UTILITIES.CRUD_SEQUANCIAL_BENCHMARK(1000);
    HR.CRUD_BENCHMARK_UTILITIES.CRUD_SEQUANCIAL_BENCHMARK(10000);
    HR.CRUD_BENCHMARK_UTILITIES.CRUD_SEQUANCIAL_BENCHMARK(100000);
    -- more than 8 hour
    -- HR.CRUD_BENCHMARK_UTILITIES.CRUD_SEQUANCIAL_BENCHMARK(1000000);
END;