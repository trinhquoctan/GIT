package com.fsoft.fa.ipm.model;

public class Major {
    
    private int id;
    private String name;

    public Major() {
    }

    public Major(String name) {
        this.name = name;
    }

    public Major(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
