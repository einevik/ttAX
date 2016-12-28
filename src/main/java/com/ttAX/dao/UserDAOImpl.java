package com.ttAX.dao;


import java.util.List;

import org.hibernate.ReplicationMode;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ttAX.model.Users;
import com.ttAX.model.HibernateSessionFactory;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

    @Override
    public void addUser (Users users) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(users);
        session.getTransaction().commit();
        session.close();
        logger.info("Users saved successfully, Users Details="+users);
    }

    @Override
    public void regUser (Users users) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(users);
        session.getTransaction().commit();
        session.close();
//        logger.info("Users saved successfully, Users Details="+users);
    }

    @Override
    public void updateUser(Users users) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(users);
        session.getTransaction().commit();
        session.close();
        logger.info("Users updated successfully, Users Details="+users);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Users> listUsers() {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Users> UsersList = session.createQuery("from Users").list();
        for(Users users: UsersList){
            logger.info("Users List::"+users);
        }
        return UsersList;
    }

    @Override
    public Users getUserByLogin(String login) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        List<Users> usersList = session.createQuery("from Users where login=?").setParameter(0,login).list();
        session.getTransaction().commit();
        session.close();
        if (usersList.size() > 0) {
            return usersList.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Users getUserById(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Users users= (Users) session.load(Users.class, new Integer(id));
        logger.info("Users loaded successfully, Users details="+users);
        return users;
    }

    @Override
    public void removeUser(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Users users = (Users) session.load(Users.class, new Integer(id));
        if(null != users){
            session.beginTransaction();
            session.delete(users);
            session.getTransaction().commit();
            session.close();
        }
        logger.info("Users deleted successfully, Users details="+users);
    }
}
