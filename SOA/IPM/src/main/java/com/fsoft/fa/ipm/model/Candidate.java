package com.fsoft.fa.ipm.model;

import java.util.Date;

public class Candidate {
    
    private int candidateID;
    private String fullname;
    private String major;
    private String birthday;
    private String skill[];
    private String gender;
    private String idCard;
    private String email;
    private int phone;
    private String dateCreate;
    private String status;
    private String cv;

    public Candidate() {
    }

    public Candidate(String fullname, String major, String birthday, String[] skill, String gender, String idCard, String email, int phone, String dateCreate, String status, String cv) {
        this.fullname = fullname;
        this.major = major;
        this.birthday = birthday;
        this.skill = skill;
        this.gender = gender;
        this.idCard = idCard;
        this.email = email;
        this.phone = phone;
        this.dateCreate = dateCreate;
        this.status = status;
        this.cv = cv;
    }

    public Candidate(int candidateID, String fullname, String major, String birthday, String[] skill, String gender, String idCard, String email, int phone, String dateCreate, String status, String cv) {
        this.candidateID = candidateID;
        this.fullname = fullname;
        this.major = major;
        this.birthday = birthday;
        this.skill = skill;
        this.gender = gender;
        this.idCard = idCard;
        this.email = email;
        this.phone = phone;
        this.dateCreate = dateCreate;
        this.status = status;
        this.cv = cv;
    }

    public String[] getSkill() {
        return skill;
    }

    public void setSkill(String[] skill) {
        this.skill = skill;
    }

    public int getCandidateID() {
        return candidateID;
    }

    public String getFullname() {
        return fullname;
    }

    public String getMajor() {
        return major;
    }


    public String getBirthday() {
        return birthday;
    }

    public String getGender() {
        return gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public String getEmail() {
        return email;
    }

    public int getPhone() {
        return phone;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public String getStatus() {
        return status;
    }

    public String getCv() {
        return cv;
    }

    public void setCandidateID(int candidateID) {
        this.candidateID = candidateID;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setMajor(String major) {
        this.major = major;
    }


    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }
    
}
