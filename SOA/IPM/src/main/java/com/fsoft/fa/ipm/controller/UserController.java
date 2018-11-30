/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.UserDao;
import com.fsoft.fa.ipm.model.User;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Datvippq
 */
@Controller
public class UserController {
    @Autowired
    private UserDao userDao;
    
    @RequestMapping(value="users",method=RequestMethod.GET)
    public ModelAndView listUser(){
        ModelAndView model = new ModelAndView("users");
        model.addObject("user", new User());
        model.addObject("listUser",userDao.getAll());
        return model;        
    }
    
    @RequestMapping(value="find-user",method=RequestMethod.GET)
    public ModelAndView findUser(@RequestParam("username")String username){
        ModelAndView model = new ModelAndView("find-username");
        model.addObject("userById",userDao.getOne(username));
        return model;
    }
    
    @RequestMapping(value="remove-user",method=RequestMethod.GET)
    public String removeUser(@RequestParam("username")String username) throws SQLException, ClassNotFoundException{
        

        
        userDao.deleteByUsername(username);

        return "redirect:/users";
    }
    
    @RequestMapping(value="user-add",method=RequestMethod.GET)
    public ModelAndView addUser(){
        
        ModelAndView m = new ModelAndView("user-add");
        m.addObject("user", new User());
        return m;
    }
    
    @RequestMapping(value="create-user",method=RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User u,BindingResult result, Model model){
        userDao.addUser(u);
        return "redirect:/users";
    }
    
    @RequestMapping(value="update-user",method=RequestMethod.POST)
    private String updateUser(@ModelAttribute("user")User u, BindingResult result, Model model){
        userDao.updateUser(u);
        
        return "redirect:/users";
        
    }
}
