package com.moudel.bean;

import lombok.Data;

@Data
public class Types {
    private  Integer id;
    private  String name;

    public Types() {
    }

    public Types(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
