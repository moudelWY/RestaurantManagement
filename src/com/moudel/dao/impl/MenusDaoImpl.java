package com.moudel.dao.impl;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;
import com.moudel.dao.MenusDao;
import com.moudel.utils.JdbcUtils;
import com.moudel.view.MenusVO;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class MenusDaoImpl  implements MenusDao {
    QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
    @Override
    public Page selectMenus(Page page) {
        String sql = "SELECT  t1.* , t2.`name` as typeName  FROM   `menus` t1 LEFT JOIN `types` t2 ON t1.typeid = t2.id LIMIT ?,?;";
        Object[] params = new Object[]{page.getBeginIndex(),page.getEveryPage()};
        List<MenusVO> menusVOS = null;
        try {
            menusVOS = queryRunner.query(sql, new BeanListHandler<MenusVO>(MenusVO.class), params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        page.setList(menusVOS);
        return page;

    }

    @Override
    public Integer menusAllCount() {
        String sql = " select count(*) from menus";
        Long count = null;
        try {
            count = queryRunner.query(sql, new ScalarHandler<Long>());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       int i = count.intValue();
        return i;
    }

    @Override
    public Integer delMenus(Integer id) {
        String sql = "delete  from `menus` where `id`="+id;
        int i = 0;
        try {
            i = queryRunner.update(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return i;
    }

    @Override
    public Menus selectMenusById(Integer id) {
        String sql = "select * from `menus` where `id`= ?";
        Object[] params = new Object[]{id};
        Menus menus = null;
        try {
            menus = queryRunner.query(sql, new BeanHandler<Menus>(Menus.class),params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return menus;
    }

    @Override
    public Integer updateMenus(Menus menus) {
        String sql ="UPDATE  `menus`   SET  `name` = ?, `typeid` = ?,  burden = ? , brief = ?, price = ?, price1 =?  WHERE `id`  =?";
        Object[] params  = new Object[]{menus.getName(),menus.getTypeid(),menus.getBurden(), menus.getBrief(),menus.getPrice(),menus.getPrice1(),menus.getId()};
        int i = 0;
        try {
            i = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return i;
    }

    @Override
    public Menus selectMenusByName(String name) {
        String sql = "select * from `menus` where `name`= ?";
        Menus menus = null;
        Object[] params = new Object[]{name};
        try {
            menus = queryRunner.query(sql, new BeanHandler<Menus>(Menus.class),params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return menus;

    }

    @Override
    public Integer addMenus(Menus menus) {
        String sql ="insert into `menus` values (?,?,?,?,?,?,?,?,?,?)";
        Object[] params  = new Object[]{null,menus.getName(),menus.getTypeid(),menus.getBurden(), menus.getBrief(),menus.getPrice(),null,menus.getPrice1(),null,menus.getImgpath()};
        int i = 0;
        try {
            i = queryRunner.update(sql, params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return i;
    }

}
