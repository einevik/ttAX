package com.ttAX.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.ttAX.model.Users;
import com.ttAX.model.Roles;
import com.ttAX.service.UserService;




@Controller
public class UserController {

    private UserService userService;
    private final String loginMessage = "Login already exist";

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
    public String addUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult,HttpServletRequest request, Model model){
        if (u.getLogin().isEmpty()){
            return "user";
        }
        if( bindingResult.hasErrors()) {
            if (userService.findLogin(u.getLogin())!=null){
                request.setAttribute("message", loginMessage);
            }
            return "user";
        }
        if (userService.findLogin(u.getLogin())!=null){
            request.setAttribute("message", loginMessage);
            return "user";
        }

        Roles r = new Roles();
        r.setLogin(u.getLogin());
        r.setRole("user");
        u.setEnabled(true);
        this.userService.regUser(u,r);
        return "redirect:/users";
    }


    @RequestMapping(value= "/user/edit", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult,HttpServletRequest request, Model model){
        model.addAttribute("listUsers", this.userService.listUsers());
        if(bindingResult.hasErrors()) {
            return "user";
        }
        this.userService.updateUser(u);
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
    public String regUser(@ModelAttribute("user") @Valid Users u, BindingResult bindingResult, HttpServletRequest request){
        if (u.getLogin().isEmpty()){
            return "registerPage";
        }
        if( bindingResult.hasErrors()) {
            if (userService.findLogin(u.getLogin())!=null){
                request.setAttribute("message", loginMessage);
            }
            return "registerPage";
        }
        if (userService.findLogin(u.getLogin())!=null){
            request.setAttribute("message", loginMessage);
            return "registerPage";
        }

        Roles r = new Roles();
        r.setLogin(u.getLogin());
        r.setRole("user");
        u.setEnabled(true);
        this.userService.regUser(u,r);
        return "redirect:/login";
    }

    @RequestMapping(value = "/registrationPage", method = RequestMethod.GET)
    public String registerPage(Model model) {
        model.addAttribute("user", new Users());
        return "registerPage";
    }

}
