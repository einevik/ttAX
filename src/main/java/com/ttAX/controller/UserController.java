package com.ttAX.controller;

import com.sun.xml.internal.ws.developer.SchemaValidation;
import com.ttAX.validator.Unique;
import com.ttAX.validator.UniqueValidator;
import jdk.nashorn.internal.ir.annotations.Ignore;
import net.bytebuddy.implementation.bind.annotation.IgnoreForBinding;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ttAX.model.Users;
import com.ttAX.service.UserService;

import javax.inject.Singleton;
import javax.persistence.ExcludeDefaultListeners;
import javax.persistence.PostUpdate;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Enumeration;

@Controller
public class UserController {

    private UserService userService;

    @Autowired(required=true)
    @Qualifier(value = "userService")
    public void setUserService(UserService us){
        this.userService = us;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("user", new Users());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "user";
    }

    @RequestMapping(value= "/user/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult, Model model){
        model.addAttribute("listUsers", this.userService.listUsers());
        if(bindingResult.hasErrors()) {
            return "user";
        }else {
                this.userService.addUser(u);
        }
        return "redirect:/users";
    }


    @RequestMapping(value= "/user/edit", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult, Model model){
        model.addAttribute("listUsers", this.userService.listUsers());
        if(bindingResult.hasErrors()) {
            return "user";
        }else {
            this.userService.updateUser(u);
        }
        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping("/edit/{id}")
    public String editUserPage(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "user";
    }

    @RequestMapping(value= "/regUser", method = RequestMethod.POST)
    public String regUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult){
        if(bindingResult.hasErrors()) {
            return "registerPage";
        }
        this.userService.regUser(u);
        return "redirect:/login";
    }

    @RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
    public String registerPage(Model model) {
        model.addAttribute("user", new Users());
        return "registerPage";
    }


}
