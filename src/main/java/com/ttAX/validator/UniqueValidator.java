package com.ttAX.validator;

import com.ttAX.model.Users;

import com.ttAX.service.UserServiceImpl;
import org.springframework.stereotype.Component;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


@Component
public class UniqueValidator implements ConstraintValidator<Validator, String> {

    private UserServiceImpl userService = new UserServiceImpl();
    private Users user = new Users();

    @Override
    public void initialize(Validator validator) {
    }

    @Override
    public boolean isValid(String login, ConstraintValidatorContext context) {
        user = userService.findLogin(login);
        if (user == null) {
            return true;
        }return false;
    }

}
