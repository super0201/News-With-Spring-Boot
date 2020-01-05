package com.fpoly.dao;

import java.util.List;
import com.fpoly.entity.advertisement;

public interface advertisementDao {

	advertisement findById(Integer id);
	
	List<advertisement> findAll();
	
	advertisement create(advertisement entity);
	
	void update(advertisement entity);
	
	advertisement delete(Integer id);
	
	List<advertisement> findPositionTRUE();
	
	List<advertisement> findPositionFALSE();
	
}
