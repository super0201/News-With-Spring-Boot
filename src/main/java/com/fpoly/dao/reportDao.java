package com.fpoly.dao;

import java.util.List;

public interface reportDao {
	
	List<Object[]> viewsBycategories();

	List<Object[]> postsBycategories();

	List<Object[]> priceBymember();

	List<Object[]> advertByadvertisement();
}