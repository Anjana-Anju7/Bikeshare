/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
/**
 *
 * @author softnut
 */
public class ChatsModel {
    private String message;
    private Timestamp date_sent;
    private UserModel sender;
    private UserModel receipient;

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    
    /**
     * @return the date_sent
     */
    public Timestamp getDate_sent() {
        return date_sent;
    }

    /**
     * @param date_sent the date_sent to set
     */
    public void setDate_sent(Timestamp date_sent) {
        this.date_sent = date_sent;
    }

    /**
     * @return the sender
     */
    public UserModel getSender() {
        return sender;
    }

    /**
     * @param sender the sender to set
     */
    public void setSender(UserModel sender) {
        this.sender = sender;
    }

    /**
     * @return the receipient
     */
    public UserModel getReceipient() {
        return receipient;
    }

    /**
     * @param receipient the receipient to set
     */
    public void setReceipient(UserModel receipient) {
        this.receipient = receipient;
    }
}
