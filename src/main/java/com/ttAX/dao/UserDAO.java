package com.ttAX.dao;

import java.util.List;

import com.ttAX.model.Addressbook;
import com.ttAX.model.Messages;
import com.ttAX.model.Roles;
import com.ttAX.model.Users;

public interface UserDAO {

    void addUser(Users users);
    void addUserBook(Addressbook user);
    void regUser(Users users, Roles roles);
    void updateUser(Users users);
    void updateRole(Roles roles);
    List<Users> listUsers();
    List<Messages> listMessages();
    List<Messages> listMessagesByLogin(String login);
    List<Addressbook> listUserBook(String login);
    List<Messages> sortTable(String query);
    Users findLogin(String login);
    Users getUserById(int id);
    Roles getRoleById(int id);
    void removeUser(int id);
    void removeUserBook(int id);
    void removeMessage(int id);
}
