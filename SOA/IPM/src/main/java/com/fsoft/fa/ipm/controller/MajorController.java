package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.MajorDao;
import com.fsoft.fa.ipm.model.Major;
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

@Controller
public class MajorController {
    @Autowired
    private MajorDao majorDao;
    
    @RequestMapping(value="major-list",method=RequestMethod.GET)
    private ModelAndView majorList(){
        List<Major> list = majorDao.findAll();
        ModelAndView m = new ModelAndView("major-list");
        m.addObject("listMajor",list);
        return m;
    }
    
    @RequestMapping(value="edit-major", method=RequestMethod.GET)
    private ModelAndView majorDetail(@RequestParam("name") String name){
        ModelAndView m = new ModelAndView("major-add");
        m.addObject("major", majorDao.findOne(name));
        return m;
    }
    
    @RequestMapping(value= "major-add",method = RequestMethod.GET)
    private ModelAndView majorAddView(){
        ModelAndView mav = new ModelAndView("major-add");
        mav.addObject("major", new Major());
        return mav;
    }
    
    @RequestMapping(value="create-major", method=RequestMethod.POST)
    private String addNewMajor(@ModelAttribute("major") Major major,BindingResult result,Model model){
        majorDao.addMajor(major);
        return "redirect:/major-list";
    }
    
    @RequestMapping(value="update-major", method=RequestMethod.POST)
    private String updateMajor(@ModelAttribute("major")Major major, BindingResult result, Model model){
        majorDao.updateMajor(major);
        return "redirect:/major-list";
    }
    
    @RequestMapping(value="delete-major", method = RequestMethod.GET)
    public ModelAndView deleteMajor(@RequestParam("id") int id){
    ModelAndView mav = new ModelAndView("redirect:/major-list");
    majorDao.deleteMajor(id);
    return mav;
    }
}
