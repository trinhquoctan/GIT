/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ThieuIT
 */
@Controller
public class LoginController {

    @RequestMapping(value ="Login-Page", method = RequestMethod.GET)
    public ModelAndView showLoginPage(){
        return new ModelAndView("login");
    }
    
    @RequestMapping(value ="/access-denied", method = RequestMethod.GET)
    public ModelAndView showAccessDenied(){
        return new ModelAndView("access-denied");
    }
}
