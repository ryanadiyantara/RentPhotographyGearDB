/*
--------------------------------------------------------------------
PROJECT 3 RDBMS GROUP 10
--------------------------------------------------------------------
Group Member :	Rachel Christine Frydael
				Rahadyan Antawirja
				Muchammad Ryan Adiyantara 
Class		 :	1CC6
--------------------------------------------------------------------
				QUERY CREATE OBJECT
--------------------------------------------------------------------
*/

-- create databases
CREATE DATABASE Rent_Photograph_Gear_Group_10
BACKUP DATABASE Rent_Photograph_Gear_Group_10 TO DISK = 'D:\PROJECT 3\Backup DB Project 3 Group 10.bak';
USE Rent_Photograph_Gear_Group_10

-- create schemas
CREATE SCHEMA Items;
GO
CREATE SCHEMA Sales;
GO

/*-------------------TABLES, TRIGGERS, INSERT DATA.-----------------*/
/*==================================================================*/

/*Items.Categories*/
-- create tables
	CREATE TABLE Items.Categories (
	category_id VARCHAR(3) CONSTRAINT PK_category_id PRIMARY KEY,
	category_name VARCHAR(255) not null
);
-- insert data
	INSERT INTO Items.Categories VALUES ('C00','not an item')
	INSERT INTO Items.Categories VALUES ('C01','CAMERA')
	INSERT INTO Items.Categories VALUES ('C02','LENSE')
	INSERT INTO Items.Categories VALUES ('C03','ACTION CAMERA')
	INSERT INTO Items.Categories VALUES ('C04','TRIPOD')
	INSERT INTO Items.Categories VALUES ('C05','STABILIZER')
	INSERT INTO Items.Categories VALUES ('C06','SD CARD')
-- create triggers
	CREATE TRIGGER Items.Categories_Trigger ON Items.Categories
	INSTEAD OF INSERT AS
	BEGIN
		PRINT 'Do not enter data into this table'
	END;
/*==================================================================*/

/*Items.Brands*/
--create tables
	CREATE TABLE Items.Brands (
	brand_id VARCHAR(3) CONSTRAINT PK_brand_id PRIMARY KEY,
	brand_name VARCHAR(255) not null
);
--insert data
	INSERT INTO Items.Brands VALUES ('B00','not an item')
	INSERT INTO Items.Brands VALUES ('B01','CANON')
	INSERT INTO Items.Brands VALUES ('B02','NIKON')
	INSERT INTO Items.Brands VALUES ('B03','GO PRO')
	INSERT INTO Items.Brands VALUES ('B04','MANFROTTO')
	INSERT INTO Items.Brands VALUES ('B05','DJI')
	INSERT INTO Items.Brands VALUES ('B06','SANDISK')
--create triggers
	CREATE TRIGGER Items.Brands_Trigger ON Items.Brands
	INSTEAD OF INSERT AS
	BEGIN
		PRINT 'Do not enter data into this table'
	END;
/*==================================================================*/

/*Items.Products*/
--create tables
CREATE TABLE Items.Products (
	product_id VARCHAR(4) CONSTRAINT PK_product_id PRIMARY KEY,
	product_name VARCHAR(50) not null,
	category_id VARCHAR(3) CONSTRAINT FK_category_id not null FOREIGN KEY (category_id) REFERENCES Items.Categories(category_id),
	brand_id VARCHAR(3) CONSTRAINT FK_brand_id not null FOREIGN KEY (brand_id) REFERENCES Items.Brands(brand_id),
	daily_price MONEY not null,
	stock INT CONSTRAINT checkstock CHECK(stock>=0) not null,
);
--insert data
	INSERT INTO Items.Products VALUES ('P001','1100D (Body Only)','C01','B01','100000','3')
	INSERT INTO Items.Products VALUES ('P002','1200D (Body Only)','C01','B01','150000','3')
	INSERT INTO Items.Products VALUES ('P003','700D (Body Only)','C01','B01','190000','3')
	INSERT INTO Items.Products VALUES ('P004','60D (Body Only)','C01','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P005','70D (Body Only)','C01','B01','280000','3')
	INSERT INTO Items.Products VALUES ('P006','80D (Body Only)','C01','B01','350000','3')
	INSERT INTO Items.Products VALUES ('P007','7D (Body Only)','C01','B01','250000','3')
	INSERT INTO Items.Products VALUES ('P008','7D Mark II (Body Only)','C01','B01','375000','3')
	INSERT INTO Items.Products VALUES ('P009','6D (Body Only)','C01','B01','300000','3')
	INSERT INTO Items.Products VALUES ('P010','6D Mark II (Body Only)','C01','B01','400000','3')
	INSERT INTO Items.Products VALUES ('P011','5D MK II (Body Only)','C01','B01','275000','3')
	INSERT INTO Items.Products VALUES ('P012','5D MK III (Body Only)','C01','B01','450000','3')
	INSERT INTO Items.Products VALUES ('P013','5D MK IV (Body Only)','C01','B01','600000','3')
	INSERT INTO Items.Products VALUES ('P014','D90 (Body Only)','C01','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P015','D5100 (Body Only)','C01','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P016','D7000 (Body Only)','C01','B02','250000','3')
	INSERT INTO Items.Products VALUES ('P017','D7100 (Body Only)','C01','B02','300000','3')
	INSERT INTO Items.Products VALUES ('P018','D7200 ( Body Only)','C01','B02','350000','3')
	INSERT INTO Items.Products VALUES ('P019','D7500 (Body Only)','C01','B02','400000','3')
	INSERT INTO Items.Products VALUES ('P020','D600 (Body Only)','C01','B02','450000','3')
	INSERT INTO Items.Products VALUES ('P021','D800 (Body Only)','C01','B02','500000','3')
	INSERT INTO Items.Products VALUES ('P022','D850 (Body Only)','C01','B02','600000','3')
	INSERT INTO Items.Products VALUES ('P023','Canon EF 8-15mm f/4L USM  fisheye','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P024','Canon EF 15mm f/2.8 Fisheye','C02','B01','125000','3')
	INSERT INTO Items.Products VALUES ('P025','Canon TS-E 17mm f/4 L Tilt-Shift','C02','B01','250000','3')
	INSERT INTO Items.Products VALUES ('P026','Canon EF 24mm f2.8','C02','B01','50000','3')
	INSERT INTO Items.Products VALUES ('P027','Canon EF 24mm f/1.4 L II USM','C02','B01','250000','3')
	INSERT INTO Items.Products VALUES ('P028','Canon EF 28mm f/2.8 IS USM','C02','B01','100000','3')
	INSERT INTO Items.Products VALUES ('P029','Canon EF 35mm f/1.4 L USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P030','Canon EF 35mm f2 IS USM','C02','B01','100000','3')
	INSERT INTO Items.Products VALUES ('P031','Canon EF 40mm f/2.8 STM','C02','B01','60000','3')
	INSERT INTO Items.Products VALUES ('P032','Canon EF 50mm f/1.2 L USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P033','Canon EF 50mm f/1.4 USM','C02','B01','75000','3')
	INSERT INTO Items.Products VALUES ('P034','Canon EF 50mm f/1.8 II','C02','B01','25000','3')
	INSERT INTO Items.Products VALUES ('P035','Canon EF 50mm f/1.8 STM','C02','B01','50000','3')
	INSERT INTO Items.Products VALUES ('P036','Canon EF 85mm f/1.2 L II USM','C02','B01','375000','3')
	INSERT INTO Items.Products VALUES ('P037','Canon EF 85mm f/1.8 USM','C02','B01','75000','3')
	INSERT INTO Items.Products VALUES ('P038','Canon EF 100mm f/2.8 Macro USM','C02','B01','120000','3')
	INSERT INTO Items.Products VALUES ('P039','Canon EF 100mm  f/2.8 L IS USM Macro','C02','B01','175000','3')
	INSERT INTO Items.Products VALUES ('P040','Canon EF 135mm f/2 L USM','C02','B01','175000','3')
	INSERT INTO Items.Products VALUES ('P041','Canon EF-S 10-18mm f/4.5-5.6 IS STM','C02','B01','60000','3')
	INSERT INTO Items.Products VALUES ('P042','Canon EF-S 10-22mm f/3.5-4.5 USM','C02','B01','125000','3')
	INSERT INTO Items.Products VALUES ('P043','Canon EF 16-35mm f/2.8 L USM mark II','C02','B01','225000','3')
	INSERT INTO Items.Products VALUES ('P044','Canon EF 16-35mm f/4 L IS USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P045','Canon EF 17-40mm f/4 L USM','C02','B01','150000','3')
	INSERT INTO Items.Products VALUES ('P046','Canon EF-S 17-55mm f/2.8 IS USM','C02','B01','180000','3')
	INSERT INTO Items.Products VALUES ('P047','Canon EF-S 18-55mm f/3.5-5.6 IS','C02','B01','40000','3')
	INSERT INTO Items.Products VALUES ('P048','Canon EF-S 18-135mm f/3.5-5.6 IS','C02','B01','100000','3')
	INSERT INTO Items.Products VALUES ('P049','Canon EF-S 18-200mm f/3.5-5.6 IS','C02','B01','150000','3')
	INSERT INTO Items.Products VALUES ('P050','Canon EF 24-70mm f/2.8 L II USM','C02','B01','300000','3')
	INSERT INTO Items.Products VALUES ('P051','Canon EF 24-70mm f/2.8 L USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P052','Canon EF 24-70mm f/4 L IS USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P053','Canon EF 24-105mm f/4 L IS USM','C02','B01','150000','3')
	INSERT INTO Items.Products VALUES ('P054','Canon EF 24-105mm f/4 L IS II USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P055','Canon EF 70-200mm f/4 Non IS USM','C02','B01','125000','3')
	INSERT INTO Items.Products VALUES ('P056','Canon EF 70-200mm f/4 L IS USM','C02','B01','200000','3')
	INSERT INTO Items.Products VALUES ('P057','Canon EF 70-200mm f/2.8 L Non IS USM','C02','B01','225000','3')
	INSERT INTO Items.Products VALUES ('P058','Canon EF 70-200mm f/2.8 L IS USM','C02','B01','275000','3')
	INSERT INTO Items.Products VALUES ('P059','Canon EF 70-200mm f/2.8 L IS II USM','C02','B01','350000','3')
	INSERT INTO Items.Products VALUES ('P060','Canon EF 100-400mm f/4.5-5.6','C02','B01','275000','3')
	INSERT INTO Items.Products VALUES ('P061','Nikon AF 10.5mm f/2.8 G ED DX Fisheye','C02','B02','125000','3')
	INSERT INTO Items.Products VALUES ('P062','Nikon 16mm f/2.8D Fisheye','C02','B02','150000','3')
	INSERT INTO Items.Products VALUES ('P063','Nikon 24mm f/2.8D','C02','B02','120000','3')
	INSERT INTO Items.Products VALUES ('P064','Nikon AF-S 35mm f/1.8G DX','C02','B02','75000','3')
	INSERT INTO Items.Products VALUES ('P065','Nikon AF 50mm f/1.8D','C02','B02','25000','3')
	INSERT INTO Items.Products VALUES ('P066','Nikon AF-S 50mm f/1.8G','C02','B02','60000','3')
	INSERT INTO Items.Products VALUES ('P067','Nikon AF 50mm f/1.4D','C02','B02','75000','3')
	INSERT INTO Items.Products VALUES ('P068','Nikon AF-S 50mm f/1.4G','C02','B02','150000','3')
	INSERT INTO Items.Products VALUES ('P069','Nikon AF 85mm f/1.8D','C02','B02','100000','3')
	INSERT INTO Items.Products VALUES ('P070','Nikon AF 85mm f1.4D','C02','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P071','Nikon AF-S 85mm f1.8 G','C02','B02','80000','3')
	INSERT INTO Items.Products VALUES ('P072','Nikon AF-S 85mm f1.4 G','C02','B02','240000','3')
	INSERT INTO Items.Products VALUES ('P073','Nikon AF-S 85mm f/3.5 G ED VR Micro','C02','B02','120000','3')
	INSERT INTO Items.Products VALUES ('P074','Nikon AF-S 105mm f/2.8G IF ED VR Micro','C02','B02','175000','3')
	INSERT INTO Items.Products VALUES ('P075','Nikon AF-S DX 10-24mm f/3.5-4.5 ED','C02','B02','180000','3')
	INSERT INTO Items.Products VALUES ('P076','Nikon AF-S 12-24mm f/4 IF ED DX','C02','B02','180000','3')
	INSERT INTO Items.Products VALUES ('P077','Nikon AF-S 14-24mm f/2.8 G','C02','B02','300000','3')
	INSERT INTO Items.Products VALUES ('P078','Nikon AF-S 16-35mm f/4G ED VR','C02','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P079','Nikon AF-S 17-35mm f/2.8 ED IF','C02','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P080','Nikon AF-S 17-55mm f2.8 G IF ED DX','C02','B02','180000','3')
	INSERT INTO Items.Products VALUES ('P081','Nikon AF-S VR DX 18-55mm f/3.5-5.6 G','C02','B02','40000','3')
	INSERT INTO Items.Products VALUES ('P082','Nikon AF-S VR 18-105mm f3.5-5.6 GED','C02','B02','100000','3')
	INSERT INTO Items.Products VALUES ('P083','Nikon AF-S DX 18-140mm f3.5-5.6 G ED','C02','B02','100000','3')
	INSERT INTO Items.Products VALUES ('P084','Nikon AF-S DX VR II 18-200mm f 3.5-5.6 G IF ED','C02','B02','150000','3')
	INSERT INTO Items.Products VALUES ('P085','Nikon DX VR 18-300mm f/3.5-5.6 IF ED','C02','B02','180000','3')
	INSERT INTO Items.Products VALUES ('P086','Nikon AF-S 24-70mm f/2.8 ED','C02','B02','300000','3')
	INSERT INTO Items.Products VALUES ('P087','Nikon AF-S 28-70mm f/2.8D IF ED','C02','B02','200000','3')
	INSERT INTO Items.Products VALUES ('P088','Nikon AF-S 70-200mm f/2.8 IF ED VR','C02','B02','300000','3')
	INSERT INTO Items.Products VALUES ('P089','Nikon AF-S 70-200mm f/2.8G ED VR II','C02','B02','350000','3')
	INSERT INTO Items.Products VALUES ('P090','Nikon AF-S 70-200mm f/4G ED VR','C02','B02','250000','3')
	INSERT INTO Items.Products VALUES ('P091','Nikon AF 80-200mm f/2.8 ED','C02','B02','180000','3')
	INSERT INTO Items.Products VALUES ('P092','GoPro Hero 3 Black Edition','C03','B03','150000','3')
	INSERT INTO Items.Products VALUES ('P093','GoPro Hero 4 Black Edition','C03','B03','200000','3')
	INSERT INTO Items.Products VALUES ('P094','GoPro Hero 6 Black Edition','C03','B03','250000','3')
	INSERT INTO Items.Products VALUES ('P095','Manfrotto 725B','C04','B04','40000','3')
	INSERT INTO Items.Products VALUES ('P096','Manfrotto 055X Pro B','C04','B04','50000','3')
	INSERT INTO Items.Products VALUES ('P097','Manfrotto 561 BHDV-1-Monopod','C04','B04','100000','3')
	INSERT INTO Items.Products VALUES ('P098','DJI Ronin-S','C05','B05','300000','3')
	INSERT INTO Items.Products VALUES ('P099','SanDisk SD CARD 64 GB','C06','B06','15000','3')
	INSERT INTO Items.Products VALUES ('P100','SanDisk SD CARD 128 GB','C06','B06','20000','3')
	INSERT INTO Items.Products VALUES ('P999','not an item','C00','B00','0','9999999') --default.
--create triggers
	CREATE TRIGGER Items.Products_Trigger ON Items.Products
	INSTEAD OF INSERT AS
	BEGIN
		PRINT 'Do not enter data into this table'
	END;
/*==================================================================*/

/*Sales.Stores*/
--create tables
	CREATE TABLE Sales.Stores (
	store_id VARCHAR(10) CONSTRAINT PK_store_id not null PRIMARY KEY,
	store_name VARCHAR(50)not null,
	phone VARCHAR(50)not null,
	email VARCHAR(50)not null,
	address VARCHAR(50)not null,
	city VARCHAR(50)not null,
	province VARCHAR(50)not null,
	zip_code VARCHAR(50)not null
);
--insert data
	INSERT INTO Sales.Stores VALUES ('Store01','Rent Photograph Gear Group 10','+62821xxxxxxxx','rentphotographgroup10@gmail.com','Jl.Margonda','Depok','Jawa Barat','16424')
--create triggers
	CREATE TRIGGER Sales.Stores_Trigger ON Sales.Stores
	INSTEAD OF INSERT AS
	BEGIN
		PRINT 'Do not enter data into this table'
	END;
/*==================================================================*/

/*Sales.Staffs*/
--create tables
CREATE TABLE Sales.Staffs (
	staff_id VARCHAR(10) CONSTRAINT PK_staff_id not null PRIMARY KEY,
	staff_first_name CHAR(20)not null,
	staff_last_name CHAR(20)not null,
	staff_gender CHAR(6) CONSTRAINT checkgenderstaff CHECK(staff_gender IN('Male','Female')) not null,
	email VARCHAR(50)not null UNIQUE,
	phone VARCHAR(50)not null UNIQUE,
	store_id VARCHAR(10) CONSTRAINT FK_store_id not null FOREIGN KEY (store_id) REFERENCES Sales.Stores(Store_id) CHECK(store_id IN('Store01'))
);
--insert data
	INSERT INTO Sales.Staffs VALUES ('Staff01','Rachel','Christine','Female','rachelchristfdl@gmail.com','081932221558','Store01')
	INSERT INTO Sales.Staffs VALUES ('Staff02','Rahadyan','Antawirja','Male','bagusrahadyan1@gmail.com','08986023000','Store01')
	INSERT INTO Sales.Staffs VALUES ('Staff03','Ryan','Adiyantara','Male','adiyantararyan@gmail.com','082128428935','Store01')
--create triggers
	CREATE TRIGGER Sales.Staffs_Trigger ON Sales.Staffs
	INSTEAD OF INSERT AS
	BEGIN
		PRINT 'Do not enter data into this table'
	END;
/*==================================================================*/

/*Sales.Customers*/
--create tables
CREATE TABLE Sales.Customers (
	customer_id VARCHAR(10) CONSTRAINT PK_customer_id PRIMARY KEY,
	customer_first_name CHAR(20)not null,
	customer_last_name CHAR(20)not null,
	customer_gender CHAR(6) CONSTRAINT check_gender CHECK(customer_gender IN('Male','Female')) not null,
	email VARCHAR(50)not null,
	phone VARCHAR(50)not null ,
	address VARCHAR(50)not null,
	city VARCHAR(50)not null,
	province VARCHAR(50)not null,
	state VARCHAR(50)not null,
	zip_code VARCHAR(50)not null 
);
--create triggers
	CREATE TRIGGER Sales.Customers_Trigger ON Sales.Customers
	AFTER INSERT AS
	BEGIN
		print 'Data Saved Successfully'
	END;
--insert data
	INSERT INTO Sales.Customers VALUES ('CST0000001','Gibran','Rakabuming','Male','gibran01@gmail.com','08xxxxxxxxxx','abc','Solo','Jawa Tengah','Indonesia','123456')
	INSERT INTO Sales.Customers VALUES ('CST0000002','Kaesang','Pangarep','Male','kaesang02@gmail.com','08xxxxxxxxxx','abc','Solo','Jawa Tengah','Indonesia','234567')
	INSERT INTO Sales.Customers VALUES ('CST0000003','Kahiyang','Ayu','Male','kahiyang03@gmail.com','08xxxxxxxxxx','abc','Solo','Jawa Tengah','Indonesia','345678')
/*==================================================================*/

/*Sales.Orders*/
--create tables
CREATE TABLE Sales.Orders (
	order_id VARCHAR(10) CONSTRAINT PK_order_id not null PRIMARY KEY,
	product_id_1 VARCHAR(4) CONSTRAINT FK_product_id_1 FOREIGN KEY (product_id_1) REFERENCES Items.Products(product_id) CONSTRAINT defaultproductid_1 DEFAULT 'P999',
	product_id_2 VARCHAR(4) CONSTRAINT defaultproductid_2 DEFAULT 'P999',
	product_id_3 VARCHAR(4) CONSTRAINT defaultproductid_3 DEFAULT 'P999',
	product_id_4 VARCHAR(4) CONSTRAINT defaultproductid_4 DEFAULT 'P999',
	product_id_5 VARCHAR(4) CONSTRAINT defaultproductid_5 DEFAULT 'P999',
	customer_id VARCHAR(10) CONSTRAINT FK_customer_id not null FOREIGN KEY (customer_id) REFERENCES Sales.customers(customer_id),
	staff_id VARCHAR(10) CONSTRAINT FK_staff_id not null FOREIGN KEY (staff_id) REFERENCES Sales.Staffs(Staff_id) CHECK(staff_id IN('Staff01','Staff02','Staff03')),
	store_id VARCHAR(10) CONSTRAINT FK_store_id not null FOREIGN KEY (store_id) REFERENCES Sales.Stores(Store_id) CHECK(store_id IN('Store01')),
	order_status INT CONSTRAINT checkstatus CHECK(order_status IN('1','2'))not null,-- 1=Rent, 2=Returned.
	rental_time INT CONSTRAINT checkrentaltime CHECK(rental_time <= 30), -- in days.
);
--create triggers
	--triggers 1 : For Rent
	CREATE TRIGGER Sales.Order_InsertRent_Trigger ON Sales.Orders
	AFTER INSERT AS
	DECLARE @insert_status VARCHAR(8)
	SELECT @insert_status = order_status FROM inserted
	DECLARE @order_id VARCHAR(10)
	SELECT @order_id = order_id FROM inserted
	DECLARE @product1 VARCHAR(4), @product2 VARCHAR(4), @product3 VARCHAR(4) ,@product4 VARCHAR(4) ,@product5 VARCHAR(4)
	SELECT @product1 = product_id_1 FROM inserted
	SELECT @product2 = product_id_2 FROM inserted
	SELECT @product3 = product_id_3 FROM inserted
	SELECT @product4 = product_id_4 FROM inserted
	SELECT @product5 = product_id_5 FROM inserted
		IF @insert_status = 1 
		BEGIN
			UPDATE Items.Products SET stock = stock - 1  WHERE product_id = @product1
			UPDATE Items.Products SET stock = stock - 1  WHERE product_id = @product2
			UPDATE Items.Products SET stock = stock - 1  WHERE product_id = @product3
			UPDATE Items.Products SET stock = stock - 1  WHERE product_id = @product4
			UPDATE Items.Products SET stock = stock - 1  WHERE product_id = @product5
		END
		ELSE
		BEGIN
			PRINT 'order_status for rentals can only be filled in by 1, 2 is used when updating returns'
			DELETE FROM Sales.Orders WHERE order_id = @order_id
		END
	--triggers 2 : For Return
	CREATE TRIGGER Sales.Order_UpdateReturn_Trigger ON Sales.Orders
	AFTER UPDATE AS
	DECLARE @update_status VARCHAR(8)
	SELECT @update_status = order_status FROM Sales.Orders
	DECLARE @product1 VARCHAR(4), @product2 VARCHAR(4), @product3 VARCHAR(4) ,@product4 VARCHAR(4) ,@product5 VARCHAR(4)
	SELECT @product1 = product_id_1 FROM inserted
	SELECT @product2 = product_id_2 FROM inserted
	SELECT @product3 = product_id_3 FROM inserted
	SELECT @product4 = product_id_4 FROM inserted
	SELECT @product5 = product_id_5 FROM inserted
		IF @update_status = 2 
		BEGIN
			UPDATE Items.Products SET stock = stock + 1  WHERE product_id = @product1
			UPDATE Items.Products SET stock = stock + 1  WHERE product_id = @product2
			UPDATE Items.Products SET stock = stock + 1  WHERE product_id = @product3
			UPDATE Items.Products SET stock = stock + 1  WHERE product_id = @product4
			UPDATE Items.Products SET stock = stock + 1  WHERE product_id = @product5
		END
		ELSE
		BEGIN
			PRINT 'cannot be filled with 1, because 1 is for rent'
		END
	--triggers 3 : For Total Price
	CREATE TRIGGER Sales.Order_TotalPrice_Trigger ON Sales.Orders
	AFTER INSERT AS
	DECLARE @product1 VARCHAR(4), @product2 VARCHAR(4), @product3 VARCHAR(4) ,@product4 VARCHAR(4) ,@product5 VARCHAR(4)
	SELECT @product1 = product_id_1 FROM inserted
	SELECT @product2 = product_id_2 FROM inserted
	SELECT @product3 = product_id_3 FROM inserted
	SELECT @product4 = product_id_4 FROM inserted
	SELECT @product5 = product_id_5 FROM inserted
	DECLARE @daily_price_1 MONEY, @daily_price_2 MONEY, @daily_price_3 MONEY, @daily_price_4 MONEY, @daily_price_5 MONEY
	SELECT @daily_price_1 = daily_price FROM Items.Products WHERE product_id = @product1
	SELECT @daily_price_2 = daily_price FROM Items.Products WHERE product_id = @product2
	SELECT @daily_price_3 = daily_price FROM Items.Products WHERE product_id = @product3
	SELECT @daily_price_4 = daily_price FROM Items.Products WHERE product_id = @product4
	SELECT @daily_price_5 = daily_price FROM Items.Products WHERE product_id = @product5
	DECLARE @product_1_name VARCHAR(50), @product_2_name VARCHAR(50), @product_3_name VARCHAR(50), @product_4_name VARCHAR(50), @product_5_name VARCHAR(50)
	SELECT @product_1_name = product_name FROM Items.Products WHERE product_id = @product1
	SELECT @product_2_name = product_name FROM Items.Products WHERE product_id = @product2
	SELECT @product_3_name = product_name FROM Items.Products WHERE product_id = @product3
	SELECT @product_4_name = product_name FROM Items.Products WHERE product_id = @product4
	SELECT @product_5_name = product_name FROM Items.Products WHERE product_id = @product5
	DECLARE @order_id VARCHAR(10)
	SELECT @order_id = order_id FROM inserted
	DECLARE @totalprice_status VARCHAR(8)
	SELECT @totalprice_status = order_status FROM inserted
	DECLARE @rental_time INT
	SELECT @rental_time = rental_time FROM inserted
		IF @totalprice_status = 1 AND @rental_time < 7
		BEGIN
			INSERT INTO Sales.Prices VALUES (@order_id, @product_1_name, @product_2_name, @product_3_name, @product_4_name, @product_5_name, (@daily_price_1+@daily_price_2+@daily_price_3+@daily_price_4+@daily_price_5)*@rental_time)
		END
		ELSE IF @totalprice_status = 1 AND @rental_time >= 7
		BEGIN
			INSERT INTO Sales.Prices VALUES (@order_id, @product_1_name, @product_2_name, @product_3_name, @product_4_name, @product_5_name, (@daily_price_1+@daily_price_2+@daily_price_3+@daily_price_4+@daily_price_5)*@rental_time/2)
		END
		ELSE --@totalprice = 2
		BEGIN
			PRINT 'not counted because filling in the wrong status order'
		END
--insert data
	-- Example Case : Correct Values and Correct Updates
	INSERT INTO Sales.Orders VALUES ('ORD0000001','P001','P002','P003','P004','P005','CST0000001','Staff01','Store01','1','7')
	UPDATE Sales.Orders SET order_status = '2' WHERE order_id = 'ORD0000001'
	-- Example Case : Correct Values and Incorrect Updates
	INSERT INTO Sales.Orders VALUES ('ORD0000002','P001','P002','P003','P004','P005','CST0000001','Staff01','Store01','1','7')
	UPDATE Sales.Orders SET order_status = '1' WHERE order_id = 'ORD0000002'
	-- Example Case : incorrect Values
	INSERT INTO Sales.Orders VALUES ('ORD0000003','P001','P002','P003','P999','P999','CST0000001','Staff01','Store01','2','7')
	-- Example Case : just select some items
	INSERT INTO Sales.Orders (order_id, product_id_1, customer_id, staff_id, store_id, order_status, rental_time) VALUES ('ORD0000003','P001','CST0000001','Staff01','Store01','1','7')
/*==================================================================*/

/*Sales.Prices*/
--create table
CREATE TABLE Sales.Prices (
	order_id VARCHAR(10) CONSTRAINT FK_order_id FOREIGN KEY (order_id) REFERENCES Sales.Orders(order_id),
	product_1_name VARCHAR(50),
	product_2_name VARCHAR(50),
	product_3_name VARCHAR(50),
	product_4_name VARCHAR(50),
	product_5_name VARCHAR(50),
	total_price MONEY
);
--create triggers
	CREATE TRIGGER Sales.Prices_Trigger ON Sales.Stores
	INSTEAD OF UPDATE AS
	BEGIN
		PRINT 'Do not update data into this table'
	END;
--insert data
	--null, because it will be input from the trigger in the orders table
/*==================================================================*/

SELECT*FROM Items.Categories
SELECT*FROM Items.Brands
SELECT*FROM Sales.Stores
SELECT*FROM Sales.Staffs

SELECT*FROM Sales.Customers

SELECT product_name, stock
FROM Items.Products

SELECT*FROM Sales.Orders
SELECT*FROM Sales.Prices


/*--------------------------VIEWS, JOIN TABLES.---------------------*/
/*==================================================================*/

--create views
CREATE VIEW Sales.ViewStore
AS SELECT store_id, store_name FROM Sales.Stores

CREATE VIEW Items.ViewStaffs
AS SELECT staff_id, staff_first_name, staff_last_name FROM Sales.Staffs

CREATE VIEW Items.ViewCustomers
AS SELECT customer_id, customer_first_name, customer_last_name FROM Sales.Customers

CREATE VIEW Items.ViewOrders
AS SELECT order_id, product_id_1, product_id_2, product_id_3, product_id_4, product_id_5, customer_id, staff_id, store_id, order_status, rental_time FROM Sales.Orders

SELECT*FROM Sales.ViewStore
SELECT*FROM Items.ViewStaffs
SELECT*FROM Items.ViewCustomers
SELECT*FROM Items.ViewOrders
/*==================================================================*/

--join tables

/*Items Schema*/
SELECT product_id, product_name, brand_name, category_name, daily_price
FROM Items.Products
INNER JOIN Items.Brands
ON Items.Products.brand_id = Items.Brands.brand_id
INNER JOIN Items.Categories
ON Items.Products.category_id = Items.Categories.category_id

/*Join Sales Schema*/
SELECT order_id, customer_first_name, customer_last_name, staff_first_name, staff_last_name, store_name
FROM Sales.Orders
INNER JOIN Sales.Customers
ON Sales.Orders.customer_id = Sales.Customers.customer_id
INNER JOIN Sales.Staffs
ON Sales.Orders.staff_id = Sales.Staffs.staff_id
INNER JOIN Sales.Stores
ON Sales.Orders.store_id = Sales.Orders.store_id
/*==================================================================*/


SELECT product_name, stock
FROM Items.Products

UPDATE Items.Products SET product_name = '61D (Body Only)' WHERE product_id = 'P004'

DELETE FROM Items.Products WHERE product_id = 'P004'

SELECT * FROM Items.Products
WHERE brand_id = 'B03'