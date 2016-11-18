package com.spotlightproducts.login;

import org.springframework.stereotype.Service;
import java.sql.*;

@Service
public class LoginService {
	public boolean validateUser(String user, String password) {
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts","admin","admin");  
			//ResultSet rs=stmt.executeQuery("call sp_Check_For_Authentication("+userName+","+password+")");  
			 CallableStatement cStmt = con.prepareCall("{call sp_Check_For_Authentication(?, ?)}");
			 cStmt.setString(1,user);
			 cStmt.setString(2,password);
			// ResultSet rs = cStmt.execute();
			 boolean hadResults = cStmt.execute();
			  System.out.println("hadResults"+hadResults);
			   while (hadResults) 
			   {
					ResultSet rs = cStmt.getResultSet();
					while (rs.next()) 
					{
						// retrieve values of fields
						System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t\t"+rs.getString(3)+"\t"+rs.getString(4));  
						String Email = rs.getString(4);
						if(user.equals(Email))
						{
							return true;
						}
						else
						{
							return false;						
						}
					}
					hadResults = cStmt.getMoreResults();
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