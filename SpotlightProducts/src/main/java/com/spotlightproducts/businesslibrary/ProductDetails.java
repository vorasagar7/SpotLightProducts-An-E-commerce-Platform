package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.spotlightproducts.dao.DatabaseResponse;
import com.spotlightproducts.dao.Product;
import com.spotlightproducts.dao.ReferenceData;
import com.spotlightproducts.dao.Review;

public class ProductDetails {

	public DatabaseResponse<Product> getSearchedProduct(Product product) {
		DatabaseResponse response = new DatabaseResponse();
		String searchQuery = product.getSearchQuery();
		List<Product> productList = new ArrayList<Product>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_SearchedProducts_Get(?)}");
			cStmt.setString(1, searchQuery);
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					Product productObj = new Product();
					productObj.setProductId(rs.getInt(1));
					productObj.setProductName(rs.getString(2));
					productObj.setModelId(rs.getString(3));
					productObj.setBrandName(rs.getString(4));
					productObj.setCategoryName(rs.getString(5));
					productObj.setSellerName(rs.getString(6));
					productObj.setDescription(rs.getString(7));
					productObj.setPrice(rs.getDouble(8));
					productObj.setQuantity(rs.getInt(9));
					productList.add(productObj);

				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
			response.setStatus("Success");
			response.setMessage("");
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		response.setData(productList);
		return response;

	}

	public DatabaseResponse<Product> getProductById(int productId) {
		DatabaseResponse response = new DatabaseResponse();
		List<Product> productList = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_Product_Detail_Get(?)}");
			cStmt.setInt(1, productId);
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			Product productObj = new Product();
			List<Review> reviewList = new ArrayList<Review>(); //list of all the reviews for a particular product
			
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					productObj.setSellerId(rs.getInt(1));
					productObj.setProductId(rs.getInt(2));
					productObj.setProductName(rs.getString(3));
					productObj.setModelId(rs.getString(4));
					productObj.setBrandName(rs.getString(5));
					productObj.setCategoryName(rs.getString(6));
					productObj.setDescription(rs.getString(7));
					productObj.setIsSpotlight(rs.getInt(8));
					productObj.setSellerName(rs.getString(9));
					productObj.setPrice(rs.getDouble(10));
					productObj.setQuantity(rs.getInt(11));
				}
				hadResults = cStmt.getMoreResults();
			}
			
			
			CallableStatement cStmt2 = (CallableStatement) con.prepareCall("{call sp_Product_Review_Get(?)}");
			cStmt2.setInt(1, productId);
			boolean hadResults2 = cStmt2.execute();
			System.out.println("hadResults" + hadResults2);
			while (hadResults2) {
				ResultSet rs = (ResultSet) cStmt2.getResultSet();
				while (rs.next()) {
					Review productReview = new Review();
					productReview.setReviewId(rs.getInt(1));
					productReview.setUsername(rs.getString(2));
					productReview.setComment(rs.getString(3));
					productReview.setRating(rs.getInt(4));
					productReview.setModifiedOn(rs.getDate(5));
					reviewList.add(productReview);

				}
				hadResults2 = cStmt.getMoreResults();
			}
			productObj.setProductReviews(reviewList);
			
			productList.add(productObj);
			
			con.close();
			response.setStatus("Success");
			response.setMessage("");
			response.setData(productList);
			return response;
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		response.setData(productList);
		return response;

	}

	/* 
	 * To save the User Review
	 * 
	 * */
	public DatabaseResponse storeUserReview(Product prodObj, HttpServletRequest request) {
		DatabaseResponse response = new DatabaseResponse();
		try {
			
			HttpSession session = request.getSession();
			System.out.println("This is my email"+session.getAttribute("email"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts",
					"admin", "admin");
			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call sp_User_Review_Store(?,?,?,?)}");
			int productId = prodObj.getProductId();
			Review review = prodObj.getProductReviews().get(0);
			String comments = review.getComment();
			int rating = review.getRating();
			String email = (String)session.getAttribute("email");
			cStmt.setInt(1, productId);
			cStmt.setString(2, comments);
			cStmt.setInt(3, rating);
			cStmt.setString(4, email);
			boolean hadResults = cStmt.execute();
			System.out.println("hadResults" + hadResults);
			while (hadResults) {
				ResultSet rs = (ResultSet) cStmt.getResultSet();
				while (rs.next()) {
					int resultType = rs.getInt(1);
					if(resultType == 1)
					{
						con.close();
						response.setStatus("Success");
						response.setMessage("User Review Successfully Saved");
						return response;
					}
				}
				hadResults = cStmt.getMoreResults();
			} // End of While
		
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		response.setStatus("Failure");
		response.setMessage("Technical Error");
		return response;

	}

}
