package com.ttAX.dao;


import java.util.List;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ttAX.model.Users;
import com.ttAX.model.HibernateSessionFactory;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

//    private SessionFactory sessionFactory;
//    private HibernateSessionFactory hSF = new HibernateSessionFactory();



//    public void setSessionFactory(SessionFactory sessionFactory){
//        this.sessionFactory = hSF.getSessionFactory();
//    }

    @Override
    public void addUser (Users users) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
//        session.persist(users);
        session.save(users);
        session.getTransaction().commit();
        session.close();
        logger.info("Users saved successfully, Users Details="+users);
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
