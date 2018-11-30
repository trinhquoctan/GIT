package com.fsoft.fa.ipm.model;

import java.util.List;

public class SkillRecruitment {
    private int skillID;
    private int recruitmentID;

    public SkillRecruitment() {
    }

    public SkillRecruitment(int skillID, int recruitmentID) {
        this.skillID = skillID;
        this.recruitmentID = recruitmentID;
    }

    public int getSkillID() {
        return skillID;
    }

    public void setSkillID(int skillID) {
        this.skillID = skillID;
    }

    public int getRecruitmentID() {
        return recruitmentID;
    }

    public void setRecruitmentID(int recruitmentID) {
        this.recruitmentID = recruitmentID;
    }
    
    public Skill getSkill(List<Skill> lst) {
        for(Skill s: lst)
        {
            if(s.getId() == skillID) return s;
        }
        return null;
    }
    
}
