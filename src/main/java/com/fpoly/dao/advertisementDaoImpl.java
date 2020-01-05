package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.advertisement;

@Transactional
@Repository
public class advertisementDaoImpl implements advertisementDao{

	@Autowired
	SessionFactory factory;
	
	/**
	 * findById()
	 * Find advertisement by id
	 * @param id
	 * @return session.find(advertisement.class, id);
	 * @author van-tam
	 */
	@Override
	public advertisement findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(advertisement.class, id);
	}

	/**
	 * findAll()
	 * Get list advertisement
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<advertisement> findAll() {
		String hql = "FROM advertisement";
		Session session = factory.getCurrentSession();
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create advertisement
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public advertisement create(advertisement entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * update advertisement
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public void update(advertisement entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * delete()
	 * Delete advertisement
	 * @param id
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public advertisement delete(Integer id) {
		advertisement entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
	
	/**
	 * findPositionTRUE()
	 * Get list advertisement = TRUE
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<advertisement> findPositionTRUE() {
		String hql = "FROM advertisement WHERE STATUS = 1";
		Session session = factory.getCurrentSession();
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		return query.getResultList();
	}

	/**
	 * findPositionFALSE()
	 * Get list advertisement = FALSE
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<advertisement> findPositionFALSE() {
		String hql = "FROM advertisement WHERE STATUS = 0";
		Session session = factory.getCurrentSession();
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		return query.getResultList();
	}

}
