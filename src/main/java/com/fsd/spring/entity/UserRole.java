package com.fsd.spring.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "ROLE")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Enumerated(EnumType.STRING)
    private Role name;

    @OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name="USER_ROLE",
            joinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")},
            inverseJoinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")})
    private List<User> userList;

    public UserRole() {
    }

    public UserRole(Role name) {
        this.name = name;
    }

    public Role getName() {
        return name;
    }

    public void setName(Role name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", name=" + name +
                '}';
    }
}
