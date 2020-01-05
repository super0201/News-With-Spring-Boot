package com.fpoly.dao;

import java.util.List;

import com.fpoly.entity.member;

public interface memberDao {

	member findById(String id);

	List<member> findAll();

	member create(member entity);

	void update(member entity);

	List<member> findRoleND();

	List<member> findRolePV();

	List<member> findRoleNQC();
}
