package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.User;

public class LoginUser {
	
	
	public String registerUser(User user) {
	String firstName = user.getFirstName();
	String lastName = user.getLastName();
	String email = user.getEmail();
	String password = user.getPassword();
	String userType = user.getUserType();
	boolean isDeletedBoolean = user.isDeleted();
	int isDeleted = 0;
	int userTypeInt = 0;
	if (isDeletedBoolean) {
		isDeleted = 1;
	} else {
		isDeleted = 0;
	}

	if (userType.equalsIgnoreCase("Buyer")) {
		userTypeInt = 1;
	} else if (userType.equalsIgnoreCase("Seller")) {
		userTypeInt = 2;
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
				"admin", "admin");
		// ResultSet rs=stmt.executeQuery("call
		// sp_Check_For_Authentication("+userName+","+password+")");
		CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Add_New_User(?, ?, ?, ?, ?)}");
		cStmt.setString(1, firstName);
		cStmt.setString(2, lastName);
		cStmt.setString(3, email);
		cStmt.setString(4, password);
		cStmt.setInt(5, userTypeInt);
		// ResultSet rs = cStmt.execute();
		boolean hadResults = cStmt.execute();
		System.out.println("hadResults" + hadResults);
		while (hadResults) {
			ResultSet rs = (ResultSet) cStmt.getResultSet();
			while (rs.next()) {
				// retrieve values of fields
				System.out.println(rs.getInt(1) + "\t" + rs.getString(2) + "\t\t" + rs.getString(3));
				int id = rs.getInt(1);
				String message = rs.getString(2);
				if (message.equals("")) {
					int userId = rs.getInt(3);
					message = "User registered successfully";
					con.close();
					return message;
				} else {
					con.close();
					return message;
				}

			}
			hadResults = cStmt.getMoreResults();
		}
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return "";

}
	public boolean validateUser(User user){
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts","admin","admin");  
			//ResultSet rs=stmt.executeQuery("call sp_Check_For_Authentication("+userName+","+password+")");  
			 CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Check_For_Authentication(?, ?)}");
			 String email = user.getEmail();
			 String password = user.getPassword();
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
	public String forgotPassword(User user) throws AddressException, MessagingException {
		String password = null;
		String message = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			// ResultSet rs=stmt.executeQuery("call
			// sp_Check_For_Authentication("+userName+","+password+")");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Forget_Password(?)}");
			cStmt.setString(1, user.getEmail());
			// ResultSet rs = cStmt.execute();
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					// retrieve values of fields
					//System.out.println(rs.getInt(1));
					password = rs.getString(1);
					
						message = "You'll receive an email which contains your password, Shortly......";
						sendEmail(user.getEmail(), password);
						con.close();
						return message;
					

				}
				// hadResults = cStmt.getMoreResults();
			}
			message = "User not found";
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return message;

	}

	public void sendEmail(String email, String password) throws AddressException, MessagingException {

		 Properties mailServerProperties;
		 Session getMailSession;
		 MimeMessage generateMailMessage;

		// Step1
		System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		System.out.println("Mail Server Properties have been setup successfully..");

		// Step2
		System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress("savora@iu.edu"));
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("vorasagar7@gmail.com"));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("ronak.bharat.parekh@gmail.com"));
		generateMailMessage.setSubject("Greetings from SpotLightProducts..");
		String emailBody = "Your password is" + password + "<br>"
				+ "<br><br> Regards, <br>Spotlight Team";
		generateMailMessage.setContent(emailBody, "text/html");
		System.out.println("Mail Session has been created successfully..");

		// Step3
		System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");

		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "spotlightproducts2016@gmail.com", "qwert12345asdfg");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}

}

