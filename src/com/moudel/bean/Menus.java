package com.moudel.bean;

import lombok.Data;

@Data
public class Menus {
    private Integer id;
    private String name;
    private Integer typeid;
    private String burden;
    private String brief;
    private Double price;
    private Integer sums;
    private Double price1;
    private Integer sums1;
    private String imgpath;

    public Menus() {
    }

    public Menus(Integer id, String name, Integer typeid, String burden, String brief, Double price, Integer sums, Double price1, Integer sums1, String imgpath) {
        this.id = id;
        this.name = name;
        this.typeid = typeid;
        this.burden = burden;
        this.brief = brief;
        this.price = price;
        this.sums = sums;
        this.price1 = price1;
        this.sums1 = sums1;
        this.imgpath = imgpath;
    }
}
