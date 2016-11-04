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