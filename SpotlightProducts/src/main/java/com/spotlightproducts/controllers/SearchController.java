package com.spotlightproducts.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spotlightproducts.dao.*;
import com.spotlightproducts.SpotlightComparatorNameDesc;
import com.spotlightproducts.SpotlightComparatorPriceAsc;
import com.spotlightproducts.SpotlightComparatorPriceDesc;
import com.spotlightproducts.controllers.*;;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProducts(@RequestParam String searchQuery, ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList(searchQuery);

		model.addAttribute(productList);

		model.put("productList", productList);

		System.out.println("Seach Query is: " + searchQuery);
		return "/SearchPageViews/search-result";

	}

	@RequestMapping(value = "/filterByElectronics", method = RequestMethod.GET)
	public String filterByElectronics(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Electronic");
		model.addAttribute(productList);
		model.put("productList", productList);
		return "/CategoryViews/Electronics";

	}

	@RequestMapping(value = "/filterByMobiles", method = RequestMethod.GET)
	public String filterByMobiles(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Mobile");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}

	@RequestMapping(value = "/sortByMobilesPriceAsc", method = RequestMethod.GET)
	public String sortByMobilesPriceAsc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}
	
	@RequestMapping(value = "/sortByMobilesPriceDesc", method = RequestMethod.GET)
	public String sortByMobilesPriceDesc(ModelMap model) {
		ArrayList<Product> productList = searchService.getProductList("Mobile");

		Collections.sort(productList, new SpotlightComparatorPriceDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}
	
	@RequestMapping(value = "/sortByMobilesNameDesc", method = RequestMethod.GET)
	public String sortByMobilesNameDesc(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Mobile");
		
		Collections.sort(productList, new SpotlightComparatorNameDesc());

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Mobiles";

	}
	
	
	@RequestMapping(value = "/filterByShoes", method = RequestMethod.GET)
	public String filterByFashion(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Shoes");
		// double[] price=new double[productList.size()];
		// for(int size=0; size<productList.size();size++){
		// price[size] = productList.get(0).getPrice();
		// }
		//
		// Collections.sort(productList, new Comparator<Product>() {
		// public int compare(Product p1, Product p2) {
		// return p1.getProductName().compareTo(p2.getProductName());
		// }
		// });
		//

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	@RequestMapping(value = "/sortByShoesName", method = RequestMethod.GET)
	public String sortByShoesName(ModelMap model) {
		System.out.println("Sort BY SHoes");
		ArrayList<Product> productList = searchService.getProductList("Shoes");
		// double[] price=new double[productList.size()];
		// for(int size=0; size<productList.size();size++){
		// price[size] = productList.get(0).getPrice();
		// }
		//
		Collections.sort(productList, new Comparator<Product>() {
			public int compare(Product p1, Product p2) {
				return p1.getProductName().compareTo(p2.getProductName());
			}
		});

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Shoes";

	}

	@RequestMapping(value = "/sortByShoesPrice", method = RequestMethod.GET)
	public String sortByShoesPrice(ModelMap model) {
		System.out.println("Sort BY SHoes");
		ArrayList<Product> productList = searchService.getProductList("Shoes");

		Collections.sort(productList, new SpotlightComparatorPriceAsc());

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

	@RequestMapping(value = "/filterByBooks", method = RequestMethod.GET)
	public String filterByBooks(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Books");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/Books";

	}

	@RequestMapping(value = "/filterBySpotlightProducts", method = RequestMethod.GET)
	public String filterBySpotlightProducts(ModelMap model) {

		ArrayList<Product> productList = searchService.getProductList("Spotlight");

		model.addAttribute(productList);

		model.put("productList", productList);
		return "/CategoryViews/SpotlightProducts";

	}

}
