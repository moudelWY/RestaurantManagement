package com.moudel.dao.impl;

import com.moudel.bean.Users;
import com.moudel.dao.UserDao;
import com.moudel.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    @Override
    public Users getUsersByName(String name) {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from users where name = ? ";
        Object[] params = new Object[]{name};
        Users user = null;
        try {
            user = queryRunner.query(sql, new BeanHandler<Users>(Users.class), params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean registerUser(Users users) {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into users value (?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = new Object[]{
                users.getId(),
                users.getName(),
                users.getPwd(),
                users.getRealname(),
                users.getSex(),
                users.getAge(),
                users.getCard(),
                users.getAddress(),
                users.getPhone(),
                users.getEmail(),
                users.getCode(),
                users.getType()};
        int update = 0;
        try {
            System.out.println(users);
            update = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return update ==1;
    }
}
