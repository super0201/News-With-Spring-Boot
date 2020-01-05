package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.position;

public interface positionDao {

	position findById(Integer id);

	List<position> findAll();

	position create(position entity);

	void update(position entity);

	position delete(Integer id);
}
