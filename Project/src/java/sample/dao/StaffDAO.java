/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utilities.DBUtilities;

/**
 *
 * @author HP
 */
public class StaffDAO implements Serializable{
    List<StaffDTO> listStaff;

    public List<StaffDTO> getListStaff() {
        return listStaff;
    }
    
    public void staffSearch(String searchValue) throws SQLException,NamingException, ParseException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs= null;
        java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(searchValue);
        java.sql.Date time=new java.sql.Date(date.getTime());
        try {
            con=DBUtilities.makeConnection();
            if(con!=null){
                String sql="Select * From tbl_maintenance Where requestDate=?";
                
                stm=con.prepareStatement(sql);
                stm.setDate(1, time);
                
                rs=stm.executeQuery();
                while(rs.next()){
                    String roomID=rs.getString("roomId");
                    String reason=rs.getString("reason");
                    StaffDTO dto= new StaffDTO(roomID, reason);
                    if(listStaff==null){
                        listStaff=new ArrayList<>();
                    }
                    listStaff.add(dto);
                }
            }//end if 
        } catch (Exception e) {
        }finally{
            if(rs!=null)
                rs.close();
            if(stm!=null)
                stm.close();
            if(con!=null)
                con.close();
        }
    }
}
