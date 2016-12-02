INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Buyer",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Seller",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO tb_AppRole(Role_Name,Created_By,Modified_On,Modified_By) VALUES ("Admin",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`,`Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Sagar', 'Vora', 'vorasagar7@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Manan', 'Papadiwala', 'mananpapadiwala@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Ronak', 'Parekh', 'ronak.bharat.parekh@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Ethan', 'Huang', 'ethanfhuang@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Seller1', 'SellerSurname1', 'seller1@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Seller2', 'SellerSurname2', 'seller2@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Admin1', 'AdminSurname', 'admin@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

/* Newly Added id is from */
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Knife', 'Co', 'john.cena@knifeco.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Sports','24 x 7', 'sports24by7@yahoo.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('All about Knifes', 'Comp', 'peter@knifeinc.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Laser', 'Tech', 'lasertech@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `tb_AppUser` (`First_Name`, `Last_Name`, `Email`, `Pwd`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('Unique', 'World', 'uniqueworld@gmail.com', 'qwert12345', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
/* end */


INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('2', '1', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('3', '1', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('4', '1', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('5', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('6', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('7', '3', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

/* Newly added */
INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('8', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('9', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('10', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('11', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `tb_UserRole` (`User_Id`, `Role_Id`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('12', '2', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
/* end */

insert into tb_ReferenceList(Name,Created_By,Modified_On,Modified_By) values("Brand",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceList(Name,Created_By,Modified_On,Modified_By) values("Categories",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceList(Name,Created_By,Modified_On,Modified_By) values("Type Of Delivery",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Reebox",1,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Adidas",1,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Nike",1,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Nokia",1,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Samsung",1,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("OnePlus",1,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Electronics",2,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Mobiles",2,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Books",2,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Furniture",2,4,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Fashion",2,5,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Cash On Delivery",3,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Card Payment",3,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

/* Newly Added   id is from 66 - 72
71 - spotlight category
72 - spotlight brand
*/
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("7 for All Mankind",1,1,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Tommy Hilfiger‎",1,2,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Lee Cooper",1,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("Peter England",1,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("H & M",1,3,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("SpotlightProducts",2,6,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ReferenceListItem (Name,List_Id, Sort_Order,Created_By,Modified_On,Modified_By) values("SpotlightProducts",1,6,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
/* end */


insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("RBKshoes","RBKS1",1,11,"Reebok Shoes Size 9",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("NikeShoes","NIKES1",3,11,"Nike Sports shoes size 10",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("OnePlus 1","OP1",6,8,"One Plus 1 phone",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("One Plus 2","Op2",6,8,"One plus 2",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Nokia 6630","NOKIA6630",4,8,"Nokia 6630",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Nokia 6630","NOKIA6630",4,8,"Nokia 6630",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Nokia 6630","NOKIA6630",4,8,"Nokia 6630",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Nokia 6630","NOKIA6630",4,8,"Nokia 6630",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

/* Newly Added - SpotlightProducts  id = 6 to 11 */
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Heated Butter Knife","HButterKnife1",72,71,"Butter Knife which can be used to heat the butter as well",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Ping Pong Door","PPDoor1",72,71,"Door which can also be used to play ping poor",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Laser keyboard","LS1",72,71,"No need for physical keyboard",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Self Stirrer Mug","SSMug1",72,71,"Mug which can stir itself",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Cold Drink Dispenser","CCDispenser1",72,71,"Cold Drink Dispenser which saves fizz and manual work to put the cold drinks in the glasses",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_Products (Product_Name, Model_Id, Brand_Id, Category_Id, Description,Created_By,Modified_On,Modified_By) values ("Storage Switches","SSwitches1",72,71,"Switches which can save valueable stuffs",CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
/* end */

insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (6,8,60,100,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (6,10,200,15,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (7,9,200,15,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (8,11,100,50,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (9,12,30,15,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (10,12,30,15,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (11,12,30,15,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

/* Newly Added */
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (1,5,60,100,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (2,5,55,100,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (3,5,2020,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (3,6,50,100,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (4,6,2020,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ProductSeller (Product_Id,Seller_Id,Price,Quantity,Created_By,Modified_On,Modified_By) values (5,6,2020,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
/*Ends */  
  
  
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('12', '1', '524 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('12', '1', '524 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('13', '1', '524 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('12', '2', '565 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('12', '2', '565 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('13', '3', '564 W Hoosier Courts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userorder` (`Mode_Of_Payment_Id`, `Buyer_Id`, `Shipping_Address`, Created_By,Modified_On,Modified_By) VALUES ('13', '4', 'Tulip Tree Apts', CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);

insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,1,1,2,120,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,1,2,2,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (6,1,3,1,2020,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,2,1,2,120,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,2,2,2,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,3,1,2,120,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);
insert into tb_ordermapping(seller_id,order_id,Product_id,Quantity,Price,Created_By,Modified_On,Modified_By) values (5,3,2,2,110,CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER);


INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', 'jbasdudbasubu', '3', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '2', 'xasxas', '4', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '3', 'sasaas', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('2', '1', 'csdcsd', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('2', '2', 'ddasdsa', '4', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_userreviews` (`Product_Id`, `User_Id`, `Comments`, `Rating`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('3', '1', 'asdadasd', '5', '0', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', '5', '2', '120', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '2', '5', '2', '110', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '3', '6', '1', '2020', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', '5', '2', '120', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '2', '5', '2', '110', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '1', '5', '2', '120', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);
INSERT INTO `spotlightproducts`.`tb_shoppingcart` (`Buyer_Id`, `Product_Id`, `Seller_Id`, `Quantity`, `Price`, `Is_Deleted`, `Created_On`, `Created_By`, `Modified_On`, `Modified_By`) VALUES ('1', '2', '5', '2', '110', '1', CURRENT_TIMESTAMP, CURRENT_USER, CURRENT_TIMESTAMP, CURRENT_USER);

