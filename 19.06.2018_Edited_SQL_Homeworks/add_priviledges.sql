/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         24.06.2018
    DESCRIPTION : Add priviledges to 'yasir' user
*/

GRANT CONNECT TO yasir;              -- bağlantı kurabilmek için
GRANT CREATE TABLE TO yasir;         -- tablo oluşturabilmesi için
GRANT INSERT ANY TABLE TO yasir;     -- tabloya veri girebilmesi için
-- TODO: verilen belleği sonlu bir miktara çek
GRANT UNLIMITED TABLESPACE TO yasir; -- tabloda veri alanı ver
