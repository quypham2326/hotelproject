/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.ManageRoomDAO;
import sample.dao.ManagerDTO;
import sample.dao.ManagerErr;

/**
 *
 * @author HP
 */
public class MangerUpdateServlet extends HttpServlet {

    private final String errPage = "ManagerUpdateERR.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String[] count = request.getParameterValues("countnumb");
        String[] roomID = request.getParameterValues("roomID");
        String[] description = request.getParameterValues("description");
        String[] hour = request.getParameterValues("hourPrice");
        String[] day = request.getParameterValues("dayPrice");
        String lastSearchValue = request.getParameter("lastsearchValue");
        List<ManagerDTO> listroom;
        String urlRewritting = errPage;
        try {
            
            ManagerErr error = new ManagerErr();
            boolean checkErr = false;
            float hourprice=0;
            float dayprice=0;
            ManageRoomDAO dao = new ManageRoomDAO();
            dao.searchManager(lastSearchValue);
            listroom = dao.getList();
            for (int i = 0; i < listroom.size(); i++) {
                String[] checkbutton = request.getParameterValues("btAction" + i);
                if (checkbutton != null) {
                    String id = roomID[i - 1];
                    String descript = description[i - 1];
                    if (descript.length() < 2 || descript.length() > 250) {
                        String positionErr=roomID[i];
                        checkErr = true;
                        error.setDescriptionErr("The Description length is in range 2-250");
                    }
                    try {
                        hourprice = Float.parseFloat(hour[i - 1]);
                    } catch (NumberFormatException e) {
                        checkErr=true;
                        error.setHourPriceErr("The hourPrice is a Double Number");
                    }
                   
                    try {
                          dayprice = Float.parseFloat(day[i - 1]);
                    } catch (Exception e) {
                        checkErr=true;
                        error.setDayPriceErr("The dayPrice is a Double Number");
                    }
                    if (checkErr == false) {
                        boolean result = dao.mangerUpdate(id, descript, dayprice, hourprice);
                        if (result) {
                            urlRewritting = "ManagerShowAllServlet";
                         if (lastSearchValue.length() > 0) {
                            urlRewritting = "ManagerSearchServlet"
                                    + "?txtSearchValue=" + lastSearchValue;
                        }
                        }
                    }
                    if (checkErr) {
                        String positionErr=roomID[i-1];
                        System.out.println("pos "+positionErr);
                        request.setAttribute("ERRORPOS", positionErr);
                        request.setAttribute("ERRORUPDATE", error);
                          urlRewritting = "ManagerShowAllServlet";
                        if (lastSearchValue.length() > 0) {
                            urlRewritting = "ManagerSearchServlet"
                                    + "?txtSearchValue=" + lastSearchValue;
                        }
                    }
                }//end if

            }
        }
        catch (SQLException ex) {
            log("ManagerUpdateServlet_SQL" + ex.getMessage());
        } catch (NamingException ex) {
            log("ManagerUpdateServlet _ Naming" + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(urlRewritting);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
