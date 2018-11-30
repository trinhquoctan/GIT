package com.fsoft.fa.ipm.model;



public class Interview {
    
    private int id;
    private String date;
    private String time;
    private String location;
    private int candiateID;
    private String username;
    private String result;

    public Interview() {
    }

    public Interview(int id, String date, String time, String location, int candiateID, String username, String result) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.location = location;
        this.candiateID = candiateID;
        this.username = username;
        this.result = result;
    }

    public Interview(String date, String time, String location, int candiateID, String username, String result) {
        this.date = date;
        this.time = time;
        this.location = location;
        this.candiateID = candiateID;
        this.username = username;
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCandiateID() {
        return candiateID;
    }

    public void setCandiateID(int candiateID) {
        this.candiateID = candiateID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    
    

}