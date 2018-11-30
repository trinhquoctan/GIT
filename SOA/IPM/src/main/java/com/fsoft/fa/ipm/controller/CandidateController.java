package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.CandidateDao;
import com.fsoft.fa.ipm.dao.PotentialDao;
import com.fsoft.fa.ipm.dao.SkillCandidateDao;
import com.fsoft.fa.ipm.dao.SkillDao;
import com.fsoft.fa.ipm.model.Candidate;
import com.fsoft.fa.ipm.model.Interview;
import com.fsoft.fa.ipm.model.Potential;
import com.fsoft.fa.ipm.model.Skill;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CandidateController {
    
    @Autowired
    CandidateDao candidateDao;
    
    @Autowired
    SkillDao skillDao;
    
    @Autowired
    SkillCandidateDao scd;
    
    @Autowired
    ServletContext context;
    
    @Autowired
    PotentialDao potentialDao;
    
    @InitBinder     
    public void initBinder(WebDataBinder binder){
         binder.registerCustomEditor(Date.class,     
                             new CustomDateEditor(new SimpleDateFormat("yyyy-mm-dd"), true,10));   
    }
    
    @RequestMapping(value="candidate-list", method=RequestMethod.GET)
    public ModelAndView getListCandidate(){
        
        List<Candidate> list;
        
        ModelAndView model = new ModelAndView("candidate-list");
        
        list = candidateDao.getAll(); 
        
        model.addObject("interview", new Interview());
        model.addObject("listCandidate", list);
        return model;
    } 
    
    @RequestMapping(value="add-candidate",method=RequestMethod.GET)
    public ModelAndView viewAddCandidate(){
        ModelAndView m = new ModelAndView("candidate-add", "command", new Candidate());
        m.addObject("skillDaoList", skillDao.findAll());
        return m;
    }
    
    @RequestMapping(value="potential-list",method=RequestMethod.GET)
    public ModelAndView viewPotentialCandidate(){
        ModelAndView m = new ModelAndView("potential");
        List<Potential> lst = potentialDao.findAll();
        List<Candidate> lstCandidate = new ArrayList<>();
        
        for(Potential p: lst)
        {
            Candidate c = candidateDao.getById(p.getCandidateID());
            if(c != null) lstCandidate.add(c);
        }
        
        m.addObject("listCandidate", lstCandidate);
        
        return m;
    }
    
    @RequestMapping(value="create-candidate", method=RequestMethod.POST)
    public String createCandidate(@Valid @ModelAttribute("candidate")Candidate c,
            @RequestParam("file")CommonsMultipartFile file, BindingResult result, 
            HttpSession session) throws FileNotFoundException, IOException{
        
        if (result.hasErrors()) {       
            System.err.println(result.getObjectName());
            return "redirect:not-found";
        }
        //upload cv
        String path = session.getServletContext().getRealPath("/");
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        String fileName = c.getIdCard()+"."+ext;
        
        System.err.println(path+fileName);
        
        byte barr[] = file.getBytes();

        try (BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path+"/"+fileName))) {
            bout.write(barr);
            bout.flush();
        }
        
        c.setCv(fileName);
        
        //
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        ModelAndView m = new ModelAndView("candidate-list");
        c.setDateCreate(sdf.format(new Date()));
        
        Candidate can = candidateDao.addCandidate(c);
        if(c.getSkill()!=null){
            for(String sk:c.getSkill())
                scd.add(sk, can.getCandidateID());
        }
        return "redirect:/candidate-list";
    }
    
    @RequestMapping(value="update-candidate", method=RequestMethod.GET)
    public ModelAndView updateCandidatePage(@RequestParam("id")int id){
        ModelAndView m = new ModelAndView("candidate-update");
        Candidate c = candidateDao.getById(id);
                
        m.addObject("candidate", c);
        return m;
    }
    
    @RequestMapping(value="update-candidate", method=RequestMethod.POST)
    public String updateCandidate(@ModelAttribute("candidate")Candidate c, BindingResult result){
        if(result.hasErrors()){
            return "not-found";
        }
        candidateDao.UpdateCandidateInfor(c);
        scd.deleteSkillCandidate(c.getCandidateID());
        if(c.getSkill()!=null){
            for(String sk:c.getSkill())
                scd.add(sk, c.getCandidateID());
        }
        return "redirect:/candidate-list";
    }
    
    @RequestMapping(value="get-candidate", method=RequestMethod.GET)
    public ModelAndView getCandidate(@RequestParam("candidateId") int id){
        ModelAndView model = new ModelAndView("candidate-detail");
        model.addObject("candidate", candidateDao.getById(id));
        return model;
    }
    
    @RequestMapping(value="delete-candidate",method=RequestMethod.GET)
    public String removeCandidate(@RequestParam("id")int id){
        System.err.println("Prepare to delete id = "+id);
        scd.deleteSkillCandidate(id);
        System.err.println("Delete skill complete!!");
        candidateDao.deleteById(id);
        System.err.println("Delete Candidate Complete!!");
        return "redirect:candidate-list";
    }
    
    @ModelAttribute("skillList")
    public List<String> getSkillList(){
        List<String> skillList = new ArrayList<>();
        
        for(Skill skill : skillDao.findAll()){
            skillList.add(skill.getName());
        }
        
        return skillList;
    }
    
    @ModelAttribute("genderList")
    public List<String> getGenderList(){
        List<String> genderList = new ArrayList<>();
        genderList.add("Male");
        genderList.add("Female");
        genderList.add("Other");
        
        return genderList;
    }
}
