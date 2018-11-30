
package com.fsoft.fa.ipm.model;

import java.util.ArrayList;
import java.util.List;


public class PositionDetail {
    
    private int id;
    private String name;
    private List<Skill> skill = new ArrayList<>();
    private int process;
    private int quantity;

    public PositionDetail() {
    }

    public PositionDetail(Position p) {
        this.id = p.getId();
        this.name = p.getName();
        this.process = p.getProcess();
        this.quantity = p.getQuantity();
    }

    public PositionDetail(int id, String name, List<Skill> skill, int process, int quantity) {
        this.id = id;
        this.name = name;
        this.skill = skill;
        this.process = process;
        this.quantity = quantity;
    }
    
    public boolean addSkill(Skill s) {
        return skill.add(s);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Skill> getSkill() {
        return skill;
    }

    public void setSkill(List<Skill> skill) {
        this.skill = skill;
    }

    public int getProcess() {
        return process;
    }

    public void setProcess(int process) {
        this.process = process;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
