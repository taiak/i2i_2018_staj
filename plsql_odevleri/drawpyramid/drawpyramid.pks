/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         26.06.2018
    DESCRIPTION   package definition of draw pyramid
    FILE NAME     drawpyramids.pks
    VERSION:      1.1.0
*/
CREATE OR REPLACE PACKAGE HR.palette AS
    procedure DrawPyramid(pin_size IN number);
END palette;
/