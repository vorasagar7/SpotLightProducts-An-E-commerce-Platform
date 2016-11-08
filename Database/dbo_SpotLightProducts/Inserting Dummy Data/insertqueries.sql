INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Buyer",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Seller",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Admin",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

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
  
  
  INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('1', '1', '1', 'dadsa', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');
INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('2', '1', '1', 'scas', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');
INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('3', '1', '1', 'dsds', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');
INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('4', '1', '2', 'dsfsdfsd', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');
INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('5', '1', '2', 'fsdfsd', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');
INSERT INTO `spotlightproducts`.`tb_userorder` (`Id`, `Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, `IsDeleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('6', '1', '3', 'fsdfsd', '0', '2016-11-04 05:17:22', 'admin@%', '2016-11-04 05:17:22', 'admin@%', '1');

INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('1', '1', '1', 'jbasdudbasubu', '3', '0', CURRENT_TIMESTAMP(), CURRENT_USER(), CURRENT_TIMESTAMP(), CURRENT_USER(), '1');
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('2', '1', '2', 'xasxas', '4', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('3', '1', '3', 'sasaas', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('4', '2', '1', 'csdcsd', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('5', '2', '2', 'ddasdsa', '4', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Id`, `Product_Id`, `User_Id`, `Comment`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`, `Version`) VALUES ('6', '3', '1', 'asdadasd', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER, '1');
