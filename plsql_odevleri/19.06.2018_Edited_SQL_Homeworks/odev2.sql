/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         24.06.2018
    DESCRIPTION : create user, table and make a search for homework2
*/
-- create user named yasir
@create_user.sql;

-- add user to priviledges
@add_priviledges.sql;
 
-- create table for user
@create_tables.sql;
 
-- insert example values
@insert_values.sql;

-- connect to user fro listing values
@connect_to_user.sql

-- list staj tables values
select * from yasir.staj;