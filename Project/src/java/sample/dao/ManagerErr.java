/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;

/**
 *
 * @author HP
 */
public class ManagerErr implements Serializable{
    private String reportNULL;
    private  String checkrp;
    private String descriptionErr;
    private String hourPriceErr;
    private String dayPriceErr;
    private String dateInputErr;
    
    
    

    /**
     * @return the reportNULL
     */
    public String getReportNULL() {
        return reportNULL;
    }

    /**
     * @param reportNULL the reportNULL to set
     */
    public void setReportNULL(String reportNULL) {
        this.reportNULL = reportNULL;
    }

    public ManagerErr() {
    }

    public ManagerErr(String reportNULL) {
        this.reportNULL = reportNULL;
    }

    /**
     * @return the checkrp
     */
    public String getCheckrp() {
        return checkrp;
    }

    /**
     * @param checkrp the checkrp to set
     */
    public void setCheckrp(String checkrp) {
        this.checkrp = checkrp;
    }

    /**
     * @return the descriptionErr
     */
    public String getDescriptionErr() {
        return descriptionErr;
    }

    /**
     * @param descriptionErr the descriptionErr to set
     */
    public void setDescriptionErr(String descriptionErr) {
        this.descriptionErr = descriptionErr;
    }

    /**
     * @return the hourPriceErr
     */
    public String getHourPriceErr() {
        return hourPriceErr;
    }

    /**
     * @param hourPriceErr the hourPriceErr to set
     */
    public void setHourPriceErr(String hourPriceErr) {
        this.hourPriceErr = hourPriceErr;
    }

    /**
     * @return the dayPriceErr
     */
    public String getDayPriceErr() {
        return dayPriceErr;
    }

    /**
     * @param dayPriceErr the dayPriceErr to set
     */
    public void setDayPriceErr(String dayPriceErr) {
        this.dayPriceErr = dayPriceErr;
    }

    /**
     * @return the dateInputErr
     */
    public String getDateInputErr() {
        return dateInputErr;
    }

    /**
     * @param dateInputErr the dateInputErr to set
     */
    public void setDateInputErr(String dateInputErr) {
        this.dateInputErr = dateInputErr;
    }


    
}
