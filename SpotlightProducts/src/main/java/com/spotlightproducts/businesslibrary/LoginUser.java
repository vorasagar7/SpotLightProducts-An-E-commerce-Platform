package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;

import javax.resource.cci.ResultSet;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.User;
import java.sql.*;

public class LoginUser {
	
	
//	public void registerUser(User user){
//		
//		String firstName = user.getFirstName();
//		String lastName = user.getLastName();
//		String email = user.getEmail();
//		String password = user.getPassword();
//		String userType = user.getUserType();
//		boolean isDeletedBoolean = user.isDeleted();
//		int isDeleted = 0;
//		if(false){
//			isDeleted = 0;
//		}
//		else{
//			isDeleted = 1;
//		}
//	}
	
	public boolean validateUser(String email, String password){
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts","admin","admin");  
			//ResultSet rs=stmt.executeQuery("call sp_Check_For_Authentication("+userName+","+password+")");  
			 CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Check_For_Authentication(?, ?)}");
			 cStmt.setString(1,email);
			 cStmt.setString(2,password);
			// ResultSet rs = cStmt.execute();
			 boolean hadResults = cStmt.execute();
			  System.out.println("hadResults"+hadResults);
			   while (hadResults) 
			   {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) 
					{
						// retrieve values of fields
						System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t\t"+rs.getString(3)+"\t"+rs.getString(4));  
						String Email = rs.getString(4);
						if(email.equals(Email))
						{
							con.close();
							return true;
						}
						else
						{
							con.close();
							return false;						
						}
					}
					//hadResults = cStmt.getMoreResults();
			   }
			con.close();  
		}
		catch(Exception e)
		{ 
			System.out.println(e);  
		}  
		return false;
	}
}
