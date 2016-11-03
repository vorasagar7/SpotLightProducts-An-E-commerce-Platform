CREATE TABLE tb_ReferenceList (
	Id INTEGER,     
	Name VARCHAR(100),     
	Is_Deleted BOOLEAN DEFAULT 0,   
	Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
	Created_By VARCHAR(100),     
	Modified_On TIMESTAMP,     
	Modified_By VARCHAR(100),     
	Version INTEGER DEFAULT 1,
	CONSTRAINT pk_tb_ReferenceList_Id PRIMARY KEY(Id),
)