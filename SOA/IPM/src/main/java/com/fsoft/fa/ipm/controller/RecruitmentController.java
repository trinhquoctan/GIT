
package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.PositionRecruitmentDao;
import com.fsoft.fa.ipm.dao.RecruitmentDao;
import com.fsoft.fa.ipm.model.PositionRecruitment;
import com.fsoft.fa.ipm.model.Recruitment;
import javax.enterprise.inject.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecruitmentController {
    @Autowired
    private RecruitmentDao recruitmentDao;
    private PositionRecruitmentDao positionRecruitmentDao;
    
    @RequestMapping(value="recruitment-list",method=RequestMethod.GET)
    private ModelAndView recruitList(){
        ModelAndView m = new ModelAndView("recruitment-list");
        m.addObject("recruitList", recruitmentDao.findAll());
        return m;
    }
    
    @RequestMapping(value="recruitment-detail",method=RequestMethod.GET)
    private ModelAndView recruitmentDetail(@RequestParam("title")String title){
        ModelAndView m = new ModelAndView("recruitment-detail");
        m.addObject("recruitById", recruitmentDao.getByTitle(title));
        return m;
    }
    
    @RequestMapping(value="recruitment-add", method=RequestMethod.GET)
    private ModelAndView recruitAddView(){
        return new ModelAndView("recruitment-add");
    }
    
    @RequestMapping(value="recruitment-create", method=RequestMethod.POST)
    private String createRecruit(@ModelAttribute("posRecruit") PositionRecruitment posRe,BindingResult result, Model model){
        positionRecruitmentDao.addPositionRecruitment(posRe);
        return "redirect:/recruitment-list";
    }
    
    @RequestMapping(value="recruitment-update", method=RequestMethod.POST)
    private String updateRecruit(@ModelAttribute("recruit") Recruitment recruit,BindingResult result, Model model){
        recruitmentDao.addRecruitment(recruit);
        return "redirect:/recruitment-list";
    }
}
