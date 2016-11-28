package com.spotlightproducts.businesslibrary;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
					productObj.setProductId(rs.getInt(1));
					productObj.setSelledId(rs.getInt(2));
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

}
