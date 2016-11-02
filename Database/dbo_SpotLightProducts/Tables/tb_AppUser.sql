CREATE TABLE tb_AppUser
(
    Id INTEGER, 
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Pwd VARCHAR(100),
    Is_Active BOOLEAN DEFAULT 1,
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    Created_By VARCHAR(100),
    Modified_On TIMESTAMP,
    Modified_By VARCHAR(100),
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_AppUser_Id PRIMARY KEY(Id)
)