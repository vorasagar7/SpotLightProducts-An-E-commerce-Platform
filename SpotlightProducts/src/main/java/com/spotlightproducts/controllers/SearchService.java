package com.spotlightproducts.controllers;
import org.springframework.stereotype.Service;
import java.sql.*;

import com.spotlightproducts.businesslibrary.DatabaseConnection;
import com.spotlightproducts.dao.*;

import java.util.ArrayList;
import java.util.List;


@Service
public class SearchService {

	public ArrayList<Product> getProductList(String searchQuery) {
		
		ArrayList<Product> productList = new ArrayList<Product>();

		try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = con.prepareCall("{call sp_SearchedProducts_Get(?)}");
			cStmt.setString(1, searchQuery);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = cStmt.getResultSet();
				while (rs.next()) {
					// retrieve values of fields
					
						Product product = new Product();
						
						product.setProductId(rs.getInt(1));
						product.setProductName(rs.getString(2));
						product.setModelId(rs.getString(3));
						product.setBrandName(rs.getString(4));
						product.setCategoryName(rs.getString(5));
						product.setSellerName(rs.getString(6));
						product.setDescription(rs.getString(7));
						product.setPrice(rs.getFloat(8));
						product.setQuantity(rs.getInt(9));
						product.setReviewCount(getProductReviewCount(product.getProductId()));
						productList.add(product);
					
				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return productList;
	}
	
public int getProductReviewCount(int productID) {
		
	int reviewCount=0;	
	try {
			
			Connection con = DatabaseConnection.getDatabaseConnection();
			CallableStatement cStmt = con.prepareCall("{call sp_Product_Review_Count_Get(?)}");
			cStmt.setInt(1, productID);
			
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = cStmt.getResultSet();
				while (rs.next()) {
					// retrieve values of fields
					reviewCount = rs.getInt(1);
					
				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reviewCount;
	}

}
