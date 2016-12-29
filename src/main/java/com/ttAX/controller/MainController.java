package com.ttAX.controller;

import com.ttAX.model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.security.Principal;

@Controller
public class MainController {

    @RequestMapping(value = { "/home" }, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("title", "Главная");
//        model.addAttribute("message", "Главная страница!");
        return "homePage";
    }

    @RequestMapping(value = { "/index" }, method = RequestMethod.GET)
    public String indexPage(Model model) {
        model.addAttribute("user", new Users());
        return "index";
    }

    @RequestMapping(value = { "/addUserAJAX" }, method = RequestMethod.GET)
    public String addUserAJAXPage(Model model) {
        model.addAttribute("user", new Users());
        return "changePaswwordAJAX";
    }

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String adminPage(Model model) {
        return "adminPage";
    }

    @RequestMapping(value = {"/" , "/login"}, method = RequestMethod.GET)
    public String loginPage(Model model ) {
        return "loginPage";
    }

    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public String logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logout");
        return "logoutSuccessfulPage";
    }

    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, Principal principal) {
        // After user login successfully.
        String userName = principal.getName();
        return "userInfoPage";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            model.addAttribute("message", "Текущий пользователь: " + principal.getName() + "<br> У вас нету доступа к этой странице!");
        } else {
            model.addAttribute("msg", "У вас нету доступа к этой странице!");
        }
        return "403Page";
    }

}
