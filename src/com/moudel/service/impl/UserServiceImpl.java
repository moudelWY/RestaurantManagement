package com.moudel.service.impl;

import com.moudel.bean.Users;
import com.moudel.dao.UserDao;
import com.moudel.dao.impl.UserDaoImpl;
import com.moudel.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();
    @Override
    public Users loginChek(String name, String pwd) {
        Users user = userDao.getUsersByName(name);
        return user != null && user.getPwd().equals(pwd)? user : null;
    }

    @Override
    public boolean registerChek(Users users) {
        Users user = userDao.getUsersByName(users.getName());
        if (user != null){
            return false;
        }else {
            return  userDao.registerUser(users);
        }

    }
}
