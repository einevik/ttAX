package com.ttAX.controller;

import com.ttAX.dao.UserDAOImpl;
import com.ttAX.model.Users;

import com.ttAX.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
//    private UserService userService;
    Users user = new Users();

    @RequestMapping(value= "/checkAJAX", method = RequestMethod.POST)
    public void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String login = request.getParameter("login");
            user = userService.findLogin(login);
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

    @RequestMapping(value= "/changePassword", method = RequestMethod.POST)
    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        try {
            user = userService.findLogin(auth.getName());
            user.setPassword(request.getParameter("newpass"));
            user.setConfrimpassword(request.getParameter("newpass"));
            userService.updateUser(user);
            out.println("<font color=green><b>"+"</b> Password successfully changed");
        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
    }

    @RequestMapping(value= "/checkPassword", method = RequestMethod.POST)
    public void checkPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        try {
            String pass = request.getParameter("password");
            String newPass = request.getParameter("newpass");

            user = userService.findLogin(auth.getName());
            if (!user.getPassword().equals(pass)){
                out.println("<font color=red><b>"+"</b> Passwords do not match");
                return;
            }

            if (pass.equals(newPass)){
                out.println("<font color=red><b>"+"</b> Passwords match");
                return;
            }

        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
    }

    @RequestMapping(value= "/sortItemSender", method = RequestMethod.POST)
    public void sortable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {



        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
    }

}
