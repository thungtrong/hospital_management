package com.hospitalmanagement.dao;

import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class TestDAO {
    SessionFactory sf;
    Session ss;
    Transaction ts;
    Criteria criteria= null;
    @SuppressWarnings("unchecked")
    public List<Test> list(){
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            criteria = ss.createCriteria(Test.class);
            criteria.addOrder(Order.asc("id"));
            List<Test> list = criteria.list();
            ts.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
public Test findById(int id) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            Test test = (Test) ss.get(Test.class, id);
            ts.commit();
            return test;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void updateTestById(Test test) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.update(test);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(Test test) {
        try {
            sf = HibernateUtil.getSessionFactory();
            ss = sf.openSession();
            ts = ss.beginTransaction();
            ss.delete(test);
            ts.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
