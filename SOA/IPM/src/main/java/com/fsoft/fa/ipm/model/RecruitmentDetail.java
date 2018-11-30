package com.fsoft.fa.ipm.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RecruitmentDetail {
    
    private int id;
    private String title;
    private String content;
    private Date date_create;
    private Date date_end;
    private int quantity;
    private int salary;
    private List<PositionDetail> position = new ArrayList<>();

    public RecruitmentDetail() {
    }

    public RecruitmentDetail(int id, String title, String content, Date date_create, Date date_end, int quantity, int salary) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.date_create = date_create;
        this.date_end = date_end;
        this.quantity = quantity;
        this.salary = salary;
    }

    public RecruitmentDetail(RecruitmentDetail red) {
        this.id = red.getId();
        this.title = red.getTitle();
        this.content = red.getContent();
        this.date_create = red.getDate_create();
        this.date_end = red.getDate_end();
        this.quantity = red.getQuantity();
        this.salary = red.getSalary();
        this.position = red.getPosition();
    }

    public RecruitmentDetail(Recruitment re) {
        this.id = re.getId();
        this.title = re.getTitle();
        this.content = re.getContent();
        this.date_create = re.getDateCreate();
        this.date_end = re.getDateEnd();
    }
    
    public boolean addPosition(PositionDetail pos) {
        return position.add(pos);
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

    public Date getDate_create() {
        return date_create;
    }

    public void setDate_create(Date date_create) {
        this.date_create = date_create;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public List<PositionDetail> getPosition() {
        return position;
    }

    public void setPosition(List<PositionDetail> position) {
        this.position = position;
    }

    
}
