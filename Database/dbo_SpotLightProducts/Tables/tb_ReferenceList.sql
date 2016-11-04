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