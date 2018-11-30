package com.fsoft.fa.ipm.model;

public class SkillPosition {
    
    private int skillID;
    private int positionID;

    public SkillPosition() {
    }

    public SkillPosition(int skillID, int positionID) {
        this.skillID = skillID;
        this.positionID = positionID;
    }

    public int getSkillID() {
        return skillID;
    }

    public int getPositionID() {
        return positionID;
    }

    public void setSkillID(int skillID) {
        this.skillID = skillID;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }
    
}
