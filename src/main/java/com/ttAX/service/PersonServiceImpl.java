package com.ttAX.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttAX.dao.UserDAO;
import com.ttAX.model.Users;

@Service
public class PersonServiceImpl implements PersonService {

    private UserDAO userDAO;

    public void setPersonDAO(UserDAO personDAO) {
        this.userDAO = personDAO;
    }

    @Override
    @Transactional
    public void addPerson(Users users) {
        this.userDAO.addPerson(users);
    }

    @Override
    @Transactional
    public void updatePerson(Users users) {
        this.userDAO.updatePerson(users);
    }

    @Override
    @Transactional
    public List<Users> listPersons() {
        return this.userDAO.listPersons();
    }

    @Override
    @Transactional
    public Users getPersonById(int id) {
        return this.userDAO.getPersonById(id);
    }

    @Override
    @Transactional
    public void removePerson(int id) {
        this.userDAO.removePerson(id);
    }

}
