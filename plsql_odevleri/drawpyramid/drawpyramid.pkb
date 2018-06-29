/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         26.06.2018
    DESCRIPTION   package of draw pyramid
    FILE NAME     drawpyramids.pkb
    VERSION:      1.1.0
    
*/

CREATE OR REPLACE PACKAGE BODY HR.palette AS
    -- put giving character n time
    PROCEDURE ntime_put(
        pin_repeat_count IN number, 
        ps_character IN VARCHAR
    ) IS
    BEGIN
        FOR number_ IN 1..pin_repeat_count LOOP
            dbms_output.put(ps_character);
        END LOOP;
    END ntime_put;
    
    -- draw a pyramid with pin_size height
	PROCEDURE DrawPyramid(
        pin_size IN number
    )
	IS
	    vin_star_in_row    number := 1; -- star count in a row
	    vin_half_size      number := (pin_size + 1) / 2;
	    vin_space_in_row   number := vin_half_size;
        vs_space_character varchar(1) := ' ';
        vs_star_character  varchar(1) := '*';
	BEGIN
	    dbms_output.put_line('');
	    FOR num_ IN 1..pin_size LOOP
            vin_space_in_row := vin_space_in_row - 1;
	        
            -- put space pyramids character
            ntime_put(abs(vin_space_in_row), vs_space_character);
            
            -- calculate star count
	        vin_star_in_row := 2 * abs(vin_half_size - abs(vin_space_in_row)) - 1;
            
            -- put star pyramids character
            ntime_put(vin_star_in_row, vs_star_character);
            
            ntime_put(abs(vin_space_in_row), vs_space_character);
	        dbms_output.put_line('');
	    END LOOP;
	END DrawPyramid;
END palette;
/