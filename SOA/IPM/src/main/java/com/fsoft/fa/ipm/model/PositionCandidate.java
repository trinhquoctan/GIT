package com.fsoft.fa.ipm.model;

public class PositionCandidate {
    private int positionID;
    private int candidateID;

    public PositionCandidate() {
    }

    public PositionCandidate(int positionID, int candidateID) {
        this.positionID = positionID;
        this.candidateID = candidateID;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }

    public void setCandidateID(int candidateID) {
        this.candidateID = candidateID;
    }

    public int getPositionID() {
        return positionID;
    }

    public int getCandidateID() {
        return candidateID;
    }
    
    
}
