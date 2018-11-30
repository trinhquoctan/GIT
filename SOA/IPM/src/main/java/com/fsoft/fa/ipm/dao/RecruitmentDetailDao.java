package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.model.RecruitmentDetail;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class RecruitmentDetailDao {
    
    public static final boolean ASCENDING = true;
    public static final boolean DESCENDING = false;
    
    public static void sortByTitle(List<RecruitmentDetail> lst) {
        for(int i = 0; i < lst.size(); i++)
        {
            for(int j = i+1; j < lst.size(); j++)
            {
                if(lst.get(i).getTitle().compareTo(lst.get(j).getTitle()) > 0)
                {
                    RecruitmentDetail tmp = new RecruitmentDetail(lst.get(i));
                    lst.set(i, lst.get(j));
                    lst.set(j, tmp);
                }
            }
        }
    }
    
    public static void sortByCreatedDate(List<RecruitmentDetail> lst) {
        for(int i = 0; i < lst.size(); i++)
        {
            for(int j = i+1; j < lst.size(); j++)
            {
                if(lst.get(i).getDate_create().compareTo(lst.get(j).getDate_create()) < 0)
                {
                    RecruitmentDetail tmp = new RecruitmentDetail(lst.get(i));
                    lst.set(i, lst.get(j));
                    lst.set(j, tmp);
                }
            }
        }
    }
    
    public static void sortBySalary(List<RecruitmentDetail> lst, boolean ascending) {
        for(int i = 0; i < lst.size(); i++)
        {
            for(int j = i+1; j < lst.size(); j++)
            {
                boolean condition = ascending ? lst.get(i).getSalary() > lst.get(j).getSalary() : lst.get(i).getSalary() < lst.get(j).getSalary();
                if(condition)
                {
                    RecruitmentDetail tmp = new RecruitmentDetail(lst.get(i));
                    lst.set(i, lst.get(j));
                    lst.set(j, tmp);
                }
            }
        }
    }
    
}
