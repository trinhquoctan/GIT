package com.fsoft.fa.ipm.model;

import java.util.Date;
import java.util.List;

public class Recruitment {
    
    private int id;
    private String title;
    private String content;
    private Date dateCreate;
    private Date dateEnd;

    public Recruitment() {
    }

    public Recruitment(String title, String content, Date dateCreate, Date dateEnd) {
        this.title = title;
        this.content = content;
        this.dateCreate = dateCreate;
        this.dateEnd = dateEnd;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }
    
    public PositionRecruitment findPosition(List<PositionRecruitment> lst) {
        for(PositionRecruitment pr: lst)
        {
            if(pr.getRecruitmentID() == id)
                return pr;
        }
        return null;
    }
}
