package com.nyist.bysj.service;

import com.nyist.bysj.entity.User;

public interface UserService {
    public User login(String username, String password);
}
