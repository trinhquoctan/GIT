package com.fsoft.fa.ipm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fsoft.fa.ipm.dao.SkillDao;
import com.fsoft.fa.ipm.model.Skill;

@Controller
public class SkillController {
	
    @Autowired
    private SkillDao skillDao;

    @RequestMapping(value="skill-list", method = RequestMethod.GET)
    public ModelAndView viewHome() {
        List<Skill> list = skillDao.findAll();
        ModelAndView m = new ModelAndView("skill-list");
        m.addObject("listSkills", list); 
        // Trả về 1 list vs ${listBooks}
        return m;
    }
    
    @RequestMapping(value="skill-add", method = RequestMethod.GET)
    public ModelAndView viewAddSkill() {
    	ModelAndView mav = new ModelAndView("skill-add");
    	mav.addObject("skill", new Skill());
    	return mav;
    }
    
    @RequestMapping(value ="edit-skill", method = RequestMethod.GET)
    public ModelAndView editSkill(@RequestParam("id") int id) {
    	ModelAndView mav = new ModelAndView("skill-add");
    	mav.addObject("skill",skillDao.findOne(id));
    	return mav;
    }
    
    @RequestMapping(value = "create-skill", method = RequestMethod.POST)
    public String addNewSkill(@ModelAttribute("skill") Skill sk, BindingResult result,Model model) {
    	skillDao.addSkill(sk);
    	return "redirect:/skill-list";
    }
 
    @RequestMapping(value = "update-skill",method = RequestMethod.POST)
    public String updateSkill(@ModelAttribute("skill") Skill sk,BindingResult result,Model model) {
    	skillDao.updateSkill(sk);
    	return "redirect:/skill-list";
    }
    
    @RequestMapping(value = "delete-skill", method = RequestMethod.GET)
    public ModelAndView deleteSkill(@RequestParam("id") int id) {
    	ModelAndView mav = new ModelAndView("redirect:/skill-list");
    	skillDao.deleteSkill(id);
    	return mav;
    }
}
