package com.fsd.spring.model;

import com.fsd.spring.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class UserServiceDetails implements UserDetails {
    private static final Logger log = LoggerFactory.getLogger(UserServiceDetails.class);
    private User user;

    public UserServiceDetails(User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        log.debug("User >>>>>>> "+user);
        System.out.println("User >>>>>>> "+user);
        return  Stream.of(new SimpleGrantedAuthority(user.getUserRole().getName().toString()))
                .collect(Collectors.toList());

    }

    public int getId() {
        return user.getId();
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public User getUserDetails() {
        return user;
    }
}
