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
 * @author Balqis
 */
@WebServlet(name = "RegisterUserServlet", urlPatterns = {"/RegisterUserServlet"})
public class RegisterUserServlet extends HttpServlet {

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
        //get data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String phoneNo = request.getParameter("phoneNo");
        int usertype = 0;

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String sqlInsert = "INSERT INTO user(fullname, username, phoneNo, email, password, usertype) VALUES(?, ?, ?, ?, ?, ?)";

            try {
                PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);
                preparedStatement.setString(1, fullname);
                preparedStatement.setString(2, username);
                preparedStatement.setString(3, phoneNo);
                preparedStatement.setString(4, email);
                preparedStatement.setString(5, password);
                preparedStatement.setInt(6, usertype);

                preparedStatement.executeUpdate();

                /*User user = new User();
                user.setUsername(username);
                user.setEmail(email);
                user.setPassword(password);
                user.setUsertype(usertype);*/
                //sendPage(request, response, "/regsuccess.jsp");
                //Get the session object
                //sendRedirect doesn't recognise request object
                //only session
                response.sendRedirect(request.getContextPath() + "/Signin.jsp");
            } catch (SQLException ex) {
                out.println(ex);
            }
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
