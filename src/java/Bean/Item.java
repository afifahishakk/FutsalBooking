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
public class Item implements Serializable {

    private String ItemName;
    private String ItemType;
    private String ItemStat;
    private int ItemID;
    private double price;

    //overloading constructor
    public Item() {
    }

    public Item(String ItemName, String ItemType, String ItemStat, int ItemID, double price) {
        this.ItemName = ItemName;
        this.ItemType = ItemType;
        this.ItemStat = ItemStat;
        this.ItemID = ItemID;
        this.price = price;
    }

    /**
     * @return the ItemID
     */
    public int getItemID() {
        return ItemID;
    }

    /**
     * @param ItemID the ItemID to set
     */
    public void setItemID(int ItemID) {
        this.ItemID = ItemID;
    }

    /**
     * @return the ItemType
     */
    public String getItemType() {
        return ItemType;
    }

    /**
     * @param ItemType the ItemType to set
     */
    public void setItemType(String ItemType) {
        this.ItemType = ItemType;
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
     * @return the ItemStat
     */
    public String getItemStat() {
        return ItemStat;
    }

    /**
     * @param ItemStat the ItemStat to set
     */
    public void setItemStat(String ItemStat) {
        this.ItemStat = ItemStat;
    }

    /**
     * @return the ItemName
     */
    public String getItemName() {
        return ItemName;
    }

    /**
     * @param ItemName the ItemName to set
     */
    public void setItemName(String ItemName) {
        this.ItemName = ItemName;
    }

}
