/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Bean.Court;
import JDBC.JDBCUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * @author User
 */
@WebServlet(name = "courtUpdateServlet", urlPatterns = {"/courtUpdateServlet"})
public class courtUpdateServlet extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;

    public void init() throws ServletException {
        String driver = "com.mysql.jdbc.Driver";

        String dbName = "futsal";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";

        jdbcUtility = new JDBCUtility(driver,
                url,
                userName,
                password);

        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        //Get the session object

        HttpSession session = request.getSession();

        ArrayList courtList = new ArrayList();

        //get form data from VIEW > V-I        
        String courtName = request.getParameter("courtName");
        String courtType = request.getParameter("courtType");
        String price = request.getParameter("price");
        String courtID = request.getParameter("courtID");

        String sqlUpdate = "UPDATE court SET courtName= ?, courtType= ?, price= ? WHERE courtID = ?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
            preparedStatement.setString(1, courtName);
            preparedStatement.setString(2, courtType);
            preparedStatement.setString(3, price);
            preparedStatement.setString(4, courtID);
            preparedStatement.executeUpdate();

            String sqlQuery = "SELECT * FROM court ORDER BY courtName ASC";

            preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                courtName = rs.getString("courtName");
                courtType = rs.getString("courtType");
                //String courtStat = rs.getString("courtStat");
                double price1 = rs.getDouble("price");
                int courtID1 = rs.getInt("courtID");

                Court court = new Court();
                court.setCourtName(courtName);
                court.setCourtType(courtType);
                // court.setCourtStat(courtStat); 
                court.setPrice(price1);
                court.setCourtID(courtID1);
                courtList.add(court);
            }

            out.println(courtName);
            out.println(courtType);
            out.println(price);

        } catch (Exception ex) {
            out.println(ex);
        }

        session.setAttribute("courtlist", courtList);
        response.sendRedirect(request.getContextPath() + "/viewCourtServlet");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
