package com.yingyuan.service;

import java.util.List;
import java.util.Map;

import com.yingyuan.model.Product;


public interface ProductService {
	List<Product> selectMovie(Map map);
	
	
	void insertmovie(Product product);
	
	
	void updatemovie(Product product);
	
	Integer selectMovietotal(Map map);
	
	
	
}
