package com.ttAX.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    private static final String mPage = "mainPage";
    private static final String rPage = "registrPage";
    private static final String lPage = "loginPage";
    private static final String aPage = "adminPage";

    @RequestMapping(value = "/home")
    public String openMainPage() {
        return mPage;
    }

    @RequestMapping(value = "/registration")
    public String openRegistrPage() {
        return rPage;
    }

}
