package com.fsd.spring.controller;

import com.fsd.spring.entity.User;
import com.fsd.spring.repository.UserRepository;
import com.fsd.spring.repository.impl.UserRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value={"/","/index"}, method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView index(@RequestParam(value = "auth", required = false) String auth, Model model) throws IOException {
        System.out.println("Login Controller index");
        if(!StringUtils.isEmpty(auth) && "failure".equalsIgnoreCase(auth)){
            model.addAttribute("failureMessage","Bad Credential. Login Failed");
        }
        return new ModelAndView("login");
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
    public ModelAndView registerUser(Model model, User user) {
        System.out.println("Login Controller registerUser");
        try {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.save(user);
            model.addAttribute("successMessage","User Registered");
        }catch(Exception e){
            model.addAttribute("failureMessage","User Registration Failed");
        }
        return new ModelAndView("login");
    }

}
