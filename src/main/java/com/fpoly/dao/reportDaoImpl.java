package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class reportDaoImpl implements reportDao {
	@Autowired
	SessionFactory factory;

	/**
	 * viewsBycategories()
	 * Get the list of views by categories
	 * @param null
	 * @return list
	 * @author hong-cong
	 */
	@Override
	public List<Object[]> viewsBycategories() {
		String hql = "SELECT n.categories.categoriesName," + " SUM(n.views)," + " MIN(n.views)," + " MAX(n.views)"
				+ " FROM news n" + " GROUP BY n.categories.categoriesName";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	/**
	 * postsBycategories()
	 * Get the list of posts by categories
	 * @param null
	 * @return list
	 * @author hong-cong
	 */
	@Override
	public List<Object[]> postsBycategories() {
		String hql = "SELECT n.categories.categoriesName," + " SUM(case when status = true then 1 else 0 end),"
				+ " MIN(case when status = true then 1 else 0 end)," + " MAX(case when status = true then 1 else 0 end)"
				+ " FROM news n" + " GROUP BY n.categories.categoriesName";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	/**
	 * priceBymember()
	 * Get list username by views
	 * @param null
	 * @return list
	 * @author hong-cong
	 */
	@Override
	public List<Object[]> priceBymember() {
		String hql = "SELECT n.member.fullName," + " SUM(n.views)," + " SUM(n.views) *500" + " FROM news n"
				+ " WHERE roleId = 2" + " GROUP BY n.member.fullName";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	/**
	 * priceBymember()
	 * Get the list of username by advertisement
	 * @param null
	 * @return list
	 * @author hong-cong
	 */
	@Override
	public List<Object[]> advertByadvertisement() {
		String hql = "SELECT a.member.fullName," + " SUM(case when status = true then 1 else 0 end),"
				+ " SUM(case when positionId = 1 then (a.amount * 10000) else (a.amount * 5000) end)"
				+ " FROM advertisement a" + " GROUP BY a.member.fullName";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}
}
