package com.ttAX.model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
//import java.security.Timestamp;
import java.util.Date;
//import java.sql.Timestamp;

@Entity
public class Messages {

    private int idMessage;
    private String sender;
    private String recipient;
    private Date dateval;
    private String theme;
    private String text;

    @Id
    @Column(name = "id_message", nullable = false)
    @GenericGenerator(name="generator", strategy="increment")
    @GeneratedValue(generator="generator")
    public int getIdMessage() {
        return idMessage;
    }

    public void setIdMessage(int idMessage) {
        this.idMessage = idMessage;
    }

    @Basic
    @Column(name = "sender", nullable = true, length = 255)
    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    @Basic
    @Column(name = "recipient", nullable = true, length = 255)
    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    @CreationTimestamp
    @Column(name = "dateval", nullable = true)
    public Date getDate() {
        return dateval;
    }

    public void setDate(Date dateval) {
        this.dateval = dateval;
    }

    @Basic
    @Column(name = "theme", nullable = true, length = 255)
    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    @Basic
    @Column(name = "text", nullable = true, length = 255)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Messages messages = (Messages) o;

        if (idMessage != messages.idMessage) return false;
        if (sender != null ? !sender.equals(messages.sender) : messages.sender != null) return false;
        if (recipient != null ? !recipient.equals(messages.recipient) : messages.recipient != null) return false;
        if (dateval != null ? !dateval.equals(messages.dateval) : messages.dateval != null) return false;
        if (theme != null ? !theme.equals(messages.theme) : messages.theme != null) return false;
        if (text != null ? !text.equals(messages.text) : messages.text != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idMessage;
        result = 31 * result + (sender != null ? sender.hashCode() : 0);
        result = 31 * result + (recipient != null ? recipient.hashCode() : 0);
        result = 31 * result + (dateval != null ? dateval.hashCode() : 0);
        result = 31 * result + (theme != null ? theme.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
