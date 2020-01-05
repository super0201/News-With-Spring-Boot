package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.categories;
import com.fpoly.entity.news;

public interface displayDao {

	Integer getViews(Integer id);
	
	public void update(news news);
	
	news getChiTiet(Integer id);
	
	List<news> getTinHot();

	List<news> getTinThuong();

	List<news> getTinMoi();
	
	List<categories> getListDanhMuc();
	
	List<news> getListCategoriesById(Integer id);
	
	List<news> getListSearch(String name);
	
	
}
