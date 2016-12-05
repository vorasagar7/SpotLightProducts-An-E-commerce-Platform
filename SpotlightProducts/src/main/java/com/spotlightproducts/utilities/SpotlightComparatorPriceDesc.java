package com.spotlightproducts.utilities;

import java.util.Comparator;

import com.spotlightproducts.dao.Product;

public class SpotlightComparatorPriceDesc implements Comparator{

	//method to sort the product price from high to low
	@Override
	public int compare(Object obj1, Object obj2) {
		// TODO Auto-generated method stub
		Product p1 = (Product)obj1;
		Product p2 = (Product)obj2;
	double price1=p1.getPrice();
	double price2 = p2.getPrice();
	if(price1<price2){
		return 1;
	}
	else{
		return -1;
	}

	}
	
	
}
