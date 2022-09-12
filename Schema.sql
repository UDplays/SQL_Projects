#Creating schema gbc_superstore and then performing Database Normalization

CREATE TABLE Type_Customer (
  ID_TypeCustomer Int NOT NULL ,
  TypeCustomer_Name nvarchar(20) NOT NULL,
  primary key(ID_TypeCustomer)
);

CREATE TABLE Customer (
  ID_Customer nvarchar(50) NOT NULL ,
  ID_TypeCustomer int NOT NULL ,
  Customer_Name nvarchar(100) NOT NULL,
  primary key(ID_Customer),
  foreign key(ID_TypeCustomer) REFERENCES type_customer(ID_TypeCustomer)
);


CREATE TABLE Country (
  ID_Country int NOT NULL ,
  Country_Name nvarchar(20),
   primary key(ID_Country)
);

CREATE TABLE Region (
  ID_Region int NOT NULL ,
  Region_Name nvarchar(20),
  ID_Country int not null,
   primary key(ID_Region),
   foreign key(ID_Country) REFERENCES Country(ID_Country)
);
CREATE TABLE State (
  ID_State int NOT NULL ,
  State_Name nvarchar(20),
  ID_Region int not null,
  primary key(ID_State),
   foreign key(ID_Region) REFERENCES Region(ID_Region)
);
CREATE TABLE City (
  ID_City int NOT NULL ,
  City_Name nvarchar(20) NOT NULL,
  ID_State int not null,
  primary key(ID_City),
   foreign key(ID_State) REFERENCES State(ID_State)
);	

CREATE TABLE Shipping (
  ID_Shipping int NOT NULL ,
  Ship_Mode nvarchar(20) NOT NULL,
  primary key(ID_Shipping)
);



CREATE TABLE Orders (
  ID_Order nvarchar(50) NOT NULL ,
  ID_City int NOT NULL,
  ID_Shipping int NOT NULL,
  Order_Date Date Not NULL,
  Ship_Date Date NOT NULL,
  Ship_Name nvarchar(50) NOT NULL,
  Ship_Postalcode int  NULL,
  ID_Customer nvarchar(50) not null,
  primary key(ID_Order),
  FOREIGN KEY (ID_Shipping) REFERENCES Shipping(ID_Shipping),
  FOREIGN KEY (ID_City) REFERENCES City(ID_City)
);
CREATE TABLE Category   (
  ID_Category int NOT NULL ,
  Name_Category nvarchar(50) NOT NULL,
  primary key(ID_Category)
  
);

CREATE TABLE Subcategory   (
  ID_Subcategory Int NOT NULL ,
  Name_Subcategory nvarchar(100) NOT NULL,
  ID_Category int NULL,
  primary key(ID_Subcategory),
  FOREIGN KEY (ID_Category) REFERENCES Category(ID_Category) 
);


CREATE TABLE Product (
  ID_Product nvarchar(50) NOT NULL,
  Name_Product nvarchar(500) NOT NULL,
  ID_Category int not null,
  ID_Subcategory int NOT NULL,
  Unit_Price float NOT NULL,
  primary key(ID_Product),
  FOREIGN KEY (ID_Category) REFERENCES category(ID_Category) ,
  FOREIGN KEY (ID_Subcategory) REFERENCES subcategory(ID_Subcategory) 
);


CREATE TABLE Order_Details (
  ID_OrderDetails int not null,
  ID_Order nvarchar(50) NOT NULL,
  ID_Product nvarchar(50) NOT NULL,
  Quantity int,
  Discount float,
  Unit_Price float,
  profit float,
  primary key(ID_OrderDetails),
  FOREIGN KEY (ID_Order) REFERENCES Orders(ID_Order) ,
  FOREIGN KEY (ID_Product) REFERENCES Product(ID_Product) 
);

CREATE TABLE `Returns`(
  ID_Return int NOT NULL ,
  ID_Order nvarchar(50) NOT NULL,
  primary key(ID_Return),
  FOREIGN KEY (ID_Order) REFERENCES Orders(ID_Order)
);



create table product_history(
ID_Product nvarchar(50) not null,
Product_Date date not null,
unit_price float not null,
Product_comment nvarchar(1000),
primary key(ID_Product,Product_Date),
FOREIGN KEY (ID_Product) REFERENCES Product(ID_Product)
);

 SET GLOBAL FOREIGN_KEY_CHECKS=0; 