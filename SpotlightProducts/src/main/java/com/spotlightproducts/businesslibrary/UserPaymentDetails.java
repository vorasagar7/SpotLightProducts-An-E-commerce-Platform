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

public class UserPaymentDetails {

		public DatabaseResponse<ReferenceData> getReferenceListItems() {
			DatabaseResponse response = new DatabaseResponse();
			List<ReferenceData> referenceList = new ArrayList<ReferenceData>();

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
						"admin", "admin");
				// ResultSet rs=stmt.executeQuery("call
				// sp_Check_For_Authentication("+userName+","+password+")");
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
	
}
