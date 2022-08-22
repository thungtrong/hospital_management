package com.hospitalmanagement.dao;

import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class MedicineDAO {
    SessionFactory sf;
    Session ss;
    Transaction ts;
    Criteria criteria= null;
    @SuppressWarnings("unchecked")
    public List<Medicine> list(){
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            criteria = ss.createCriteria(Medicine.class);
            criteria.addOrder(Order.asc("id"));
            List<Medicine> list = criteria.list();
            ts.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public Medicine find(int id) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            Medicine medicine = (Medicine) ss.get(Medicine.class, id);
            ts.commit();
            return medicine;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateMedicineById(Medicine medicine) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.update(medicine);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(Medicine medicine) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.delete(medicine);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
