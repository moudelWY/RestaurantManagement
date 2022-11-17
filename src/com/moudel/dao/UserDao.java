package com.moudel.dao;

import com.moudel.bean.Users;

public interface UserDao {
    Users getUsersByName(String name);
    boolean registerUser(Users users);
}
