package com.fsd.spring.controller;

import com.fsd.spring.entity.User;
import com.fsd.spring.repository.UserRepository;
import com.fsd.spring.repository.impl.UserRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @GetMapping({"/","/index"})
    public ModelAndView index() throws IOException {
        System.out.println("Login Controller index");
        return new ModelAndView("login");
    }

    @RequestMapping(value="/doLogin", method = {RequestMethod.POST,RequestMethod.GET})
    public String doLogin() throws IOException {
        System.out.println("Login Controller home");
        return "doLogin";
    }

    @GetMapping("/home")
    public ModelAndView home() throws IOException {
        System.out.println("Login Controller home");
        return new ModelAndView("home");
    }

    @GetMapping("/register")
    public ModelAndView register() throws IOException {
        System.out.println("Login Controller register");
        return new ModelAndView("register");
    }

    @PostMapping("/registerUser")
    public ModelAndView registerUser(User user) throws IOException {
        System.out.println("Login Controller registerUser");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return new ModelAndView("login");
    }

}
