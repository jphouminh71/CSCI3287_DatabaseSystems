DROP TABLE IF EXISTS  nwCategories ; 
CREATE TABLE  nwCategories  
   (
   CategoryID       int   unique  NOT NULL ,
   CategoryName       varchar(20)   NOT NULL ,
   Description        varchar(100)   NOT NULL ,
   PRIMARY KEY (CategoryID) 
);

INSERT INTO nwCategories VALUES (1,'Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT INTO nwCategories VALUES (2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO nwCategories VALUES (3,'Confections','Desserts, candies, and sweet breads');
INSERT INTO nwCategories VALUES (4,'Dairy Products','Cheeses');
INSERT INTO nwCategories VALUES (5,'Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT INTO nwCategories VALUES (6,'Meat/Poultry','Prepared meats');
INSERT INTO nwCategories VALUES (7,'Produce','Dried fruit and bean curd');
INSERT INTO nwCategories VALUES (8,'Seafood','Seaweed and fish');
