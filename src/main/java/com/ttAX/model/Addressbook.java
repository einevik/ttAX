package com.ttAX.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
public class Addressbook {
    private int idAddressbook;
    private String login;

    @NotEmpty
    private String recipient;

    @Id
    @GenericGenerator(name="generator", strategy="increment")
    @GeneratedValue(generator="generator")
    @Column(name = "id_addressbook", nullable = false)
    public int getIdAddressbook() {
        return idAddressbook;
    }

    public void setIdAddressbook(int idAddressbook) {
        this.idAddressbook = idAddressbook;
    }

    @Basic
    @Column(name = "login", nullable = true, length = 255)
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Basic
    @Column(name = "recipient", nullable = true, length = 255)
    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Addressbook that = (Addressbook) o;

        if (idAddressbook != that.idAddressbook) return false;
        if (login != null ? !login.equals(that.login) : that.login != null) return false;
        if (recipient != null ? !recipient.equals(that.recipient) : that.recipient != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAddressbook;
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (recipient != null ? recipient.hashCode() : 0);
        return result;
    }
}
