package com.hospitalmanagement.dao;

import com.hospitalmanagement.model.HealthRecord;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class HealthRecordDAO {
    SessionFactory sf;
    Session ss;
    Transaction ts;
    Criteria criteria= null;
    @SuppressWarnings("unchecked")
    public List<HealthRecord> list(){
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            criteria = ss.createCriteria(HealthRecord.class);
            criteria.addOrder(Order.asc("id"));
            List<HealthRecord> list = criteria.list();
            ts.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public HealthRecord find(int id) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            HealthRecord healthRecord = (HealthRecord) ss.get(HealthRecord.class, id);
            ts.commit();
            return healthRecord;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateHealthRecordById(HealthRecord healthRecord) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.update(healthRecord);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(HealthRecord healthRecord) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.delete(healthRecord);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
