CREATE TABLE tb_ReferenceListItem (
    Id INTEGER AUTO_INCREMENT,     
    Name VARCHAR(100),
    List_Id INTEGER,
    SortOrder INTEGER,
    Is_Deleted BOOLEAN DEFAULT 0,   
    Created_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    Created_By VARCHAR(100),     
    Modified_On TIMESTAMP,     
    Modified_By VARCHAR(100),     
    Version INTEGER DEFAULT 1,
    CONSTRAINT pk_tb_ReferenceListItem_Id PRIMARY KEY(Id),
    CONSTRAINT fk_tb_ReferenceListItem_ListId FOREIGN KEY(List_Id) REFERENCES tb_ReferenceList(Id)
)


