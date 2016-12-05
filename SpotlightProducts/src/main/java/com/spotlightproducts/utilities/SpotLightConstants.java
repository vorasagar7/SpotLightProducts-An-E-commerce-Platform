package com.spotlightproducts.utilities;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SpotLightConstants {
	
	public static final String CONSTANT_SUCCESS = "Success";
	public static final String CONSTANT_FAILURE = "Failure";
	public static final String CONSTANT_TECHNICAL_FAILURE = "Technical Failure";
	public static final String CONSTANT_BUYER = "Buyer";
	public static final String CONSTANT_SELLER = "Seller";
	public static final String CONSTANT_EMAIL = "email";
	public static final String USER_NOT_FOUND_MESSAGE = "User not found. Please enter the correct email.";
	public static final String RECEIVE_EMAIL_MESSAGE = "You'll receive an email which contains your password, Shortly......";
	public static final String TECHNICAL_ERROR_MESSAGE = "Technical Error. Please contact the customer service.";
	public static final String TECHNICAL_ERROR_TRY_AGAIN_MESSAGE = "Technical Error. Sorry... Try Again...";
	public static final String SPOTLIGHTPRODUCTS_EMAIL_ID = "spotlightproducts2016@gmail.com";
	public static final String SPOTLIGHTPRODUCTS_EMAIL_PASSWORD = "qwert12345asdfg";
	public static final String CONSTANT_SELLER_TOTAL_REVENUE = "Seller's Total Revenue";
	public static final String CONSTANT_USER_ORDER = "User Orders";
	public static final String CONSTANT_PENDING_PRODUCT_LIST = "Pending Products List";
	public static final String CONSTANT_NO_PENDING_PRODUCT_LIST = "No Products are left to approve";
	public static final String CONSTANT_USER_REVIEW_SUCCESSFULLY_SAVED = "User Review Successfully Saved";
	public static final String CONSTANT_SHOPPING_CART_DATA_FETCHED_SUCCESSFULLY = "Shopping Cart Data fetched successfully.....";
	public static final String CONSTANT_ORDER_SUCCESSFULLY_PLACED = "Order successfully placed....";
	public static final String CONSTANT_ORDER_CANNOT_PLACED = "Sorry, Your order cannot be placed....";
	
	
	// Stored Procedure
	public static final String SP_GET_TOTAL_COUNT_OF_USER = "{call sp_get_Total_Count_Of_User(?)}";
	public static final String SP_GET_ALL_PRODUCT_FOR_A_SELLER_BELOW_LEVEL = "{call sp_get_All_Products_For_A_Seller_Below_Level(?)}";
	public static final String SP_ADD_NEW_USER = "{call sp_Add_New_User(?, ?, ?, ?, ?)}";
	public static final String SP_CHECK_AUTHORIZED_USER = "{call sp_Check_For_Authentication(?, ?)}";
	public static final String SP_FORGET_PASSWORD = "{call sp_Forget_Password(?)}";
	public static final String SP_UPDATE_USER_PASSWORD = "{call sp_update_User_Password(?,?,?)}";
	public static final String SP_GET_SELLER_REVENUE = "{call sp_get_Seller_Revenue(?)}";
	public static final String SP_GET_SEARCHED_PRODUCTS = "{call sp_SearchedProducts_Get(?)}";
	public static final String SP_GET_PRODUCT_DETAIL = "{call sp_Product_Detail_Get(?)}";
	public static final String SP_GET_PRODUCT_REVIEW = "{call sp_Product_Review_Get(?)}";
	public static final String SP_SAVE_USER_REVIEW = "{call sp_User_Review_Store(?,?,?,?)}";
	public static final String SP_GET_REFERENCE_DATA = "{call sp_Payment_ReferenceData_Get()}";
	public static final String SP_DO_PAYMENT_DELIVERY = "{call sp_Payment_And_Delivery(?, ?, ?)}";
	public static final String SP_GET_USER_SHOPPING_CART = "{call sp_User_Shopping_Cart_Get(?)}";
	public static final String SP_MODIFY_SHOPPING_CART = "{call sp_Modify_Shopping_Cart(?,?,?,?,?,?)}";
	public static final String SP_ENTRY_DELETE_SHOPPING_CART = "{call sp_Shopping_Cart_Entry_Delete(?,?,?,?,?)}";
	public static final String SP_GET_USER_ORDERS = "{call sp_get_User_Orders(?)}";
	public static final String SP_GET_USER_REVIEWS = "{call sp_get_User_Reviews(?)}";	
	public static final String SP_GET_USER_COUNT_BY_MONTH = "{call sp_Get_User_Count_By_Month()}";
	public static final String SP_GET_PENDING_PRODUCTS = "{call sp_Admin_Action_Pending_Products_Get()}";
	public static final String SP_GET_ALL_PRODUCTS = "{call sp_Admin_Action_All_Products_Get()}";
	public static final String SP_APPROVE_PENDING_PRODUCT = "{call sp_Admin_Action_Approve_Product(?,?)}";
	public static final String SP_REJECT_PENDING_PRODUCT = "{call sp_Admin_Action_Reject_Pending_Product(?,?)}";
	public static final String SP_DELETE_PRODUCT = "{call sp_Admin_Action_Delete_Product(?,?)}";
	public static final String SP_GET_USER_ID = "{call sp_User_ID_Get(?)}";
	public static final String SP_GET_SELLERAPPROVED_PRODUCT = "{call sp_Seller_ApprovedProducts_Get(?)}";
	public static final String SP_SELLER_DELETE_PRODUCT = "{call sp_Seller_Delete_Product(?,?)}"; 
	public static final String SP_INVENTORY_MANAGEMENT_MODIFY_QUANTITY = "{call sp_Inventory_Management_Modify_Quantity(?,?,?,?)}";
	public static final String SP_BRAND_CATEGORY_REFERENCE_DATA = "{call sp_Brand_Category_ReferenceData_Get()}"; 
	public static final String SP_ADD_SELLER_PRODUCT = "{call sp_Inventory_Management_Add_Product(?,?,?,?,?,?,?,?,?)}"; 
	public static final String SP_GET_USER_DETAILS_FOR_LOGIN = "{call sp_User_ID_ROLE_ID_Get(?)}";
	// Constant Methods
	
	public static void sendEmail(String email, String password) throws AddressException, MessagingException 
	{

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
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("vorasagar7@gmail.com"));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("ronak.bharat.parekh@gmail.com"));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("mananpapdiwala92@gmail.com "));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("ethanferminhuang@gmail.com"));
		generateMailMessage.setSubject("Greetings from SpotLightProducts..");
		String emailBody = "Your Email is: "+email+"<br>Your password is: " + password + "<br>" + "<br><br> Regards, <br>Spotlight Team";
		generateMailMessage.setContent(emailBody, "text/html");
		System.out.println("Mail Session has been created successfully..");

		// Step3
		System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");

		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", SpotLightConstants.SPOTLIGHTPRODUCTS_EMAIL_ID, SpotLightConstants.SPOTLIGHTPRODUCTS_EMAIL_PASSWORD);
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}
	
	public static void sendEmailAfterPayment(String email) throws AddressException, MessagingException 
	{

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
		generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("vorasagar7@gmail.com"));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("ronak.bharat.parekh@gmail.com"));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("mananpapdiwala92@gmail.com "));
		generateMailMessage.addRecipient(Message.RecipientType.CC,
				new InternetAddress("ethanferminhuang@gmail.com"));
		generateMailMessage.setSubject("Greetings from SpotLightProducts..");
		String emailBody = "Username: "+email+"<br>Your order has been confirmed :) Thank You for shopping with us" + "<br>" + "<br><br> Regards, <br>Spotlight Team";
		generateMailMessage.setContent(emailBody, "text/html");
		System.out.println("Mail Session has been created successfully..");

		// Step3
		System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");

		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", SpotLightConstants.SPOTLIGHTPRODUCTS_EMAIL_ID, SpotLightConstants.SPOTLIGHTPRODUCTS_EMAIL_PASSWORD);
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}

}
