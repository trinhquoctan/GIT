package com.fsoft.fa.ipm.model;

public class Potential {
    
    private int candidateID;
    private int positionID;

    public Potential() {
    }

    public Potential(int candidateID, int positionID) {
        this.candidateID = candidateID;
        this.positionID = positionID;
    }

    public int getCandidateID() {
        return candidateID;
    }

    public int getPositionID() {
        return positionID;
    }

    public void setCandidateID(int candidateID) {
        this.candidateID = candidateID;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }
    
}
