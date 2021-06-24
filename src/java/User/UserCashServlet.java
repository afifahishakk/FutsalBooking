/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import JDBC.JDBCUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author USER
 */
@WebServlet(name = "UserCashServlet", urlPatterns = {"/UserCashServlet"})
public class UserCashServlet extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;

    /**
     * @throws ServletException
     */
    @Override
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

        //get form data from VIEW > V-I
        String bookingID = request.getParameter("bookingID");
        String fullname = request.getParameter("fullname");
        String cvv = request.getParameter("cvv");
        String cardNo = request.getParameter("cardNo");
        String month = request.getParameter("month");
        String year = request.getParameter("year");

        String sqlInsert = "INSERT INTO creditcard(fullname, cvv, cardNo, month, year) VALUES(?, ?, ?, ?, ?)";
        String sqlUpdate = "UPDATE booking SET payStatus = 'approve' WHERE bookingID = ?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, cvv);
            preparedStatement.setString(3, cardNo);
            preparedStatement.setString(4, month);
            preparedStatement.setString(5, year);
            preparedStatement.executeUpdate();

            PreparedStatement updateStatement = con.prepareStatement(sqlUpdate);
            updateStatement.setString(1, bookingID);
            updateStatement.executeUpdate();
            //HttpSession session = request.getSession();
            //session.setAttribute("card", card);  

            response.sendRedirect(request.getContextPath() + "/paymentstatus.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println(ex);
        }
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
