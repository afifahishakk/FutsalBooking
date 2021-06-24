/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author darsa
 */
public class Booking {
    
    /**
     *
     * @return the bookingID
     */
    protected int bookingID;
    protected String username;
    protected String bookingStat;
    protected double price;
    protected String payStatus;
    protected String bookDate;

    public int getBookingID() {
        return bookingID;
    }

    /**
     * @param bookingID the bookingID to set
     */
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the bookingStat
     */
    public String getBookingStat() {
        return bookingStat;
    }

    /**
     * @param bookingStat the bookingStat to set
     */
    public void setBookingStat(String bookingStat) {
        this.bookingStat = bookingStat;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the payStatus
     */
    public String getPayStatus() {
        return payStatus;
    }

    /**
     * @param payStatus the payStatus to set
     */
    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    /**
     * @return the bookDate
     */
    public String getBookDate() {
        return bookDate;
    }

    /**
     * @param bookDate the bookDate to set
     */
    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }
    
}
