
package com.fsoft.fa.ipm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PageNotFoundErrorController {
    @RequestMapping("not-found")
    public ModelAndView handlePageNotFound(){
        return new ModelAndView("not-found");
    }
}
