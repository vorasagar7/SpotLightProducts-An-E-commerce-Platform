CREATE TABLE tb_AppUser (
	Id INTEGER AUTO_INCREMENT,
	First_Name VARCHAR(50) not null,
	Last_Name VARCHAR(50) not null,
	Email VARCHAR(100) not null,
	Pwd VARCHAR(100) not null,
	Is_DELETED BOOLEAN DEFAULT 0,
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Created_By VARCHAR(100) not null,
	Modified_On TIMESTAMP not null,
	Modified_By VARCHAR(100) not null,
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_AppUser_Id PRIMARY KEY(Id)
)

CREATE TABLE tb_AppRole (
	Id INTEGER AUTO_INCREMENT,
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
	Id INTEGER AUTO_INCREMENT,
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
	Id INTEGER AUTO_INCREMENT,     
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
    Id INTEGER AUTO_INCREMENT,     
    Name VARCHAR(100),
    List_Id INTEGER,
    Sort_Order INTEGER,
    Is_Deleted BOOLEAN DEFAULT 0,   
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_ReferenceListItem_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ReferenceListItem_ListId FOREIGN KEY(List_Id) REFERENCES tb_ReferenceList(Id)
);

CREATE TABLE tb_Products (
    Id INTEGER AUTO_INCREMENT,     
    Product_Name VARCHAR(50),     
    Model_Id VARCHAR(50),     
    Brand_Id INTEGER, 
    Category_Id INTEGER,
    Description VARCHAR(1000),
    Is_Approved BOOLEAN DEFAULT 0,
    Is_Spotlight BOOLEAN DEFAULT 0,
    Is_Deleted BOOLEAN DEFAULT 0,     
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_Products_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_Products_Brand_Id FOREIGN KEY(Brand_Id) REFERENCES tb_ReferenceListItem(Id), 
    CONSTRAINT fk_tb_Products_Category_Id FOREIGN KEY(Category_Id) REFERENCES tb_ReferenceListItem(Id)   
);

CREATE TABLE tb_ProductSeller (
    Id INTEGER AUTO_INCREMENT,     
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
    Id INTEGER AUTO_INCREMENT,     
    Mode_Of_Payment_Id INTEGER not null,     
    Buyer_Id INTEGER not null,     
    Shipping_Address VARCHAR(1000) not null,
    Is_Deleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_UserOrder_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_UserOrder_Mode_Of_Payment_Id FOREIGN KEY(Mode_Of_Payment_Id) REFERENCES tb_ReferenceListItem(Id),
    CONSTRAINT fk_tb_UserOrder_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id)
);

CREATE TABLE tb_OrderMapping (
    Id INTEGER AUTO_INCREMENT,     
    Seller_Id INTEGER not null,     
    Order_Id INTEGER not null,  
    Product_Id INTEGER not null,  
    Quantity INTEGER not null,
    Price varchar(100) not null,
    Is_Deleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_OrderMapping_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_OrderMapping_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_OrderMapping_Order_Id FOREIGN KEY(Order_Id) REFERENCES tb_UserOrder(Id),
    CONSTRAINT fk_tb_OrderMapping_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id)
)

CREATE TABLE tb_ShoppingCart (
    Id INTEGER AUTO_INCREMENT,     
    Buyer_Id INTEGER not null,
    Product_Id INTEGER not null,
    Seller_Id INTEGER not null,
    Quantity INTEGER not null,
    Price FLOAT(10,2) not null,
    Is_Deleted BOOLEAN DEFAULT 0,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100) not null,     
    Modified_On TIMESTAMP not null,     
    Modified_By VARCHAR(100) not null,     
    Version INTEGER DEFAULT 1, 
    CONSTRAINT pk_tb_ShoppingCart_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ShoppingCart_Buyer_Id FOREIGN KEY(Buyer_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT fk_tb_ShoppingCart_Product_Id FOREIGN KEY(Product_id) REFERENCES tb_Products(Id),
    CONSTRAINT fk_tb_ShoppingCart_Seller_Id FOREIGN KEY(Seller_Id) REFERENCES tb_AppUser(Id)   
);

CREATE TABLE tb_UserReviews ( 
    Id INTEGER AUTO_INCREMENT, 
    Product_Id INTEGER, 
    User_Id INTEGER, 
    Comments VARCHAR(1000), 
    Rating INTEGER, 
    Is_Deleted BOOLEAN DEFAULT 0, 
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Created_By VARCHAR(100), 
    Modified_On TIMESTAMP, 
    Modified_By VARCHAR(100), 
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_Reviews_Id PRIMARY KEY(Id), 
    CONSTRAINT fk_tb_Reviews_Product_Id FOREIGN KEY(Product_Id) REFERENCES tb_Products(Id), 
    CONSTRAINT fk_tb_Reviews_User_Id FOREIGN KEY(User_Id) REFERENCES tb_AppUser(Id),
    CONSTRAINT ck_tb_Reviews_Rating CHECK(Rating >0 AND Rating < 6)  
);

