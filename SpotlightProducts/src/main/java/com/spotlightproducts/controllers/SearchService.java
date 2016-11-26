package com.spotlightproducts.controllers;
import org.springframework.stereotype.Service;
import java.sql.*;
import com.spotlightproducts.dao.*;

import java.util.ArrayList;
import java.util.List;


@Service
public class SearchService {

	public ArrayList<Product> getProductList(String searchQuery) {
		
		ArrayList<Product> productList = new ArrayList<Product>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spotlightproducts", "admin",
					"admin");
			CallableStatement cStmt = con.prepareCall("{call sp_SearchedProducts_Get(?)}");
			cStmt.setString(1, searchQuery);
			boolean hadResults = cStmt.execute();
			while (hadResults) {
				ResultSet rs = cStmt.getResultSet();
				while (rs.next()) {
					// retrieve values of fields
					System.out.println(
							rs.getInt(1) + "\t" + rs.getString(2) + "\t\t" + rs.getString(3) + "\t" + rs.getString(4) + "\t" + rs.getString(5) + "\t" + rs.getString(6) + "\t" + rs.getString(7) + "\t" + rs.getFloat(8) + "\t" + rs.getInt(9));
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
						
						productList.add(product);
//					
				}
				hadResults = cStmt.getMoreResults();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return productList;
	}

}
