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
public class ManagerDTO implements Serializable {

    private String roomID;
    private String description;
    private float hourPrice;
    private float dayPrice;
    private  boolean check;

    public ManagerDTO() {
    }

    public ManagerDTO(String roomID, String description, float hourPrice, float dayPrice) {
        this.roomID = roomID;
        this.description = description;
        this.hourPrice = hourPrice;
        this.dayPrice = dayPrice;
    }
    

    /**
     * @return the roomID
     */
    public String getRoomID() {
        return roomID;
    }

    /**
     * @param roomID the roomID to set
     */
    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the hourPrice
     */
    public float getHourPrice() {
        return hourPrice;
    }

    /**
     * @param hourPrice the hourPrice to set
     */
    public void setHourPrice(float hourPrice) {
        this.hourPrice = hourPrice;
    }

    /**
     * @return the dayPrice
     */
    public float getDayPrice() {
        return dayPrice;
    }

    /**
     * @param dayPrice the dayPrice to set
     */
    public void setDayPrice(float dayPrice) {
        this.dayPrice = dayPrice;
    }

    /**
     * @return the check
     */
    public boolean isCheck() {
        return check;
    }

    /**
     * @param check the check to set
     */
    public void setCheck(boolean check) {
        this.check = check;
    }
    
}
