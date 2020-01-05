package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.news;

public interface newsDao {

	news findById(Integer id);

	List<news> findAll();

	List<news> findAllDuyet();

	List<news> findAllChuaDuyet();

	news create(news entity);

	void update(news entity);

	news delete(Integer id);

	List<news> findAllbyusername(String username);

	List<news> findAllbyusernamefalse(String username);

	List<news> findAllbyusernametrue(String username);

	void getListNewsUpdate(Integer id, Integer value);

	news getTinHot();

	void update_TinHot();
	
	List<news> getlistType();
}