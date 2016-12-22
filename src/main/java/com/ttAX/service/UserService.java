package com.ttAX.service;

import java.util.List;

import com.ttAX.model.Users;

public interface UserService {

    void addUser(Users users);
    void regUser(Users users);
    void updateUser(Users users);
    List<Users> listUsers();
    Users getUserById(int id);
    void removeUser(int id);

}
