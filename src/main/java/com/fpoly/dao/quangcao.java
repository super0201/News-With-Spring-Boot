package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.advertisement;
import com.fpoly.entity.categories;
import com.fpoly.entity.position;

public interface quangcao {
	
	List<position> getListPosition();
	
	public advertisement findById(Integer id);
	
	advertisement create(advertisement entity);
	
	advertisement getAdvertisement_trangchu();
	
	advertisement getAdvertisement_trangcon();
	
	advertisement update(advertisement entity);
	
	public advertisement delete(Integer id);
	
	List<advertisement> getListAdvertisementTrue(String username);
	
	List<advertisement> getListAdvertisementFalse(String username);
	
	Integer getTrangchu();
	
	Integer getTrangcon();
	
	
}
