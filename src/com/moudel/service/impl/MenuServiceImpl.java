package com.moudel.service.impl;

import com.moudel.bean.Menus;
import com.moudel.bean.Page;
import com.moudel.dao.MenusDao;
import com.moudel.dao.impl.MenusDaoImpl;
import com.moudel.service.MenusService;

public class MenuServiceImpl implements MenusService {
    Integer menusAllCount = null;
    MenusDao menusDao = new MenusDaoImpl();

    @Override
    public Page selectMenus(Page page) {
        return menusDao.selectMenus(page);
    }

    @Override
    public Integer menusAllCount() {
        return menusAllCount = menusDao.menusAllCount();
    }

    @Override
    public Integer menusAllPage(Integer perPageCount) {
        return menusAllCount() % perPageCount == 0 ? menusAllCount / perPageCount : menusAllCount / perPageCount + 1;
    }

    @Override
    public boolean delMenus(Integer id) {
        return menusDao.delMenus(id) ==1;
    }

    @Override
    public Menus selectMenusById(Integer id) {
        return menusDao.selectMenusById(id);
    }

    @Override
    public boolean updateMenus(Menus menus) {
        return chekMenusByNameIfExistence(menus) && menusDao.updateMenus(menus) == 1;
    }

    @Override
    public boolean chekMenusByNameIfExistence(Menus menus) {
        String name = menus.getName();
        Menus menusInDB = menusDao.selectMenusByName(name);
        return (menusInDB == null || menusInDB.getId() == menus.getId());
    }

    @Override
    public boolean addMenus(Menus menus) {
        return chekMenusByNameIfExistence(menus) && menusDao.addMenus(menus) ==1;
    }

}
