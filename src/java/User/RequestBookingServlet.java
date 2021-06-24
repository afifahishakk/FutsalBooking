/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Bean.BookingCourt;
import Bean.Court;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Salma
 */
@WebServlet(name = "RequestBookingServlet", urlPatterns = {"/RequestBookingServlet"})
public class RequestBookingServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("memberprofile");
            int courtID = Integer.parseInt(request.getParameter("courtID"));
            String courtType = request.getParameter("courtType");
            String courtName = request.getParameter("courtName");
            String book_date = request.getParameter("bookdate");
            out.println(book_date);

            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            try {

                date = formatter.parse(book_date);
            } catch (Exception ex) {
            }

            //convert to mysql date
            formatter = new SimpleDateFormat("yyyy-MM-dd");
            book_date = formatter.format(date);

            String username = user.getUsername();
            String sqlInsert = "INSERT INTO booking(courtName, courtType, bookingStat, courtID, username, payStatus, book_date) VALUES(?, ?, 'pending', ?, ?, 'pending',?)";

            try {

                PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);

                preparedStatement.setString(1, courtName);
                preparedStatement.setString(2, courtType);
                preparedStatement.setInt(3, courtID);
                preparedStatement.setString(4, username);
                preparedStatement.setString(5, book_date);
                preparedStatement.executeUpdate();

                //get price using courtID
                String sqlQuery = "SELECT * FROM booking";
                preparedStatement = con.prepareStatement(sqlQuery);
                ResultSet rs = preparedStatement.executeQuery();
                BookingCourt br = new BookingCourt();
                Court court = new Court();
                while (rs.next()) {

                    int court_ID = rs.getInt("courtID");
                    String cName = rs.getString("courtName");
                    String cType = rs.getString("courtType");
                    int bookID = rs.getInt("bookingID");
                    String bookingStat = rs.getString("bookingStat");
                    String payStatus = rs.getString("payStatus");
                    String bookdate = rs.getString("book_date");
                    String uname = rs.getString("username");

                    court.setCourtID(court_ID);
                    br.setUsername(uname);
                    br.setBookDate(bookdate);
                    court.setCourtType(cType);
                    br.setBookingStat(bookingStat);
                    br.setPayStatus(payStatus);
                    br.setBookingID(bookID);
                    court.setCourtName(cName);
                    br.setCourt(court);

                }

                session.setAttribute("newly", br);

                response.sendRedirect(request.getContextPath() + "/reqbookstatus.jsp");
            } catch (SQLException ex) {

                out.println(ex);
                ex.printStackTrace();
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
