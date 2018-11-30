package com.fsoft.fa.ipm.model;

import java.util.List;

public class Position {
    
    private int id;
    private String name;
    private int process;
    private int quantity;

    public Position() {
    }

    public Position(String name, int process) {
        this.name = name;
        this.process = process;
    }

    public Position(String name, int process, int quantity) {
        this.name = name;
        this.process = process;
        this.quantity = quantity;
    }

    public Position(int id, String name, int process, int quantity) {
        this.id = id;
        this.name = name;
        this.process = process;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getProcess() {
        return process;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setProcess(int process) {
        this.process = process;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public SkillPosition findSkill(List<SkillPosition> lst) {
        for(SkillPosition sp: lst)
        {
            if(id == sp.getPositionID()) return sp;
        }
        return null;
    }
}
