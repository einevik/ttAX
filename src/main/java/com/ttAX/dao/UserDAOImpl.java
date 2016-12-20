package com.ttAX.dao;


import java.util.List;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ttAX.model.Users;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Override
    public void addPerson(Users users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(users);
        logger.info("Users saved successfully, Users Details="+users);
    }

    @Override
    public void updatePerson(Users users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(users);
        logger.info("Users updated successfully, Users Details="+users);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Users> listPersons() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Users> UsersList = session.createQuery("from Users").list();
        for(Users users: UsersList){
            logger.info("Users List::"+users);
        }
        return UsersList;
    }

    @Override
    public Users getPersonById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Users users= (Users) session.load(Users.class, new Integer(id));
        logger.info("Users loaded successfully, Users details="+users);
        return users;
    }

    @Override
    public void removePerson(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Users users= (Users) session.load(Users.class, new Integer(id));
        if(null != users){
            session.delete(users);
        }
        logger.info("Users deleted successfully, Users details="+users);
    }
}
