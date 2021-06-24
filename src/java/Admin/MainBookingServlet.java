/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Bean.BookingCourt;
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
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author User
 */
@WebServlet(name = "MainBookingServlet", urlPatterns = {"/MainBookingServlet"})
public class MainBookingServlet extends HttpServlet {

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
        HttpSession session = request.getSession();

        ArrayList bkList = new ArrayList();

        String sqlQuery = "SELECT * "
                + " FROM booking, court"
                + " WHERE booking.courtID = court.courtID"
                + " ORDER BY  bookingID ASC";

        System.out.println(sqlQuery);
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int bookingID = Integer.parseInt(rs.getString("bookingID"));
                String bookingStat = rs.getString("bookingStat");
                String username = rs.getString("username");
                int courtID = rs.getInt("courtID");
                String courtName = rs.getString("courtName");
                String courtType = rs.getString("courtType");
                double courtprice= rs.getDouble("price");
                String bookingDate = rs.getString("book_date");
                String payStatus= rs.getString("payStatus");

                Court court = new Court();
                BookingCourt bk = new BookingCourt();
                
                bk.setBookingID(bookingID);
                bk.setBookingStat(bookingStat);
                bk.setUsername(username);
                bk.setBookDate(bookingDate);
                bk.setPayStatus(payStatus);
                
                System.out.println(bk.getBookingID());
               
                court.setCourtType(courtType);
                court.setCourtName(courtName);
                court.setCourtID(courtID);
                bk.setCourt(court);
               
                bkList.add(bk);
            }
        } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println(ex);
        }

        session.setAttribute("mainbooking", bkList);
        response.sendRedirect(request.getContextPath() + "/mainbooking.jsp");
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
