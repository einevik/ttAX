package com.ttAX.service;

import java.util.List;

import com.ttAX.model.Users;

public interface PersonService {

    public void addPerson(Users users);
    public void updatePerson(Users users);
    public List<Users> listPersons();
    public Users getPersonById(int id);
    public void removePerson(int id);

}
