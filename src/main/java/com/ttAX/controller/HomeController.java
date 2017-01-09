package com.ttAX.controller;

import com.ttAX.model.Addressbook;
import com.ttAX.model.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.ttAX.model.Users;
import com.ttAX.model.Roles;
import com.ttAX.service.UserService;




@Controller
public class HomeController {

    private UserService userService;
    private final String loginMessage = "Login already exist";

    @Autowired(required=true)
    @Qualifier(value = "userService")
    public void setUserService(UserService us){
        this.userService = us;
    }

    @RequestMapping(value =  "/home", method = RequestMethod.GET)
    public String welcomePage(Model model, String login, Roles roles, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        login = auth.getName();
        model.addAttribute("title", "Главная");
        model.addAttribute("messages", new Messages());

        if (request.isUserInRole("admin")){
            model.addAttribute("listMessages", this.userService.listMessages());
        }
        if (request.isUserInRole("user")){
            model.addAttribute("listMessages", this.userService.listMessagesByLogin(login));
        }
        return "homePage";
    }

    @RequestMapping(value = "/book", method = RequestMethod.GET)
    public String indexPage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();
        model.addAttribute("addressBook", new Addressbook());
        model.addAttribute("listAddressBook", this.userService.listUserBook(login));
        return "book";
    }


    @RequestMapping(value= "/book/add", method = RequestMethod.POST)
    public String addUserBook(@ModelAttribute("addressBook") @Valid Addressbook addressbook, BindingResult bindingResult,HttpServletRequest request, Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();

        if( bindingResult.hasErrors()) {
            if (userService.findLogin(addressbook.getLogin())!=null){
                request.setAttribute("message", loginMessage);
            }
            model.addAttribute("listAddressBook", this.userService.listUserBook(login));
            return "book";
        }

        addressbook.setLogin(login);
        this.userService.addUserBook(addressbook);

        return "redirect:/book";
    }

    @RequestMapping("/home/remove/{id}")
    public String removeMessages(@PathVariable("id") int id){
        this.userService.removeMessage(id);
        return "redirect:/home";
    }

    @RequestMapping("/book/remove/{id}")
    public String removeUserBook(@PathVariable("id") int id){
        this.userService.removeUserBook(id);
        return "redirect:/book";
    }

    @RequestMapping("/home/sort_sender")
    public String sortSender(Model model, String query, HttpServletRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();

        if (request.isUserInRole("admin")){
            query = "from Messages order by sender asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        if (request.isUserInRole("user")){
            query = "from Messages where recipient='"+login+"' order by sender asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }

        return "homePage";
    }

    @RequestMapping("/home/sort_recipient")
    public String sortRecipient(Model model, String query, HttpServletRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();

        if (request.isUserInRole("admin")){
            query = "from Messages order by recipient asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        if (request.isUserInRole("user")){
            query = "from Messages where recipient='"+login+"' order by recipient asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        return "homePage";
    }

    @RequestMapping("/home/sort_date")
    public String sortDate(Model model, String query, HttpServletRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();

        if (request.isUserInRole("admin")){
            query = "from Messages order by dateval asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        if (request.isUserInRole("user")){
            query = "from Messages where recipient='"+login+"' order by dateval asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        return "homePage";
    }

    @RequestMapping("/home/sort_theme")
    public String sortTheme(Model model, String query, HttpServletRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String login = auth.getName();

        if (request.isUserInRole("admin")){
            query = "from Messages order by theme asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        if (request.isUserInRole("user")){
            query = "from Messages where recipient='"+login+"' order by theme asc";
            model.addAttribute("listMessages", this.userService.sortTable(query));
        }
        return "homePage";
    }
}
