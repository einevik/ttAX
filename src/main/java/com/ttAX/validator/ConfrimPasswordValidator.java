package com.ttAX.validator;

import com.ttAX.model.Users;

import org.springframework.stereotype.Component;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


@Component
public class ConfrimPasswordValidator implements ConstraintValidator<ConfrimPassword, Users> {

    @Override
    public void initialize(ConfrimPassword constraintAnnotation) {
    }

    @Override
    public boolean isValid(Users user, ConstraintValidatorContext context){
        if (user.getPassword().isEmpty() || user.getConfrimpassword().isEmpty())
            return true;
        return user.getPassword().equals(user.getConfrimpassword());
    }
}
