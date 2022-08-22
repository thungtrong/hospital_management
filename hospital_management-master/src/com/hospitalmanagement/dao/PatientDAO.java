package com.hospitalmanagement.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.util.HibernateUtil;

public class PatientDAO {
		SessionFactory sf;
		Session ss;
		Transaction ts;
		Criteria criteria= null;
	    @SuppressWarnings("unchecked")
		public List<Patient> list(){
	    	try {
				sf = HibernateUtil.getSessionFactory();
	    		ss = sf.openSession();
	    		ts = ss.beginTransaction();
	    		criteria = ss.createCriteria(Patient.class);
	    		criteria.addOrder(Order.asc("id"));
	    		List<Patient> list = criteria.list();
	    		ts.commit();
	    		return list;
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    		return null;
	    	}
		}
		public Patient find(int id) {
			try {
				sf = HibernateUtil.getSessionFactory();
	    		ss = sf.openSession();
	    		ts = ss.beginTransaction();
	    		Patient patient = (Patient) ss.get(Patient.class, id);
	    		ts.commit();
	    		return patient;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		public void updatePatientById(Patient patient) {
			try {
				sf = HibernateUtil.getSessionFactory();
		    	ss = sf.openSession();
		    	ts = ss.beginTransaction();
		    	ss.update(patient);
		    	ts.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void delete(Patient patient) {
			try {
				sf = HibernateUtil.getSessionFactory();
		    	ss = sf.openSession();
		    	ts = ss.beginTransaction();
		    	ss.delete(patient);
		    	ts.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


