package com.moudel.dao.impl;

import com.moudel.bean.Types;
import com.moudel.dao.TypesDao;
import com.moudel.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class TypesDaoImpl implements TypesDao {
    QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
    @Override
    public List<Types> getAllTypes() {
        String sql ="select * from types";
        List<Types> typesList = null;
        try {
            typesList = queryRunner.query(sql, new BeanListHandler<Types>(Types.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return typesList;
    }

    @Override
    public int addTypes(Types types) {
        String sql = "insert into types value ( ?,?)";
        Object[] params = new Object[]{types.getId(),types.getName()};
        System.out.println(types.getId());
        int update = 0;
        try {
            update = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return update;
    }

    @Override
    public Types selectByName(String name) {
        String sql = "select * from types where `name` = ?";
        Object[] params = new Object[]{name};
        Types types = null;
        try {
            types = queryRunner.query(sql, new BeanHandler<Types>(Types.class), params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return types;
    }

    @Override
    public Types selectById(Integer id) {
        String sql = "select * from types where id = ?";
        Object[] params = new Object[]{id};
        Types types = null;
        try {
            types = queryRunner.query(sql, new BeanHandler<Types>(Types.class), params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return types;
    }

    @Override
    public int updataTypes(Types types) {
        String sql = "update  types set `name` = ? where `id` = ?";
        Object[] params = new Object[]{types.getName(),types.getId()};
        Integer count = null;
        try {
            count = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    @Override
    public int delTypes(Integer id) {
        String sql = "delete from types where id = ?";
        Object[] params = new Object[]{id};
        int count = 0;
        try {
            count = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }
}
