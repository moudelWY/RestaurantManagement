package com.moudel.dao;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;

public interface MenusDao {
    Page selectMenus(Page page);
    Integer menusAllCount();
    Integer delMenus(Integer id);
    Menus selectMenusById(Integer id);
    Integer  updateMenus(Menus menus);
    Menus selectMenusByName(String name);
    Integer addMenus(Menus menus);
}
