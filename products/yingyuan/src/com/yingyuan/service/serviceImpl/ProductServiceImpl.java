package com.yingyuan.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yingyuan.dao.ProductDao;
import com.yingyuan.model.Product;
import com.yingyuan.service.ProductService;


@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao movieDao;

	@Override
	public List<Product> selectMovie(Map map) {
		// TODO Auto-generated method stub
		return movieDao.selectMovie(map);
	}



	@Override
	public void insertmovie(Product movie) {
		// TODO Auto-generated method stub
		movieDao.insertmovie(movie);
	}

	@Override
	public void updatemovie(Product movie) {
		// TODO Auto-generated method stub
		movieDao.updatemovie(movie);
	}

	
	@Override
	public Integer selectMovietotal(Map map) {
		// TODO Auto-generated method stub
		return movieDao.selectMovietotal(map);
	}

	
	



	

}
