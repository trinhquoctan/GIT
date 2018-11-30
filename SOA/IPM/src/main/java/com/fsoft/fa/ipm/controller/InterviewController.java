package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.CandidateDao;
import com.fsoft.fa.ipm.dao.InterviewDao;
import com.fsoft.fa.ipm.model.Candidate;
import com.fsoft.fa.ipm.model.Interview;
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
public class InterviewController {

    @Autowired
    InterviewDao interviewDao;

    @Autowired
    CandidateDao candidateDao;

    @RequestMapping(value = "create-interview-dating", method = RequestMethod.POST)
    private String createInterviewDatting(@ModelAttribute("interview") Interview itv, BindingResult result, Model model) {

        Candidate c = candidateDao.getById(itv.getCandiateID());
        c.setStatus("InterviewProcess");

        candidateDao.UpdateCandidateInfor(c);
        interviewDao.addInterview(itv);

        return "redirect:/candidate-list";

    }
    
    @RequestMapping(value = "update-interview", method = RequestMethod.POST)
    private String UpdateInterviewDatting(@ModelAttribute("interview") Interview itv, BindingResult result, Model model) {
        
        //System.out.println(itv.getCandiateID());
        interviewDao.UpdateInterviewInfor(itv);

        return "redirect:/interview-list";

    }

    @RequestMapping(value = "interview-list", method = RequestMethod.GET)
    public ModelAndView getListInterview() {

        ModelAndView model = new ModelAndView("interview-list");
        model.addObject("interview", new Interview());

        model.addObject("listInterviews", interviewDao.getAll());

        return model;
    }

    @RequestMapping(value="delete-interview", method = RequestMethod.GET)
    public ModelAndView deleteMajor(@RequestParam("id") int id){
    ModelAndView mav = new ModelAndView("redirect:/interview-list");
    interviewDao.deleteById(id);
    return mav;
    }
}
