package com.ttAX.service;

import java.util.List;

import com.ttAX.model.Messages;
import com.ttAX.model.Roles;
import com.ttAX.model.Users;

public interface UserService {

    void addUser(Users users);
    void regUser(Users users, Roles roles);
    void updateUser(Users users);
    void updateRole(Roles roles);
    List<Users> listUsers();
    List<Messages> listMessages();
    List<Messages> listMessagesByLogin(String login);
    List<Messages> sortTable(String query);
    Users getUserById(int id);
    Roles getRoleById(int id);
    Users findLogin(String login);
    void removeUser(int id);
    void removeMessage(int id);
}
