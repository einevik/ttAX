package com.ttAX.dao;

import java.util.List;

import com.ttAX.entity.HibernateSessionFactory;
import com.ttAX.model.User;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

    Session session = HibernateSessionFactory.getSessionFactory().openSession();
//    session.beginTransaction();

    @Override
    public List<User> list() {

        return null;
    }
}
