/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.sql.Connection;
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
public class ManageRoomDAO implements Serializable {

    public int checkLogin(String username, String password) throws SQLException, NamingException {
        int role = 4;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_account Where username=? And password=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                rs = stm.executeQuery();
                if (rs.next()) {
                    role = rs.getInt("role");
                }
            }//end if con
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return role;
    }

    List<ManagerDTO> list;

    public List<ManagerDTO> getList() {
        return list;
    }

    public void searchManager(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_room Where roomID Like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");

                rs = stm.executeQuery();
                while (rs.next()) {
                    String roomID = rs.getString("roomID");
                    String description = rs.getString("description");
                    float hourPrice = rs.getFloat("hourPrice");
                    float dayPrice = rs.getFloat("dayPrice");
                    ManagerDTO dto = new ManagerDTO(roomID, description, hourPrice, dayPrice);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(dto);
                }
            }//end if
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean mangerUpdate(String roomID, String description, float dayPrice, float hourPrice) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Update tbl_room Set description=?,hourPrice=?,dayPrice=? Where roomID=? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, description);
                stm.setFloat(2, hourPrice);
                stm.setFloat(3, dayPrice);
                stm.setString(4, roomID);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }//end if
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                stm.close();
            }
        }
        return true;
    }

    public void showAllManager() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_room ";
                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String roomID = rs.getString("roomID");
                    String description = rs.getString("description");
                    float hourPrice = rs.getFloat("hourPrice");
                    float dayPrice = rs.getFloat("dayPrice");
                    ManagerDTO dto = new ManagerDTO(roomID, description, hourPrice, dayPrice);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(dto);
                }
            }//end if
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void insertReport(String reqDate, String report, String roomID) throws SQLException, NamingException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(reqDate);
        java.sql.Date time = new java.sql.Date(date.getTime());
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Insert into tbl_maintenance(requestDate,reason,roomId) Values(?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setDate(1, time);
                stm.setString(2, report);
                stm.setString(3, roomID);

                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null);
            con.close();
        }
    }

    public String getDescrip(String roomID) throws SQLException,NamingException {
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        String description="";
        try {
            con=DBUtilities.makeConnection();
            if(con!=null){
                String sql="Select description From tbl_room Where roomID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, roomID);
                
                rs=stm.executeQuery();
                
                if(rs.next()){
                    description=rs.getString("description");
                }
            }//end if
                    
        } catch (Exception e) {
        }finally{
            if (rs!=null){
                rs.close();
            }
            if (stm!=null){
                stm.close();
            }
            if (con !=null){
                con.close();
            }
        }
        return description;
    }
    public float getHourPrice(String roomID) throws SQLException,NamingException {
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        float hourPrice=0;
        try {
            con=DBUtilities.makeConnection();
            if(con!=null){
                String sql="Select hourPrice From tbl_room Where roomID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, roomID);
                
                rs=stm.executeQuery();
                
                if(rs.next()){
                    hourPrice=rs.getFloat("hourPrice");
                }
            }//end if
                    
        } catch (Exception e) {
        }finally{
            if (rs!=null){
                rs.close();
            }
            if (stm!=null){
                stm.close();
            }
            if (con !=null){
                con.close();
            }
        }
        return hourPrice;
    }
    public float getDayPrice(String roomID) throws SQLException,NamingException {
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        float dayPrice=0;
        try {
            con=DBUtilities.makeConnection();
            if(con!=null){
                String sql="Select dayPrice From tbl_room Where roomID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, roomID);
                
                rs=stm.executeQuery();
                
                if(rs.next()){
                    dayPrice=rs.getFloat("dayPrice");
                }
            }//end if
                    
        } catch (Exception e) {
        }finally{
            if (rs!=null){
                rs.close();
            }
            if (stm!=null){
                stm.close();
            }
            if (con !=null){
                con.close();
            }
        }
        return dayPrice;
    }
}
