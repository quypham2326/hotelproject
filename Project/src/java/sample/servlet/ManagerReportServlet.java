/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.ManageRoomDAO;
import sample.dao.ManagerDTO;
import sample.dao.ManagerErr;

/**
 *
 * @author HP
 */
public class ManagerReportServlet extends HttpServlet {

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
        Date today = new Date(System.currentTimeMillis());
        SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
        String getTime = timeformat.format(today.getTime());
        String[] report = request.getParameterValues("textReport");
        String[] check = request.getParameterValues("chkDamge");
        ManagerErr err = new ManagerErr();
        boolean checkErr = false;
        String lastSearchValue = request.getParameter("lastsearchValue");
        String urlRewritting = "ManagerShowAllServlet";
        if (lastSearchValue.length() > 0) {
            urlRewritting = "ManagerSearchServlet"
                                + "?txtSearchValue=" + lastSearchValue;
        }
        try {
            ManageRoomDAO dao = new ManageRoomDAO();
            dao.searchManager(lastSearchValue);
            List<ManagerDTO> list = dao.getList();
            if (check == null) {
                checkErr = true;
                err.setCheckrp("The checkbox must be check");
            }
            for (int i = 0; i < check.length; i++) {
                for (int j = 0; j < list.size(); j++) {
                    if (list.get(j).getRoomID().equals(check[i])) {
                        System.out.println("rp" + report[j]);
                        if (report[j].trim().length() < 1) {
                            checkErr = true;
                            err.setReportNULL("The report cannot NULL");
                        }
                        if (checkErr == false) {
                        dao.insertReport(getTime, report[j], check[i]);
                        }
                        if (checkErr) {
                            String posErr=list.get(j).getRoomID();
                            request.setAttribute("ERRORREPORT", err);
                            request.setAttribute("ERRORPOS", posErr);
                        }
                    }
                }
            }

        }  
       catch (SQLException ex) {
            log("ManagerReportServlet_ SQL" + ex.getMessage());
        } catch (NamingException ex) {
            log("ManagerReportServlet _ Naming" + ex.getMessage());
        } catch (ParseException ex) {
            log("ManagerReportServlet _ Parse" + ex.getMessage());
        }        finally {
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
