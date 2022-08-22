package com.hospitalmanagement.dao;

import com.hospitalmanagement.model.Illness;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class IllNessDAO {
    SessionFactory sf;
    Session ss;
    Transaction ts;
    Criteria criteria= null;
    @SuppressWarnings("unchecked")
    public List<Illness> list(){
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            criteria = ss.createCriteria(Illness.class);
            criteria.addOrder(Order.asc("id"));
            List<Illness> list = criteria.list();
            ts.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public Illness find(int id) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            Illness illness = (Illness) ss.get(Illness.class, id);
            ts.commit();
            return illness;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateIllnessById(Illness illness) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.update(illness);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(Illness illness) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.delete(illness);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
