package com.spotlightproducts.businesslibrary;

import com.spotlightproducts.dao.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.User;

public class InventoryManagement {

		public DatabaseResponse<ReferenceData> getReferenceListItems() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
						"admin", "admin");
				CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Payment_ReferenceData_Get()}");
				boolean hadResults = cStmt.execute();
				System.out.println("hadResults" + hadResults);
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
							ReferenceData refData = new ReferenceData();
							refData.setId(rs.getInt(1));
							refData.setObjectId(rs.getInt(2));
							refData.setName(rs.getString(3));
							referenceList.add(refData);						
					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
				response.setStatus("Success");
				response.setMessage("");
				response.setData(referenceList);
				return response;
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus("Failure");
			response.setMessage("Technical Error");
			response.setData(referenceList);
			return response;

		}
		
		public DatabaseResponse savePaymentDetails(UserPaymentDetailsDao userDetails) {
			DatabaseResponse response = new DatabaseResponse();
			String fullName = userDetails.getFullName();
			int typeOfPayment = userDetails.getTypeOfPayment();
			String address1 = userDetails.getAddress1();
			String address2 = userDetails.getAddress2();
			String city = userDetails.getCity();
			String state = userDetails.getState();
			String country = userDetails.getCountry();
			int zipcode = userDetails.getZip_code();
			String full_address = address1+" "+address2+" "+city+" "+state+" "+country+" "+zipcode;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
						"admin", "admin");
				CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Payment_And_Delivery(?, ?, ?)}");
				cStmt.setInt(1, 1);
				cStmt.setInt(2, typeOfPayment);
				cStmt.setString(3, full_address);
				boolean hadResults = cStmt.execute();
				System.out.println("hadResults" + hadResults);
				while (hadResults) {
					ResultSet rs = (ResultSet) cStmt.getResultSet();
					while (rs.next()) {
						int id = rs.getInt(1);
						if (id == 1) {
							con.close();
							response.setStatus("Success");
							response.setMessage("Order successfully placed....");
							return response;
						} else {
							con.close();
							response.setStatus("Failure");
							response.setMessage("Sorry, Your order cannot be placed....");
							return response;
						}

					}
					hadResults = cStmt.getMoreResults();
				}
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
			response.setStatus("Failure");
			response.setMessage("Technical Error. Sorry... Try Again...");
			return response;

		}
	
}
