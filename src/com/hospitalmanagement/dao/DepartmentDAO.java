package com.hospitalmanagement.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hospitalmanagement.model.Department;
import com.hospitalmanagement.util.HibernateUtil;

public class DepartmentDAO implements DAO<Department, Integer>{
	private SessionFactory sessionFactory;
	
	public DepartmentDAO() {
		sessionFactory = HibernateUtil.getSessionFactory();
	}

	@Override
	public List<Department> findAll() {
		try {
			Session session = this.sessionFactory.openSession();
			Criteria criteria = session.createCriteria(Department.class);
			List<Department> list = criteria.list();
			
			session.close();
			return list;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	@Override
	public Department findById(Integer id) {
		Department department;
		try {
			Session session = this.sessionFactory.openSession();
			department = (Department) session.get(Department.class, id);
			
			session.close();
			return department;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Department update(Department department) {
		Department model;
		try {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			
			model = (Department) session.get(Department.class, department.getId());
			if (model == null)
			{
				session.close();
				return null;
			}
			department.copyTo(model);
			
			transaction.commit();
			session.close();
			return model;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Department insert(Department department) {
		Session session = null;
		try {
			session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(department);
			transaction.commit();
			session.close();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (session != null)
			{
				session.close();
			}
		}
		
		return department;
	}

	@Override
	public Department save(Department department) {
		if (department.getId() == null)
		{
			return this.insert(department);
		} else 
			return this.update(department);
	}

	@Override
	public int delete(Department department) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			
			Department model = (Department) session.get(Department.class, department.getId());
			if (model == null)
			{
				session.close();
				return 0;
			} 
			session.delete(model);
			
			transaction.commit();
			session.close();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	
}
