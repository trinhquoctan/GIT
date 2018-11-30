/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.exception;

/**
 *
 * @author Datvippq
 */
public class IpmException {
    private String exceptionMsg;
   
   public IpmException(String exceptionMsg) {
      this.exceptionMsg = exceptionMsg;
   }
   public String getExceptionMsg(){
      return this.exceptionMsg;
   }
   public void setExceptionMsg(String exceptionMsg) {
      this.exceptionMsg = exceptionMsg;
   }
}
