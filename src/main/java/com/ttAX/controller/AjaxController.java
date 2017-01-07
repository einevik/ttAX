package com.ttAX.controller;

import com.ttAX.dao.UserDAOImpl;
import com.ttAX.model.Addressbook;
import com.ttAX.model.Users;

import com.ttAX.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class AjaxController {

    private UserDAOImpl userDAOImpl = new UserDAOImpl();
    private Users user = new Users();

    private UserService userService;

    @Autowired(required=true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService){
        this.userService = userService;
    }

    @RequestMapping(value= "/checkAJAX", method = RequestMethod.POST)
    public void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Addressbook addressbook = new Addressbook();

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String login = auth.getName();
            String recipient = request.getParameter("login");
            user = userService.findLogin(recipient);
//            addressbook = userService.findUserBook(login,recipient);
            if (user==null) {
                out.println("<font color=red>not found</font>");
//            }else if (addressbook!=null){
//                out.println("<font color=red>contact already</font>");
                } else {
                out.println("<font color=green>added</font>");
                addressbook.setLogin(login);
                addressbook.setRecipient(recipient);
                userDAOImpl.addUserBook(addressbook);
            }
            out.println();

        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
    }

    @RequestMapping(value= "/AddressBook", method = RequestMethod.POST)
    public void addressBook(HttpServletRequest request, HttpServletResponse response, Addressbook addressbook, Model model) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        model.addAttribute("addressBook", new Addressbook());

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String login = auth.getName();
            model.addAttribute("listAddressBook", this.userService.listUserBook(login));

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
            user = userDAOImpl.findLogin(auth.getName());
            user.setPassword(request.getParameter("newpass"));
            user.setConfrimpassword(request.getParameter("newpass"));
            userDAOImpl.updateUser(user);
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

            user = userDAOImpl.findLogin(auth.getName());
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

}
