package com.moudel.service;

import com.moudel.bean.Users;

public interface UserService {
    Users loginChek(String name, String pwd);
    boolean registerChek(Users users);
}
