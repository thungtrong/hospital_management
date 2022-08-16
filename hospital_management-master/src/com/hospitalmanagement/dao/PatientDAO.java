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
		Criteria criteria= null;
	    @SuppressWarnings("unchecked")
		public List<Patient> list(){
	    	 sf = HibernateUtil.getSessionFactory();
	    	Session ss= sf.openSession();
	    	 criteria = ss.createCriteria(Patient.class);
	    	criteria.addOrder(Order.asc("id"));
	    	return criteria.list();
		}
		public Patient find(int id) {
			 sf = HibernateUtil.getSessionFactory();
			Session ss = sf.openSession();
			Patient patient = (Patient) ss.get(Patient.class, id);
			return patient;
		}
		public void updatePatientById(Patient patient) {
			sf = HibernateUtil.getSessionFactory();
			Session ss = sf.openSession();
			Transaction ts = ss.beginTransaction();
			ss.update(patient);
			ts.commit();
			ss.close();
		}
		public void delete(Patient patient) {
			sf = HibernateUtil.getSessionFactory();
			Session ss = sf.openSession();
			Transaction tn = ss.beginTransaction();
			ss.delete(patient);
			tn.commit();
			ss.close();
		}
	}


