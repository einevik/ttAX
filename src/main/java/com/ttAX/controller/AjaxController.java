package com.ttAX.controller;

import com.ttAX.dao.UserDAOImpl;
import com.ttAX.model.Users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class AjaxController {

    UserDAOImpl userService = new UserDAOImpl();
    Users user = new Users();

    @RequestMapping(value= "/check", method = RequestMethod.POST)
    public void checkUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String login = request.getParameter("login");
            user = userService.getUserByLogin(login);
        if (user==null) {
            out.println("<font color=green><b>"+login+"</b> is available");
        }
        else{
            out.println("<font color=red><b>"+login+"</b> is already in use</font>");
        }
        out.println();
        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
    }

}
