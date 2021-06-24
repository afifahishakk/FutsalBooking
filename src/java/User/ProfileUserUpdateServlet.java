/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Bean.User;
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

/**
 * @author Pika
 */
@WebServlet(name = "ProfileUserUpdateServlet", urlPatterns = {"/ProfileUserUpdateServlet"})
public class ProfileUserUpdateServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //Get the session object
            HttpSession session = request.getSession();

            User user = (User) session.getAttribute("memberprofile");
            String username = user.getUsername();

            //get form data from VIEW > V-I        
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String phoneNo = request.getParameter("phoneNo");
            String email = request.getParameter("email");

            String sqlUpdate = "UPDATE user SET password= ?, fullname= ?, phoneNo= ?, email= ?  WHERE username= ?";

            try {
                PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, fullname);
                preparedStatement.setString(3, phoneNo);
                preparedStatement.setString(4, email);
                preparedStatement.setString(5, username);
                preparedStatement.executeUpdate();

            } catch (Exception ex) {
                out.println(ex);
            }
            int usertype = user.getUsertype();
            user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setUsertype(usertype);
            user.setFullname(fullname);
            user.setPhoneNo(phoneNo);
            user.setEmail(email);
            session.setAttribute("memberprofile", user);
            response.sendRedirect(request.getContextPath() + "/viewprofile.jsp");
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
