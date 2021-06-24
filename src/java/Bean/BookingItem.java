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
public class BookingItem extends Booking{
    
    
    Item item = new Item();
    
    
    public void setItem(Item item){
        this.item = item;
    }
    public Item getItem(){
        return item;
    }
    
      /**
     * @return the bookingID*/
   }
