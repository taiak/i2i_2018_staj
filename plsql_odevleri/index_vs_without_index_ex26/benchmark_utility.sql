/*
 *    author    Taha Yasir Kiroglu
 *    date      16.07.2018
 *    version   1.0.0
 *    file_name benchmark_utilities.sql
 *    compare index factor in select and index statement
 *    explain:
 *    without indexing inserting faster than index
 *    but in search statement indexing more efficient
 */

@benchmark_utility.pkb;
@benchmark_utility.pks;

SET ECHO ON
SET SERVEROUTPUT ON

-- drop sequence and index if they exists
DROP SEQUENCE stajyer_insert_sequence;
DROP SEQUENCE stajyer_select_sequence;
DROP INDEX ix_stajyer_no;

-- create sequences
CREATE SEQUENCE stajyer_insert_sequence
INCREMENT BY 1
START WITH 1
CACHE 100;

CREATE SEQUENCE hr.stajyer_select_sequence
INCREMENT BY 1
START WITH 1
CACHE 100;
COMMIT;

-- clean values
EXECUTE HR.BENCHMARK_UTILITY.DELETE_ALL_VALUE_BIGGER_THEN(0);

-- insert and search with index
EXECUTE DBMS_OUTPUT.PUT_LINE('---------- WITH INDEX ----------');
CREATE INDEX ix_stajyer_no ON HR.STAJYER(STAJYER_NO);
EXECUTE HR.BENCHMARK_UTILITY.INSERT_N_VALUE(1000000);
EXECUTE HR.BENCHMARK_UTILITY.SELECT_VALUE(1000000);
EXECUTE HR.BENCHMARK_UTILITY.DELETE_ALL_VALUE_BIGGER_THEN(0);
COMMIT;

-- insert and search without index
EXECUTE DBMS_OUTPUT.PUT_LINE('---------- WITHOUT INDEX ----------');
DROP INDEX ix_stajyer_no;
EXECUTE HR.BENCHMARK_UTILITY.INSERT_N_VALUE(1000000);
-- select from 2 because of sequence memory
EXECUTE HR.BENCHMARK_UTILITY.SELECT_VALUE(2000000);
EXECUTE HR.BENCHMARK_UTILITY.DELETE_ALL_VALUE_BIGGER_THEN(0);