package com.fsd.spring.repository;

import com.fsd.spring.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
    User getUserByUsername(String username);
}
