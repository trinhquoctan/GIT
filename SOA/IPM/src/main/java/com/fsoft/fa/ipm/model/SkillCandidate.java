package com.fsoft.fa.ipm.model;

public class SkillCandidate {
    
    private int skillD;
    private int candidateID;

    public SkillCandidate() {
    }

    public SkillCandidate(int skillD, int candidateID) {
        this.skillD = skillD;
        this.candidateID = candidateID;
    }

    public void setSkillID(int skillD) {
        this.skillD = skillD;
    }

    public void setCandidateID(int candidateID) {
        this.candidateID = candidateID;
    }

    public int getSkillID() {
        return skillD;
    }

    public int getCandidateID() {
        return candidateID;
    }
    
}
