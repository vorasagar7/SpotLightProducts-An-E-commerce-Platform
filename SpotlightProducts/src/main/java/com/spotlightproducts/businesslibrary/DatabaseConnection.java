package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.User;

public class DatabaseConnection {
	
	//method to get the Database Connection
	public static Connection getDatabaseConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://db.soic.indiana.edu:3306/p565f16_efhuang","p565f16_efhuang","qwert12345");
		}
		catch(Exception e)
		{
			System.out.println(e);			
		}
		return con;
	}
}