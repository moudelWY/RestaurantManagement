package com.moudel.service.impl;

import com.moudel.bean.Types;
import com.moudel.dao.TypesDao;
import com.moudel.dao.impl.TypesDaoImpl;
import com.moudel.service.TypesService;

import java.util.List;

public class TypesServiceImpl implements TypesService {
  TypesDao typesDao  =    new TypesDaoImpl();
    @Override
    public List<Types> getAllTypes() {
        return  typesDao.getAllTypes();
    }

    @Override
    public boolean addTypes(Types types) {
        Types types1 = typesDao.selectByName(types.getName());
        if (types1 == null){
            typesDao.addTypes(types);
            return  true;
        }
        return false;
    }

    @Override
    public boolean delTypes(Integer id) {
        return typesDao.delTypes(id) != 0;
    }

    @Override
    public Types selectById(Integer id) {
        return typesDao.selectById(id);
    }

    @Override
    public boolean updataTypes(Types types) {
        return  typesDao.updataTypes(types) ==1 ;
    }

}
