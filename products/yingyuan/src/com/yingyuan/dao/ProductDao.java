package com.yingyuan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


import com.yingyuan.model.Product;


@Repository("productDao")
public interface ProductDao {
	List<Product> selectMovie(Map map);
	
	
	
	
	
	void insertmovie(Product movie);
	
	void updatemovie(Product movie);
	
	
	Integer selectMovietotal(Map map);
	
	
	
	
	
}
