package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.CandidateDao;
import com.fsoft.fa.ipm.dao.PositionDao;
import com.fsoft.fa.ipm.dao.PotentialDao;
import com.fsoft.fa.ipm.dao.SkillCandidateDao;
import com.fsoft.fa.ipm.dao.SkillDao;
import com.fsoft.fa.ipm.dao.SkillPositionDao;
import com.fsoft.fa.ipm.model.Candidate;
import com.fsoft.fa.ipm.model.Interview;
import com.fsoft.fa.ipm.model.Position;
import com.fsoft.fa.ipm.model.PositionDetail;
import com.fsoft.fa.ipm.model.PositionSpecial;
import com.fsoft.fa.ipm.model.Potential;
import com.fsoft.fa.ipm.model.Skill;
import com.fsoft.fa.ipm.model.SkillCandidate;
import com.fsoft.fa.ipm.model.SkillPosition;
import java.util.ArrayList;
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
public class PositionController {
    @Autowired
    private PositionDao positionDao;
    @Autowired
    private SkillDao skillDao;
    @Autowired
    private SkillPositionDao spDao;
    @Autowired
    private CandidateDao candidateDao;
    @Autowired
    private SkillCandidateDao scDao;
    @Autowired
    private PotentialDao potentialDao;
    
    @RequestMapping(value ="position-list", method = RequestMethod.GET)
    public ModelAndView viewHome() {
        List<Position> list = positionDao.findAll();
        ModelAndView m = new ModelAndView("position-list");
        
        m.addObject("listPositions", list); 
        
        return m;
    }
     
    @RequestMapping(value="position-add", method = RequestMethod.GET)
    public ModelAndView viewAddPosition() {
    	ModelAndView mav = new ModelAndView("position-add", "command", new PositionSpecial());
        mav.addObject("position", new Position("", 0));
    	return mav;
    }
    
    @RequestMapping(value="add-into-potential", method = RequestMethod.GET)
    public String AddIntoPotential(@RequestParam("pos") int pos, @RequestParam("can") int can) {
        potentialDao.addPotential(new Potential(can, pos));
    	return "redirect:/position-list";
    }
    
    @RequestMapping(value ="edit-position", method = RequestMethod.GET)
    public ModelAndView editPosition(@RequestParam("id") int id) {
    	ModelAndView mav = new ModelAndView("position-add", "command", new PositionSpecial());
        
    	mav.addObject("position",positionDao.findOne(id));
        
    	return mav;
    }
    
    @RequestMapping(value = "create-position", method = RequestMethod.POST)
    public String addNewPosition(@ModelAttribute("positiondetail") PositionSpecial pd, BindingResult result,Model model) {
    	
        Position p = new Position(pd.getName(), pd.getProcess());
        positionDao.addPosition(p);
        
        Position pos = positionDao.findByNameAndProcess(pd.getName(), pd.getProcess());
        if(pd.getSkill() != null)
        {
            for(String s: pd.getSkill())
            {
                Skill skill = skillDao.findByName(s);
                if(skill != null) spDao.addSkillPosition(new SkillPosition(skill.getId(), pos.getId()));
            }
        }
    	return "redirect:/position-list";
    }
    
    @ModelAttribute("skillList")
    public List<String> getSkillList(){
        List<String> skillList = new ArrayList<>();
        
        for(Skill skill : skillDao.findAll()){
            skillList.add(skill.getName());
        }
        
        return skillList;
    }
    
    public boolean isExist(List<Skill> lst, int skillId) {
        for(Skill s: lst) 
        {
            if(s.getId() == skillId) return true;
        }
        return false;
    }
    
    @RequestMapping(value ="list-nomination", method = RequestMethod.GET)
    public ModelAndView listNomination(@RequestParam("id") int id) {
    	ModelAndView mav = new ModelAndView("position-list");
        List<Candidate> lst = new ArrayList<>();
        
        List<SkillPosition> lstSP = spDao.findByPosition(id);
        List<Candidate> lstCan = candidateDao.getAll();
        List<Skill> lstSkill = new ArrayList<>();
        
        for(SkillPosition sp: lstSP)
        {
            lstSkill.add(skillDao.findOne(sp.getSkillID()));
        }
        for(Candidate c: lstCan)
        {
            List<SkillCandidate> lstSC = scDao.findByCandidate(c.getCandidateID());
            boolean isExistAll = true;
            for(SkillCandidate sc: lstSC)
            {
                if(!isExist(lstSkill, sc.getSkillID())) {
                    isExistAll = false;
                    break;
                }
            }
            if(isExistAll) lst.add(c);
        }
        
        mav.addObject("position", positionDao.findOne(id));
        mav.addObject("lstCandidate", lst);
        mav.addObject("lstSkill", lstSkill);
        mav.addObject("interview", new Interview()); 
        
    	return mav;
    }
    /*
    @ModelAttribute("skill-required")
    public List<String> getSkillList(@ModelAttribute("id") int id){
        
        List<SkillPosition> lst = spDao.findByPosition(id);
        List<String> skillRequired = new ArrayList<>();
        
        for(SkillPosition e: lst)
        {
            Skill s = skillDao.findOne(e.getSkillID());
            if(s != null) skillRequired.add(s.getName());
        }
        
        return skillRequired;
    }
    */
 
    @RequestMapping(value = "update-position",method = RequestMethod.POST)
    public String updatePosition(@ModelAttribute("positiondetail") PositionSpecial sk,BindingResult result,Model model) {
    	
        positionDao.updatePosition(new Position(sk.getId(), sk.getName(), sk.getProcess(), sk.getQuantity()));
        List<SkillPosition> lstSP = spDao.findByPosition(sk.getId());
        List<Skill> lstSkill = new ArrayList<>();
        
        for(String s: sk.getSkill())
        {
            Skill skill = skillDao.findByName(s);
            if(skill != null) lstSkill.add(skill);
        }
        for(Skill s: lstSkill)
        {
            if(!isExistSkillPosition(s.getId(), lstSP)) spDao.addSkillPosition(new SkillPosition(s.getId(), sk.getId()));
        }
        for(SkillPosition s: lstSP)
        {
            if(!isExistSkill(s.getSkillID(), lstSkill)) spDao.deleteOne(new SkillPosition(s.getSkillID(), sk.getId()));
        }
        
    	return "redirect:/position-list";
    }
    
    public boolean isExistSkill(int id, List<Skill> lst) {
        for(Skill s: lst) 
        {
            if(s.getId() == id) return true;
        }
        return false;
    }
    
    public boolean isExistSkillPosition(int id, List<SkillPosition> lst) {
        for(SkillPosition s: lst)
        {
            if(s.getSkillID() == id) return true;
        }
        return false;
    }
    
    @RequestMapping(value = "delete-position", method = RequestMethod.GET)
    public ModelAndView deletePosition(@RequestParam("id") int id) {
    	positionDao.deleteById(id);
        spDao.deleteByPositionId(id);
    	ModelAndView mav = new ModelAndView("redirect:/position-list");
    	return mav;
    }
}
