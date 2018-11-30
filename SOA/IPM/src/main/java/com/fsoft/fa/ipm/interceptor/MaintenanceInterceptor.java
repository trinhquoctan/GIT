
package com.fsoft.fa.ipm.interceptor;

import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MaintenanceInterceptor extends HandlerInterceptorAdapter{
    private int maintenanceStartTime;
    private int maintenanceEndTime;

    public MaintenanceInterceptor(int maintenanceStartTime, int maintenanceEndTime) {
        this.maintenanceStartTime = maintenanceStartTime;
        this.maintenanceEndTime = maintenanceEndTime;
    }
    
    public void setMaintenanceStartTime(int maintenanceStartTime) {
        this.maintenanceStartTime = maintenanceStartTime;
    }

    public void setMaintenanceEndTime(int maintenanceEndTime) {
        this.maintenanceEndTime = maintenanceEndTime;
    }

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
            throws Exception{
//        Calendar cal = Calendar.getInstance();
//        int hour = cal.get(Calendar.HOUR_OF_DAY);
//        
//        if(hour>= maintenanceStartTime && hour<=maintenanceEndTime){
//            res.sendRedirect("maintenance");
//            return false;
//        }        
        return true;
    }
    
    
}
