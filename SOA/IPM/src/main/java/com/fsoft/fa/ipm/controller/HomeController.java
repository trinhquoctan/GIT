/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.controller;

import com.fsoft.fa.ipm.dao.PositionDao;
import com.fsoft.fa.ipm.dao.PositionRecruitmentDao;
import com.fsoft.fa.ipm.dao.RecruitmentDao;
import com.fsoft.fa.ipm.dao.RecruitmentDetailDao;
import com.fsoft.fa.ipm.dao.SkillDao;
import com.fsoft.fa.ipm.dao.SkillPositionDao;
import com.fsoft.fa.ipm.dao.UserDao;
import com.fsoft.fa.ipm.model.Position;
import com.fsoft.fa.ipm.model.PositionDetail;
import com.fsoft.fa.ipm.model.RecruitmentDetail;
import com.fsoft.fa.ipm.model.PositionRecruitment;
import com.fsoft.fa.ipm.model.Recruitment;
import com.fsoft.fa.ipm.model.Skill;
import com.fsoft.fa.ipm.model.SkillPosition;
import com.fsoft.fa.ipm.model.User;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    private static final Logger LOGGER = Logger.getLogger(HomeController.class.getName());
    @Autowired
    private PositionRecruitmentDao prDao;
    @Autowired
    private SkillPositionDao spDao;
    @Autowired
    private SkillDao skillDao;
    @Autowired
    private PositionDao positionDao;
    @Autowired
    private RecruitmentDao recruitmentDao;
    @Autowired
    private UserDao userDao;

    private List<RecruitmentDetail> getList() {

        List<PositionRecruitment> listPR = prDao.findAll();
        List<SkillPosition> listSP = spDao.findAll();
        List<Recruitment> lstR = recruitmentDao.findAll();
        List<RecruitmentDetail> lst = new ArrayList<>();

        for (Recruitment re : lstR) {
            RecruitmentDetail rd = new RecruitmentDetail(re);

            PositionRecruitment positionRecruitment = re.findPosition(listPR);
            if (positionRecruitment != null) {
                rd.setSalary(positionRecruitment.getSalary());
                rd.setQuantity(positionRecruitment.getQuantity());

                Position position = positionDao.findOne(positionRecruitment.getPositionID());
                PositionDetail pd = new PositionDetail(position);

                SkillPosition skillPosition = position.findSkill(listSP);
                if (skillPosition != null) {
                    pd.addSkill(skillDao.findOne(skillPosition.getSkillID()));
                    rd.addPosition(pd);
                }
            }
            /*SkillRecruitment skillRecruitment = rec.findSkill(listSR);
            if(skillRecruitment != null) 
            {
                rd.addSkill(skillDao.find1Skill(skillRecruitment.getSkillID()));
            }
            
            PositionRecruitment positionRecruitment = rec.findPosition(listPR);
            if(positionRecruitment != null)
            {
                rd.addPosition(positionDao.find1Position(positionRecruitment.getPositionID()));
                rd.set(positionRecruitment);
            }*/

            lst.add(rd);
        }
        return lst;
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView viewHome(@ModelAttribute("sort") String sort, BindingResult result, Model model) {
        ModelAndView m = new ModelAndView("home");

        List<RecruitmentDetail> lst = getList();
        if (sort.equals("title")) {
            RecruitmentDetailDao.sortByTitle(lst);
        } else if (sort.equals("date")) {
            RecruitmentDetailDao.sortByCreatedDate(lst);
        } else if (sort.startsWith("salary")) {
            boolean s = false;
            if (sort.endsWith("A")) {
                s = RecruitmentDetailDao.ASCENDING;
            } else if (sort.endsWith("D")) {
                s = RecruitmentDetailDao.DESCENDING;
            }

            RecruitmentDetailDao.sortBySalary(lst, s);
        }

        m.addObject("list", lst);
        return m;
    }

    @RequestMapping(value = "ipm", method = RequestMethod.GET)
    public ModelAndView viewIPM(@ModelAttribute("sort") String sort, BindingResult result, Model model) {
        ModelAndView m = new ModelAndView("ipm");

        List<RecruitmentDetail> lst = getList();
        if (sort.equals("title")) {
            RecruitmentDetailDao.sortByTitle(lst);
        } else if (sort.equals("date")) {
            RecruitmentDetailDao.sortByCreatedDate(lst);
        } else if (sort.startsWith("salary")) {
            boolean s = false;
            if (sort.endsWith("A")) {
                s = RecruitmentDetailDao.ASCENDING;
            } else if (sort.endsWith("D")) {
                s = RecruitmentDetailDao.DESCENDING;
            }

            RecruitmentDetailDao.sortBySalary(lst, s);
        }

        m.addObject("list", lst);
        return m;
    }//--------------------------//
    @RequestMapping(value = "ipm-detail-recruit", method = RequestMethod.GET)
    public ModelAndView viewIpmRecruit(@ModelAttribute("id") String id, BindingResult result, Model model) {
        int Id = Integer.parseInt(id);

        List<RecruitmentDetail> lst = getList();
        RecruitmentDetail recruitmentDetail = new RecruitmentDetail();
        for (RecruitmentDetail rd : lst) {
            if (Id == rd.getId()) {
                recruitmentDetail = rd;
                break;
            }
        }

        ModelAndView m = new ModelAndView("ipm");

        m.addObject("recruit", recruitmentDetail);
        return m;
    }
    
    @RequestMapping(value = "ipm-search-recruit", method = RequestMethod.POST)
    public ModelAndView searchIPMRecruit(@ModelAttribute("key") String data, BindingResult result, Model model) {
        ModelAndView m = new ModelAndView("ipm");
        String key = data.toLowerCase();

        List<RecruitmentDetail> lst = getList();
        List<RecruitmentDetail> lstFilter = new ArrayList<>();
        for (RecruitmentDetail r : lst) {
            if (r.getTitle().toLowerCase().contains(key)) {
                lstFilter.add(r);
            } else if ((r.getSalary() + "").toLowerCase().contains(key)) {
                lstFilter.add(r);
            } else if (r.getDate_create().toString().contains(key)) {
                lstFilter.add(r);
            } else {
                for (PositionDetail p : r.getPosition()) {
                    if (p.getName().toLowerCase().contains(key)) {
                        lstFilter.add(r);
                        break;
                    } else {
                        boolean exist = false;
                        for (Skill s : p.getSkill()) {
                            if (s.getName().toLowerCase().contains(key)) {
                                lstFilter.add(r);
                                exist = true;
                                break;
                            }
                        }
                        if (exist) {
                            break;
                        }
                    }
                }

            }
        }

        if (key.isEmpty()) {
            m.addObject("list", lst);
        } else {
            m.addObject("list", lstFilter);
        }

        return m;
    }

    
    @RequestMapping(value = "detail-recruit", method = RequestMethod.GET)
    public ModelAndView viewRecruitment(@ModelAttribute("id") String id, BindingResult result, Model model) {
        int Id = Integer.parseInt(id);

        List<RecruitmentDetail> lst = getList();
        RecruitmentDetail recruitmentDetail = new RecruitmentDetail();
        for (RecruitmentDetail rd : lst) {
            if (Id == rd.getId()) {
                recruitmentDetail = rd;
                break;
            }
        }

        ModelAndView m = new ModelAndView("home");

        m.addObject("recruit", recruitmentDetail);
        return m;
    }

    @RequestMapping(value = "add-recruit", method = RequestMethod.GET)
    public ModelAndView addRecruit() {
        ModelAndView m = new ModelAndView("add-recruit");
        List<Skill> lstSkill = skillDao.findAll();
        List<Position> lstPosition = positionDao.findAll();
        
        m.addObject("RecruitmentDetail", new RecruitmentDetail());
        m.addObject("skills", lstSkill);
        m.addObject("positions", lstPosition);

        return m;
    }//--------------------------//

    @RequestMapping(value = "add-new-recruitment", method = RequestMethod.GET)
    public String addNewRecruitment() {

        return "home";
    }//--------------------------//

    @ModelAttribute("skill")
    public List<String> skillCheckboxList() {
        List<Skill> lstSkill = skillDao.findAll();
        List<String> checkbox = new ArrayList<String>();

        for (Skill s : lstSkill) {
            checkbox.add(s.getName());
        }
        return checkbox;
    }

    @RequestMapping(value = "display-login", method = RequestMethod.GET)
    public ModelAndView displayLogin() {
        ModelAndView model = new ModelAndView("login");
        User user = new User();

        model.addObject("user", user);

        return model;
    }

    @RequestMapping(value = "search-recruit", method = RequestMethod.POST)
    public ModelAndView searchRecruit(@ModelAttribute("key") String data, BindingResult result, Model model) {
        ModelAndView m = new ModelAndView("home");
        String key = data.toLowerCase();

        List<RecruitmentDetail> lst = getList();
        List<RecruitmentDetail> lstFilter = new ArrayList<>();
        for (RecruitmentDetail r : lst) {
            if (r.getTitle().toLowerCase().contains(key)) {
                lstFilter.add(r);
            } else if ((r.getSalary() + "").toLowerCase().contains(key)) {
                lstFilter.add(r);
            } else if (r.getDate_create().toString().contains(key)) {
                lstFilter.add(r);
            } else {
                for (PositionDetail p : r.getPosition()) {
                    if (p.getName().toLowerCase().contains(key)) {
                        lstFilter.add(r);
                        break;
                    } else {
                        boolean exist = false;
                        for (Skill s : p.getSkill()) {
                            if (s.getName().toLowerCase().contains(key)) {
                                lstFilter.add(r);
                                exist = true;
                                break;
                            }
                        }
                        if (exist) {
                            break;
                        }
                    }
                }

            }
        }

        if (key.isEmpty()) {
            m.addObject("list", lst);
        } else {
            m.addObject("list", lstFilter);
        }

        return m;
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("username") String username, @ModelAttribute("password") String password, BindingResult result, Model model) {

        User user = userDao.getOne(username);

        if (user == null || !user.getPassword().equals(password)) {
            ModelAndView m = new ModelAndView("login");
            m.addObject("message", "fail");
            return m;
        }

        request.setAttribute("name", username);

        return new ModelAndView("home");
    }

}
