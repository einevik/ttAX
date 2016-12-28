package com.ttAX.validator;

import com.ttAX.dao.UserDAOImpl;

import com.ttAX.model.Users;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import javax.persistence.PostUpdate;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


@Component
public class UniqueValidator implements ConstraintValidator<Unique, String> {

    private UserDAOImpl userService = new UserDAOImpl();
    private Users user = new Users();

    @Override
    public void initialize(Unique unique) {
    }

    @Override
    public boolean isValid(String login, ConstraintValidatorContext context) {
        user = userService.getUserByLogin(login);
        if (user == null) {
            return true;
        }return false;
    }

}
