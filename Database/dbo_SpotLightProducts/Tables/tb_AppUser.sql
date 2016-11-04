CREATE TABLE tb_AppUser (
	Id INTEGER,
	First_Name VARCHAR(50) not null,
	Last_Name VARCHAR(50) not null,
	Email VARCHAR(100) not null,
	Pwd VARCHAR(100) not null,
	Is_Active BOOLEAN DEFAULT 1,
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Created_By VARCHAR(100) not null,
	Modified_On TIMESTAMP not null,
	Modified_By VARCHAR(100) not null,
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_AppUser_Id PRIMARY KEY(Id)
)
