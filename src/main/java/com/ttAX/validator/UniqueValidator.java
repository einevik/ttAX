package com.ttAX.validator;

import com.ttAX.dao.UserDAOImpl;

import com.ttAX.model.Users;

import com.ttAX.service.UserService;
import com.ttAX.service.UserServiceImpl;
import org.springframework.stereotype.Component;

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
        user = userService.findLogin(login);
        if (user == null) {
            return true;
        }return false;
    }

}
