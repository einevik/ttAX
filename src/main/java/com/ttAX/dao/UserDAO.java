package com.ttAX.dao;

import java.util.List;
import com.ttAX.model.Users;

public interface UserDAO {

    void addUser(Users users);
    void regUser(Users users);
    void updateUser(Users users);
    List<Users> listUsers();
    Users getUserById(int id);
    void removeUser(int id);

}
