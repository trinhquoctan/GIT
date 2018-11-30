/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.CandidateDao;
import com.fsoft.fa.ipm.dao.EntryTestDao;
import com.fsoft.fa.ipm.dao.PositionDao;
import com.fsoft.fa.ipm.model.Candidate;
import com.fsoft.fa.ipm.model.EntryTest;
import com.fsoft.fa.ipm.model.Position;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EntryTestController {
    
    @Autowired
    PositionDao possitionDao;
    
    @Autowired
    CandidateDao candidateDao;
    
    @Autowired
    EntryTestDao entryTestDao;
    
    @RequestMapping(value="entrytest-list", method=RequestMethod.GET)
    public ModelAndView addViewEntryTest(){
        
        ModelAndView model = new ModelAndView("recruitment-process");
        List<Candidate> listCandidate = candidateDao.getAll();
        List<Position> list = possitionDao.findAll();
        List<Position> listPosition = new ArrayList<>();
        List<EntryTest> lstTest = entryTestDao.getAll();
        
        for(Position pos: list)
        {
            boolean isExist = false;
            for(EntryTest et: lstTest)
            {
                if(et.getPositionID()== pos.getId()) 
                {
                    isExist = true;
                    break;
                }
            }
            if(isExist) listPosition.add(pos);
        }
        
        model.addObject("listCandidate", listCandidate);
        model.addObject("listPosition", listPosition);
        model.addObject("lstTest", lstTest);
        model.addObject("entrytest", new EntryTest());
        
        return model;
    }
    
    @RequestMapping(value="update-result", method=RequestMethod.POST)
    public String updateEntryTestResult(@ModelAttribute("entrytest") EntryTest et){
        EntryTest e = entryTestDao.getById(et.getId());
        e.setResult(et.getResult());
        entryTestDao.UpdateEntryTestInfor(e);
        
        return "redirect:entrytest-list";
    }
    
    
}
