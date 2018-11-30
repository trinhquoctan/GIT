package com.fsoft.fa.ipm.model;

public class EntryTest {
    
    private int id;
    private String name;
    private int positionID;
    private int candidateID;
    private int round;
    private String result;

    public EntryTest() {
    }

    public EntryTest(String name, int positionID, int candidateID, int round, String result) {
        this.name = name;
        this.positionID = positionID;
        this.candidateID = candidateID;
        this.round = round;
        this.result = result;
    }

    public EntryTest(int id, String name, int positionID, int candidateID, int round, String result) {
        this.id = id;
        this.name = name;
        this.positionID = positionID;
        this.candidateID = candidateID;
        this.round = round;
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPositionID() {
        return positionID;
    }

    public int getCandidateID() {
        return candidateID;
    }

    public int getRound() {
        return round;
    }

    public String getResult() {
        return result;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
    }

    public void setCandidateID(int candidateID) {
        this.candidateID = candidateID;
    }

    public void setRound(int round) {
        this.round = round;
    }

    public void setResult(String result) {
        this.result = result;
    }
    
}
