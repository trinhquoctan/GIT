package com.fsoft.fa.ipm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CvUploadController {
    
    @RequestMapping("upload")
    public ModelAndView uploadPage(){
        return new ModelAndView("upload");
    }
    
    @RequestMapping(value="savefile",method=RequestMethod.POST)  
    public ModelAndView upload(@RequestParam("file")CommonsMultipartFile file, HttpSession session) throws FileNotFoundException, IOException{  
        String path = session.getServletContext().getRealPath("/");
        String fileName = file.getOriginalFilename();
        
        System.err.println(path+fileName);
        
        byte barr[] = file.getBytes();

        try (BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path+"/"+fileName))) {
            bout.write(barr);
            bout.flush();
        }        
        return new ModelAndView("upload-success","filename",path+"/"+fileName);
    }
}
