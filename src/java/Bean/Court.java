/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;

/**
 *
 */
public class Court implements Serializable {

    private String courtName;
    private String courtType;
    private String courtStat;
    private int courtID;
    private double price;

    //overloading constructor
    public Court() {
    }

    public Court(String courtName, String courtType, String courtStat, int courtID, double price) {
        this.courtName = courtName;
        this.courtType = courtType;
        this.courtStat = courtStat;
        this.courtID = courtID;
        this.price = price;
    }

    /**
     * @return the courtID
     */
    public int getCourtID() {
        return courtID;
    }

    /**
     * @param courtID the courtID to set
     */
    public void setCourtID(int courtID) {
        this.courtID = courtID;
    }

    /**
     * @return the courtType
     */
    public String getCourtType() {
        return courtType;
    }

    /**
     * @param courtType the courtType to set
     */
    public void setCourtType(String courtType) {
        this.courtType = courtType;
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
     * @return the courtStat
     */
    public String getCourtStat() {
        return courtStat;
    }

    /**
     * @param courtStat the courtStat to set
     */
    public void setCourtStat(String courtStat) {
        this.courtStat = courtStat;
    }

    /**
     * @return the courtName
     */
    public String getCourtName() {
        return courtName;
    }

    /**
     * @param courtName the courtName to set
     */
    public void setCourtName(String courtName) {
        this.courtName = courtName;
    }

}
