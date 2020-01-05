package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.categories;
import com.fpoly.entity.news;

public interface categoriesDao {

	public categories findById(Integer id);

	public List<categories> findAll();

	public categories create(categories entity);

	public void update(categories entity);

	public categories delete(Integer id);
	
	public List<news> findCAT(Integer id);
}
