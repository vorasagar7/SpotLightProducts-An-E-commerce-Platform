package com.spotlightproducts.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spotlightproducts.dao.*;
import com.spotlightproducts.controllers.*;;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/search", method=RequestMethod.POST)
	public String searchProducts(@RequestParam String searchQuery, ModelMap model){
		
		ArrayList<Product> productList = searchService.getProductList(searchQuery);
		
		model.addAttribute(productList);
		
		model.put("productList",productList);
		
		System.out.println("Seach Query is: "+searchQuery);
		return "/SearchPageViews/search-result";
		
	}	
	
	@RequestMapping(value = "/filterByElectronics", method=RequestMethod.GET)
	public String filterByElectronics(ModelMap model){
		
		ArrayList<Product> productList = searchService.getProductList("Mobile");
		
		model.addAttribute(productList);
		
		model.put("productList",productList);
		return "/CategoryViews/Electronics";
		
	}	
	
	
}
