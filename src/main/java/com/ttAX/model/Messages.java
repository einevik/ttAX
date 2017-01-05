package com.ttAX.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
public class Messages {
    private int idMessage;
    private String sender;
    private String recipient;
    private Date date;
    private Time time;
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

    @Basic
    @Column(name = "date", nullable = true)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "time", nullable = true)
    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
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
        if (date != null ? !date.equals(messages.date) : messages.date != null) return false;
        if (time != null ? !time.equals(messages.time) : messages.time != null) return false;
        if (theme != null ? !theme.equals(messages.theme) : messages.theme != null) return false;
        if (text != null ? !text.equals(messages.text) : messages.text != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idMessage;
        result = 31 * result + (sender != null ? sender.hashCode() : 0);
        result = 31 * result + (recipient != null ? recipient.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (theme != null ? theme.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
