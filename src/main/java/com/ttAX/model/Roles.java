package com.ttAX.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
public class Roles {
    private int idRole;
    private String login;
    private String role;

    private Users users;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "roles")
    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        users.setRoles(this);
        this.users = users;
    }

    @Id
    @Column(name = "id_role", nullable = false)
    @GenericGenerator(name="generator", strategy="increment")
    @GeneratedValue(generator="generator")
    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
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
    @Column(name = "role", nullable = true, length = 255)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Roles roles = (Roles) o;

        if (idRole != roles.idRole) return false;
        if (login != null ? !login.equals(roles.login) : roles.login != null) return false;
        if (role != null ? !role.equals(roles.role) : roles.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idRole;
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }
}
