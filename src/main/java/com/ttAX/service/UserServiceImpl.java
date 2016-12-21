package com.ttAX.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttAX.dao.UserDAO;
import com.ttAX.model.Users;

@Service
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    @Transactional
    public void addUser(Users users) {
        this.userDAO.addUser(users);
    }

    @Override
    @Transactional
    public void updateUser(Users users) {
        this.userDAO.updateUser(users);
    }

    @Override
    @Transactional
    public List<Users> listUsers() {
        return this.userDAO.listUsers();
    }

    @Override
    @Transactional
    public Users getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }

}
