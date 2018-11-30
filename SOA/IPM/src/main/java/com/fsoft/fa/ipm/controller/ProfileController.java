/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.ProfileDao;
import com.fsoft.fa.ipm.model.User;
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
 * @author ThieuIT
 */

@Controller
public class ProfileController {
    
    @Autowired
    private ProfileDao profileDao;
    
    @RequestMapping(value ="profile-edit", method = RequestMethod.GET)
    public ModelAndView viewEditProfile(){
        ModelAndView mav = new ModelAndView("profile-edit");
        mav.addObject("user", new User());
        return mav;
    }
    
    @RequestMapping(value="edit-user", method = RequestMethod.GET)
    public ModelAndView editProfile(@RequestParam("username") String username){
        ModelAndView mav = new ModelAndView("profile-edit");
        mav.addObject("user", profileDao.findOne(username));
        return mav;
    }
    
    @RequestMapping(value="update-profile", method = RequestMethod.POST)
    public String updateProfile(@ModelAttribute("user") User userr, BindingResult result,Model model){
        profileDao.updateProfile(userr);
        return "redirect:/home";
    }
    
    
}
