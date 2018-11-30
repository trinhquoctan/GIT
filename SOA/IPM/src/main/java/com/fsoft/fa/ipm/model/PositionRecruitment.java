package com.fsoft.fa.ipm.model;

import java.util.List;

public class PositionRecruitment {
    
    private int positionID;
    private int recruitmentID;
    private int quantity;
    private int salary;

    public PositionRecruitment() {
    }

    public PositionRecruitment(int positionID, int recruitmentID, int quantity, int salary) {
        this.positionID = positionID;
        this.recruitmentID = recruitmentID;
        this.quantity = quantity;
        this.salary = salary;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }

    public void setRecruitmentID(int recruitmentID) {
        this.recruitmentID = recruitmentID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }
    
    public int getPositionID() {
        return positionID;
    }

    public int getRecruitmentID() {
        return recruitmentID;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getSalary() {
        return salary;
    }
    
    public Position getPosition(List<Position> lst) {
        for(Position pos: lst)
        {
            if(pos.getId() == positionID) return pos;
        }
        return null;
    }
}
