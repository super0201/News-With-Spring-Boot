package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.type;

public interface typeDao {

	type findById(Integer id);

	List<type> findAll();

	type create(type entity);

	void update(type entity);
}
