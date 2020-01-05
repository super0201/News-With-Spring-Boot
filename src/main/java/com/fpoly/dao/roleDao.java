package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.role;

public interface roleDao {

	role findById(Integer id);

	role findById(String id);

	List<role> findAll();

	role create(role entity);

	void update(role entity);
}
