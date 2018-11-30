package com.fsoft.fa.ipm.model;

public class Skill {
    
    private int id;
    private String name;

    public Skill() {
    }
    
    public Skill(String name) {
        this.name = name;
    }

    public Skill(int id, String name) {
        this.id = id;
        this.name = name;
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

}
