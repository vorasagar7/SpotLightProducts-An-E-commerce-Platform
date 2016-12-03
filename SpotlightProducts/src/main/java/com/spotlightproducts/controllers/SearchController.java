package com.spotlightproducts.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spotlightproducts.dao.*;
import com.spotlightproducts.utilities.SpotlightComparatorNameAsc;
import com.spotlightproducts.utilities.SpotlightComparatorNameDesc;
import com.spotlightproducts.utilities.SpotlightComparatorPriceAsc;
import com.spotlightproducts.utilities.SpotlightComparatorPriceDesc;
import com.spotlightproducts.*;
import com.spotlightproducts.controllers.*;;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProducts(@RequestParam String searchQuery, ModelMap model, HttpServletRequest request) {

		ArrayList<Product> productList = searchService.getProductList(searchQuery);

		model.addAttribute(productList);
		
		HttpSession session = request.getSession();
		session.setAttribute("searchQuery", searchQuery);

		model.put("productList", productList);
		System.out.println("Seach Query is: " + searchQuery);
		return "/SearchPageViews/search-result";

	}
	
	@RequestMapping(value = "/sortByPriceAsc", method = RequestMethod.GET)
	public String sortByPriceAsc(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String searchQuery = (String)session.getAttribute("searchQuery");
		
		System.out.println("SearchQuery is "+searchQuery);
		ArrayList<Product> productList = searchService.getProductList(searchQuery);
		
		Collections.sort(productList, new SpotlightComparatorPriceAsc());
		model.addAttribute(productList);

		model.put("productList", productList);
		return "/SearchPageViews/search-result";

	}
	
	@RequestMapping(value = "/sortByPriceDesc", method = RequestMethod.GET)
	public String sortByPriceDesc(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String searchQuery = (String)session.getAttribute("searchQuery");
		
		ArrayList<Product> productList = searchService.getProductList(searchQuery);
		
		Collections.sort(productList, new SpotlightComparatorPriceDesc());
		model.addAttribute(productList);

		model.put("productList", productList);
		return "/SearchPageViews/search-result";

	}
	
	@RequestMapping(value = "/sortByNameAsc", method = RequestMethod.GET)
	public String sortByNameAsc(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String searchQuery = (String)session.getAttribute("searchQuery");
		
		ArrayList<Product> productList = searchService.getProductList(searchQuery);
		
		Collections.sort(productList, new SpotlightComparatorNameAsc());
		model.addAttribute(productList);

		model.put("productList", productList);
		return "/SearchPageViews/search-result";

	}

	@RequestMapping(value = "/sortByNameDesc", method = RequestMethod.GET)
	public String sortByNameDesc(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String searchQuery = (String)session.getAttribute("searchQuery");
		
		ArrayList<Product> productList = searchService.getProductList(searchQuery);
		
		Collections.sort(productList, new SpotlightComparatorNameDesc());
		model.addAttribute(productList);

		model.put("productList", productList);
		return "/SearchPageViews/search-result";

	}

	
	
	
	

	@RequestMapping(value = "/filterByElectronics", method = RequestMethod.GET)
	public String filterByElectronics(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Electronic");
		model.addAttribute(productList);
		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}
	
	// controller for sorting and displaying Mobile prices in the ascending

	@RequestMapping(value = "/sortByElectronicsPriceAsc", method = RequestMethod.GET)
	public String sortByElectronicsPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Electronic");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}

	// controller for sorting and displaying Mobile prices in the descending

	@RequestMapping(value = "/sortByElectronicsPriceDesc", method = RequestMethod.GET)
	public String sortByElectronicsPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Electronic");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}

	// controller for sorting and displaying Mobile Names in the descending
	// order

	@RequestMapping(value = "/sortByElectronicsNameDesc", method = RequestMethod.GET)
	public String sortByElectronicsNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Electronic");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}

	// controller for sorting and displaying Mobile Names in the ascending order

	@RequestMapping(value = "/sortByElectronicsNameAsc", method = RequestMethod.GET)
	public String sortByElectronicsNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Electronic");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}


	// filter for Displaying Mobile Category

	@RequestMapping(value = "/filterByMobiles", method = RequestMethod.GET)
	public String filterByMobiles(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Mobile");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	// controller for sorting and displaying Mobile prices in the ascending

	@RequestMapping(value = "/sortByMobilesPriceAsc", method = RequestMethod.GET)
	public String sortByMobilesPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	// controller for sorting and displaying Mobile prices in the descending
	// order

	@RequestMapping(value = "/sortByMobilesPriceDesc", method = RequestMethod.GET)
	public String sortByMobilesPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	// controller for sorting and displaying Mobile Names in the descending
	// order

	@RequestMapping(value = "/sortByMobilesNameDesc", method = RequestMethod.GET)
	public String sortByMobilesNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	// controller for sorting and displaying Mobile Names in the ascending order

	@RequestMapping(value = "/sortByMobilesNameAsc", method = RequestMethod.GET)
	public String sortByMobilesNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	@RequestMapping(value = "/filterByShoes", method = RequestMethod.GET)
	public String filterByShoes(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Shoes");
		model.addAttribute(productList);
		model.put("productList", productList);
		return "/CategoryViews/Shoes";
	}

	// controller for sorting and displaying Shoes prices in the ascending order

	@RequestMapping(value = "/sortByShoesPriceAsc", method = RequestMethod.GET)
	public String sortByShoesPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Shoe");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	// controller for sorting and displaying Shoes prices in the descending

	@RequestMapping(value = "/sortByShoesPriceDesc", method = RequestMethod.GET)
	public String sortByShoesPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Shoe");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	// controller for sorting and displaying Shoes Names in the descending order

	@RequestMapping(value = "/sortByShoesNameDesc", method = RequestMethod.GET)
	public String sortByShoesNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Shoe");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	// controller for sorting and displaying Shoes Names in the ascending order

	@RequestMapping(value = "/sortByShoesNameAsc", method = RequestMethod.GET)
	public String sortByShoesNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Shoe");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	@RequestMapping(value = "/filterByWatches", method = RequestMethod.GET)
	public String filterByWatches(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("watch");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Watches";

	}

	// controller for sorting and displaying Watches prices in the ascending
	// order

	@RequestMapping(value = "/sortByWatchesPriceAsc", method = RequestMethod.GET)
	public String sortByWatchesPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Watch");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Watches";

	}

	// controller for sorting and displaying Watches prices in the descending
	// order

	@RequestMapping(value = "/sortByWatchesPriceDesc", method = RequestMethod.GET)
	public String sortByWatchesPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Watch");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Watches";

	}

	// controller for sorting and displaying Watches Names in the descending
	// order

	@RequestMapping(value = "/sortByWatchesNameDesc", method = RequestMethod.GET)
	public String sortByWatchesNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Watch");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Watches";

	}

	// controller for sorting and displaying Watches Names in the ascending
	// order

	@RequestMapping(value = "/sortByWatchesNameAsc", method = RequestMethod.GET)
	public String sortByWatchesNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Watch");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Watches";

	}

	@RequestMapping(value = "/filterByBooks", method = RequestMethod.GET)
	public String filterByBooks(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Books");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}
	
	// controller for sorting and displaying Books prices in the ascending

	@RequestMapping(value = "/sortByBooksPriceAsc", method = RequestMethod.GET)
	public String sortByBooksPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Books");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}

	// controller for sorting and displaying Books prices in the descending
	// order

	@RequestMapping(value = "/sortByBooksPriceDesc", method = RequestMethod.GET)
	public String sortByBooksPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Books");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}

	// controller for sorting and displaying Books Names in the descending
	// order

	@RequestMapping(value = "/sortByBooksNameDesc", method = RequestMethod.GET)
	public String sortByBooksNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Books");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}

	// controller for sorting and displaying Books Names in the ascending order

	@RequestMapping(value = "/sortByBooksNameAsc", method = RequestMethod.GET)
	public String sortByBooksNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Books");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}

	//filter to search and display Spotlight Products

	@RequestMapping(value = "/filterBySpotlightProducts", method = RequestMethod.GET)
	public String filterBySpotlightProducts(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}
	
	// controller for sorting and displaying SpotlightProducts prices in the ascending

	@RequestMapping(value = "/sortBySpotlightProductsPriceAsc", method = RequestMethod.GET)
	public String sortBySpotlightProductsPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}

	// controller for sorting and displaying SpotlightProducts prices in the descending
	// order

	@RequestMapping(value = "/sortBySpotlightProductsPriceDesc", method = RequestMethod.GET)
	public String sortBySpotlightProductsPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}

	// controller for sorting and displaying SpotlightProducts Names in the descending
	// order

	@RequestMapping(value = "/sortBySpotlightProductsNameDesc", method = RequestMethod.GET)
	public String sortBySpotlightProductsNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}

	// controller for sorting and displaying SpotlightProducts Names in the ascending order

	@RequestMapping(value = "/sortBySpotlightProductsNameAsc", method = RequestMethod.GET)
	public String sortBySpotlightProductsNameAsc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		Collections.sort(productList, new SpotlightComparatorNameAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}


}
