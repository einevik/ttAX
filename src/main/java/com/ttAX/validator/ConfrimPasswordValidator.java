package com.ttAX.validator;

import com.ttAX.model.Users;

import org.springframework.stereotype.Component;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


@Component
public class ConfrimPasswordValidator implements ConstraintValidator<Validator, Object> {

    @Override
    public void initialize(Validator constraintAnnotation) {
    }
    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context){
        Users user = (Users) obj;
        return user.getPassword().equals(user.getConfrimpassword());
    }
}
