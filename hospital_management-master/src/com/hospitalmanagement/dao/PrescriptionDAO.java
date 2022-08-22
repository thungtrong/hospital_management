package com.hospitalmanagement.dao;

import com.hospitalmanagement.model.Prescription;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class PrescriptionDAO {
    SessionFactory sf;
    Session ss;
    Transaction ts;
    Criteria criteria= null;
    @SuppressWarnings("unchecked")
    public List<Prescription> list(){
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            criteria = ss.createCriteria(Prescription.class);
            criteria.addOrder(Order.asc("id"));
            List<Prescription> list = criteria.list();
            ts.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public Prescription find(int id) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            Prescription prescription = (Prescription) ss.get(Prescription.class, id);
            ts.commit();
            return prescription;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updatePrescriptionById(Prescription prescription) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.update(prescription);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(Prescription prescription) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.delete(prescription);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
