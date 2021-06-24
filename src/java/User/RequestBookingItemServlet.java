/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Bean.BookingItem;
import Bean.Item;
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
 * @author USER
 */
@WebServlet(name = "RequestBookingItemServlet", urlPatterns = {"/RequestBookingItemServlet"})
public class RequestBookingItemServlet extends HttpServlet {

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

            //get user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("memberprofile");

            //Retrieve data using POST method
            //Store into local variable
            int itemID = Integer.parseInt(request.getParameter("itemID"));
            String itemType = request.getParameter("itemType");
            String itemName = request.getParameter("itemName");
            String book_date = request.getParameter("bookdate");
            out.println(book_date);

            //convert string to Date format
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
            String sqlInsert = "INSERT INTO bookingitem(itemName, itemType, bookingStat, itemID, username, payStatus, book_date) VALUES(?, ?, 'pending', ?, ?, 'pending',?)";

            try {

                PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);

                preparedStatement.setString(1, itemName);
                preparedStatement.setString(2, itemType);
                preparedStatement.setInt(3, itemID);
                preparedStatement.setString(4, username);
                preparedStatement.setString(5, book_date);
                preparedStatement.executeUpdate();

                //get price using itemID
                String sqlQuery = "SELECT * FROM bookingitem";
                preparedStatement = con.prepareStatement(sqlQuery);
                ResultSet rs = preparedStatement.executeQuery();
                BookingItem bookingitem = new BookingItem();
                Item item = new Item();
                while (rs.next()) {

                    int item_ID = rs.getInt("itemID");
                    String cName = rs.getString("itemName");
                    String cType = rs.getString("itemType");
                    int bookID = rs.getInt("bookingID");
                    String bookingStat = rs.getString("bookingStat");
                    String payStatus = rs.getString("payStatus");
                    String bookdate = rs.getString("book_date");
                    String uname = rs.getString("username");

                    item.setItemID(item_ID);
                    bookingitem.setUsername(uname);
                    bookingitem.setBookDate(bookdate);
                    item.setItemType(cType);
                    bookingitem.setBookingStat(bookingStat);
                    bookingitem.setPayStatus(payStatus);
                    bookingitem.setBookingID(bookID);
                    item.setItemName(cName);

                }

                session.setAttribute("newly", bookingitem);

                response.sendRedirect(request.getContextPath() + "/requestitemstatus.jsp");
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
