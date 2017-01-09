package com.ttAX.dao;

import java.util.List;

import com.ttAX.model.*;
import org.hibernate.Session;
import org.osgi.service.useradmin.User;
import org.springframework.stereotype.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger loggerUsers = LoggerFactory.getLogger(Users.class);
    private static final Logger loggerRoles = LoggerFactory.getLogger(Roles.class);
    private static final Logger Messages = LoggerFactory.getLogger(Messages.class);
    private static final Logger Addressbook = LoggerFactory.getLogger(Addressbook.class);

    @Override
    public void addUser (Users users) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(users);
        session.getTransaction().commit();
        session.close();
        loggerUsers.info("addUser saved successfully, Users Details="+users);
    }

    @Override
    public void addUserBook (Addressbook user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
        Addressbook.info("addUserBook saved successfully, User Details="+user);
    }

    @Override
    public void regUser (Users users, Roles roles) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(users);
        session.save(roles);
        session.getTransaction().commit();
        session.close();
        loggerUsers.info("regUser saved successfully, Users Details="+users);
        loggerRoles.info("regUser saved successfully, Roles Details="+roles);
    }

    @Override
    public void updateUser(Users user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        session.close();
        loggerUsers.info("updateUser updated successfully, Users Details="+user);
    }

    @Override
    public void updateRole(Roles role) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(role);
        session.getTransaction().commit();
        session.close();
        loggerRoles.info("updateRole updated successfully, Roles Details="+role);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Users> listUsers() {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Users> UsersList = session.createQuery("from Users").list();
        for(Users users: UsersList){
            loggerUsers.info("Users List::"+users);
        }
        return UsersList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Messages> listMessages() {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Messages> MessagesList = session.createQuery("from Messages").list();
        for(Messages messages: MessagesList){
            Messages.info("listMessages List::"+messages);
        }
        return MessagesList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Messages> listMessagesByLogin(String login) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Messages> MessagesListByLogin = session.createQuery("from Messages where recipient=?").setParameter(0,login).list();
        for(Messages messages: MessagesListByLogin){
            Messages.info("listMessagesByLogin List::"+messages);
        }
        return MessagesListByLogin;
    }

    @Override
    public List<Addressbook> listUserBook(String login) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Addressbook> addressbookList = session.createQuery("from Addressbook where login=?").setParameter(0,login).list();
        for(Addressbook addressbook: addressbookList){
            Addressbook.info("listUserBook List::"+addressbook);
        }
        return addressbookList;
    }

    @Override
    public Users findLogin(String login) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        List<Users> usersList = session.createQuery("from Users where login=?").setParameter(0,login).list();
//        List<Users> usersList = session.createQuery("from Messages order by sender asc").list();
        session.getTransaction().commit();
        session.close();
        if (usersList.size() > 0) {
            loggerUsers.info("findLogin loaded successfully, Users details="+usersList);
            return usersList.get(0);
        } else {
            loggerUsers.info("findLogin loaded successfully, Users details="+usersList);
            return null;
        }
    }

    @Override
    public Users getUserById(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Users users = (Users) session.load(Users.class, new Integer(id));
        loggerUsers.info("getUserById loaded successfully, Users details="+users);
        return users;
    }

    @Override
    public Addressbook getAddressBookById (int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Addressbook addressbook = (Addressbook) session.load(Addressbook.class, new Integer(id));
        Addressbook.info("getAddressBookById loaded successfully, getAddressBookById details="+addressbook);
        return addressbook;
    }

    @Override
    public Roles getRoleById(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Roles roles= (Roles) session.load(Roles.class, new Integer(id));
        loggerRoles.info("getRoleById loaded successfully, getRoleById details="+roles);
        return roles;
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
        loggerUsers.info("removeUser deleted successfully, Users details="+users);
    }

    @Override
    public void removeUserBook(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Addressbook addressbook = (Addressbook) session.load(Addressbook.class, new Integer(id));
        if(null != addressbook){
            session.beginTransaction();
            session.delete(addressbook);
            session.getTransaction().commit();
            session.close();
        }
        Addressbook.info("removeUserBook deleted successfully, Addressbook details="+addressbook);
    }

    @Override
    public void removeMessage(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Messages messages = (Messages) session.load(Messages.class, new Integer(id));
        if(null != messages){
            session.beginTransaction();
            session.delete(messages);
            session.getTransaction().commit();
            session.close();
        }
        Messages.info("removeMessage deleted successfully, Messages details="+messages);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Messages> sortTable(String query) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        List<Messages> messagesList = session.createQuery(query).list();
        for(Messages messages: messagesList){
            Messages.info("sortTable List::"+messages);
        }
        return messagesList;
    }

    @Override
    public void sendMessage (Messages messages) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(messages);
        session.getTransaction().commit();
        session.close();
        Messages.info("sendMessage saved successfully, Messages Details="+messages);
    }
}
