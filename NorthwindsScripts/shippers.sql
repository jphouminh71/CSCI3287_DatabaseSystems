
DROP TABLE IF EXISTS    nwShippers   ;
CREATE TABLE   nwShippers   
   (
   ShipperID   int          NOT NULL   auto_increment,
   CompanyName varchar(40)  NOT NULL ,
   Phone       varchar(24)  NULL ,
   
   PRIMARY KEY (ShipperID)
   );


INSERT INTO  nwShippers  VALUES (1, 'Speedy Express', '(503) 555-9831');
INSERT INTO  nwShippers  VALUES (2, 'United Package', '(503) 555-3199');
INSERT INTO  nwShippers  VALUES (3, 'Federal Shipping', '(503) 555-9931');

