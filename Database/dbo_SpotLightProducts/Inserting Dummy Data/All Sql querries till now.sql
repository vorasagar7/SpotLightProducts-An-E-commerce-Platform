CREATE TABLE tb_AppRole (
	Id INTEGER,
	Role_Name VARCHAR(100) not null,
	Is_Deleted BOOLEAN DEFAULT 0,
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Created_By VARCHAR(100) not null,
	Modified_On TIMESTAMP not null,
	Modified_By VARCHAR(100) not null,
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_AppUser_Id PRIMARY KEY(Id)
);

CREATE TABLE tb_UserRole (
	Id INTEGER,
	User_Id INTEGER,
	Role_Id INTEGER,
	Is_Deleted BOOLEAN DEFAULT 0,
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Created_By VARCHAR(100) not null,
	Modified_On TIMESTAMP not null,
	Modified_By VARCHAR(100) not null,
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_UserRole_Id PRIMARY KEY(Id),
	CONSTRAINT fk_tb_UserRole_User_Id FOREIGN KEY(User_Id) REFERENCES tb_AppUser(Id),
	CONSTRAINT fk_tb_UserRole_Role_Id FOREIGN KEY(Role_Id) REFERENCES tb_AppRole(Id)
);

CREATE TABLE tb_ReferenceList (
	Id INTEGER,     
	Name VARCHAR(100) not null,     
	Is_Deleted BOOLEAN DEFAULT 0,   
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
	Created_By VARCHAR(100) not null,     
	Modified_On TIMESTAMP not null,     
	Modified_By VARCHAR(100) not null,     
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_ReferenceList_Id PRIMARY KEY(Id)
);

CREATE TABLE tb_ReferenceListItem (
    Id INTEGER,     
    Name VARCHAR(100) not null,
    List_Id INTEGER not null,
    SortOrder INTEGER not null,
    Is_Deleted BOOLEAN DEFAULT 0,   
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_ReferenceListItem_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ReferenceListItem_ListId FOREIGN KEY(List_Id) REFERENCES tb_ReferenceList(Id)
);



CREATE TABLE tb_Products (
    Id INTEGER,     
    Product_Name VARCHAR(50) not null,     
    Model_Id VARCHAR(50) not null,     
    Brand_Id INTEGER not null, 
    Category_Id INTEGER not null,
    Description VARCHAR(1000),
    Is_Approved BOOLEAN DEFAULT 0,
    Is_Spotlight BOOLEAN DEFAULT 0,
    Is_Deleted BOOLEAN DEFAULT 0,     
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_Products_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_Products_Brand_Id FOREIGN KEY(Brand_Id) REFERENCES tb_ReferenceListItem(Id), 
    CONSTRAINT fk_tb_Products_Category_Id FOREIGN KEY(Category_Id) REFERENCES tb_ReferenceListItem(Id)   
);


CREATE TABLE tb_ProductSeller (
    Id INTEGER,     
    Product_Id INTEGER not null,     
    Seller_Id INTEGER not null,     
    Price FLOAT(10,2) not null,
    Quantity INTEGER not null,
    Is_Deleted BOOLEAN DEFAULT 0,     
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ProductSeller_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ProductSeller_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ProductSeller_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
  );
  
  
  CREATE TABLE tb_UserOrder (
    Id INTEGER,     
    Mode_Of_Payment_Id INTEGER not null,     
    Buyer_Id INTEGER not null,     
    Shipping_Address VARCHAR(1000) not null,
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_UserOrder_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_UserOrder_Mode_Of_Payment_Id FOREIGN KEY(Mode_Of_Payment_Id) REFERENCES tb_ReferenceListItem(Id),
    CONSTRAINT fk_tb_UserOrder_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id)
);

CREATE TABLE tb_UserReviews ( 
    Id INTEGER, 
    Product_Id INTEGER not null, 
    User_Id INTEGER not null, 
    Comment VARCHAR(1000), 
    Rating INTEGER, 
    Is_Deleted BOOLEAN DEFAULT 0, 
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Created_By VARCHAR(100) not null, 
    Modified_On TIMESTAMP not null, 
    Modified_By VARCHAR(100) not null, 
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_Reviews_Id PRIMARY KEY(Id), 
    CONSTRAINT fk_tb_Reviews_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id), 
    CONSTRAINT fk_tb_Reviews_User_Id FOREIGN KEY(User_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT ck_tb_Reviews_Rating CHECK(Rating >0 AND Rating < 6)  
);


CREATE TABLE tb_OrderMapping (
    Id INTEGER,     
    Seller_Id INTEGER not null,     
    Order_Id INTEGER not null,  
    Product_Id INTEGER not null,  
    Quantity INTEGER not null,
    Price varchar(100) not null,
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_OrderMapping_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_OrderMapping_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_OrderMapping_Order_Id FOREIGN KEY(Order_Id) REFERENCES tb_UserOrder(Id),
    CONSTRAINT fk_tb_OrderMapping_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id)
);


CREATE TABLE tb_ShoppingCart (
    Id INTEGER,     
    Buyer_Id INTEGER not null,
    Product_Id INTEGER not null,
    Seller_Id INTEGER not null,
    Quantity INTEGER not null,
    Price FLOAT(10,2) not null,
    IsDeleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ShoppingCart_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ShoppingCart_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_ShoppingCart_Product_Id FOREIGN KEY(Product_id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ShoppingCart_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
)


INSERT INTO tb_AppRole(Id,Role_Name,Created_By,Modified_On,Modified_By,Version) VALUES (1,"Buyer","Admin","2016-11-03 23:50:20","Admin",1);
INSERT INTO tb_AppRole(Id,Role_Name,Created_By,Modified_On,Modified_By,Version) VALUES (2,"Seller","Admin","2016-11-03 23:51:30","Admin",1);
INSERT INTO tb_AppRole(Id,Role_Name,Created_By,Modified_On,Modified_By,Version) VALUES (3,"Admin","Admin","2016-11-03 23:53:45","Admin",1);

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('1', 'Sagar', 'Vora', 'vorasagar7@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', TIMESTAMP('0000-00-00 00:00:00.000000'), 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('2', 'Manan', 'Papadiwala', 'mananpapadiwala@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('3', 'Ronak', 'Parekh', 'ronak.bharat.parekh@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('4', 'Ethan', 'Huang', 'ethanfhuang@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('5', 'Seller1', 'SellerSurname1', 'seller1@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('6', 'Seller2', 'SellerSurname2', 'seller2@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_AppUser` (`Id`, `First_Name`, `Last_Name`, `Email`, `Pwd`, `Is_Active`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('7', 'Admin', 'AdminSurname', 'admin@gmail.com', 'qwert12345', '1', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');


INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('1', '1', '1', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('2', '2', '1', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('3', '3', '1', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('4', '4', '1', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('5', '5', '2', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('6', '6', '2', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');

INSERT INTO `tb_UserRole` (`Id`, `User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('7', '7', '3', '0', CURRENT_TIMESTAMP, 'Admin', CURRENT_TIMESTAMP, 'Admin', '1');



DELIMITER $$
CREATE PROCEDURE sp_Check_For_Authentication
(
 IN p_userEmail varchar(100),
 IN p_password varchar(100)
)
BEGIN
CREATE TEMPORARY TABLE UserTable(
Id INTEGER,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100)
);
INSERT INTO UserTable(
Id,
FirstName,
LastName,
       Email
)
SELECT Id,
First_Name,
Last_Name,
Email
FROM tb_AppUser
WHERE Email = p_userEmail
AND Pwd = p_password
AND Is_Active = 1;

SET @rowCount = (SELECT COUNT(*) FROM UserTable);
IF @rowCount > 0 THEN
SELECT Id, FirstName, LastName, Email FROM UserTable;
ELSE
SELECT NULL AS Id, NULL AS FirstName, NULL AS LastName, NULL AS Email;
END IF;


DROP TABLE UserTable;
END;
$$

CALL sp_Check_For_Authentication('vorasagar7@gmail.com','aaqwert12345')


select max(id) from tb_AppUser;

select max(id) from tb_OrderMapping;



DELIMITER $$
Create Procedure sp_Add_New_User
(
	In p_First_Name varchar(100),
	In p_Last_Name varchar(100),
	In p_Email varchar(100),
	In p_Password varchar(100),
	In p_role_id integer
)
BEGIN
IF (EXISTS(SELECT Email FROM tb_AppUser where Email = p_Email)) THEN
	Select -1 as Success , "User Already Registered" as ErrMessage;
ELSE
	INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES (p_First_Name, p_Last_Name,p_Email, p_Password, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
	 set @userID = (select LAST_INSERT_ID());
	INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES (@userID, p_role_id, CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
    Select 1 as Success, "" as ErrMessage, @user_id As User_Id;
END IF;
End;
$$

ALTER TABLE tb_AppUser Modify Id integer AUTO_INCREMENT;

drop procedure sp_Add_New_User;
call sp_Add_New_User("sagar","vora","savora@iu.edu","12345",1);

insert into tb_ReferenceList(id,Name,Created_By,Modified_On,Modified_By) values(1,"Brand",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceList(id,Name,Created_By,Modified_On,Modified_By) values(2,"Categories",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_ReferenceListItem (Id,Name,List_Id, SortOrder,Created_By,Modified_On,Modified_By) values(1,"Reebox",1,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Id,Name,List_Id, SortOrder,Created_By,Modified_On,Modified_By) values(2,"Electronic",2,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Id,Name,List_Id, SortOrder,Created_By,Modified_On,Modified_By) values(3,"Mobile",2,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_Products (Id,Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values (1,"shoes","abc",1,2,"snvskdjn",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_Products (Id,Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values (2,"shoes","abcdsd",1,2,"dasdasnvskdjn",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_Products (Id,Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values (3,"mobile","abfsfc",3,3,"snvskdjn",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);


  insert into tb_ProductSeller (id,Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (1,1,4,200,10,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
  insert into tb_ProductSeller (id,Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (2,1,5,2020,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
  insert into tb_ProductSeller (id,Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (3,2,5,2020,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
  
  
DELIMITER $$
CREATE PROCEDURE sp_SearchedProducts_Get(
IN p_searchQuery VARCHAR(100)
)
BEGIN
SELECT p.Id, p.Product_Name, p.Model_Id, brand.Name, category.Name, concat(au.First_Name,au.Last_Name), p.Description, ps.Price, ps.Quantity FROM tb_Products p
INNER JOIN tb_ProductSeller ps
ON p.Id = ps.Product_Id
INNER JOIN tb_AppUser au
ON au.Id = ps.Seller_Id
INNER JOIN tb_ReferenceListItem brand
ON brand.Id = p.Brand_Id
INNER JOIN tb_ReferenceListItem category
ON category.Id = p.Category_Id
WHERE p.Product_Name like concat('%',p_searchQuery,'%')
OR p.Model_Id like concat('%',p_searchQuery,'%')
OR brand.Name like concat('%',p_searchQuery,'%')
OR category.Name like concat('%',p_searchQuery,'%')
OR p.Description like concat('%',p_searchQuery,'%')
OR Concat(au.First_Name,au.Last_Name) like concat('%',p_searchQuery,'%');
END;
$$
drop procedure sp_SearchedProducts_Get;
select * from tb_products;
Call sp_SearchedProducts_Get("book");