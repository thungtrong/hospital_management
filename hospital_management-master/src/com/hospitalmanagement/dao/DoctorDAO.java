package com.hospitalmanagement.dao;

import java.util.List;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class DoctorDAO{
	SessionFactory sf;
	Session ss;
	Transaction ts;
	Criteria criteria= null;


	public List<Doctor> list(){
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			criteria = ss.createCriteria(Doctor.class);
			criteria.addOrder(Order.asc("id"));
			List<Doctor> list = criteria.list();
			ts.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Doctor find(int id) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			Doctor doctor = (Doctor) ss.get(Doctor.class, id);
			ts.commit();
			return doctor;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void updateDoctorById(Doctor doctor) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			ss.update(doctor);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(Doctor doctor) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			ss.delete(doctor);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void save(Doctor doctor) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			ss.save(doctor);
			ts.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Doctor> findByName(String name) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			criteria = ss.createCriteria(Doctor.class);
			criteria.add(Restrictions.like("name", name));
			List<Doctor> list = criteria.list();
			ts.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<Doctor> findBySpecialization(String specialization) {
		try {
			sf = HibernateUtil.getSessionFactory();
			ss = sf.openSession();
			ts = ss.beginTransaction();
			criteria = ss.createCriteria(Doctor.class);
			criteria.add(Restrictions.like("specialization", specialization));
			List<Doctor> list = criteria.list();
			ts.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
