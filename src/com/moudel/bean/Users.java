package com.moudel.bean;

import lombok.Data;

@Data
public class Users {
 private  Integer id;
 private String   name;
 private String   pwd;
 private String   realname;
 private String   sex;
 private String   age;
 private String   card;
 private String   address;
 private String   phone;
 private String   email;
 private String   code;
 private String   type;

 public Users() {
 }

 public Users(Integer id, String name, String pwd, String realname, String sex, String age, String card, String address, String phone, String email, String code, String type) {
  this.id = id;
  this.name = name;
  this.pwd = pwd;
  this.realname = realname;
  this.sex = sex;
  this.age = age;
  this.card = card;
  this.address = address;
  this.phone = phone;
  this.email = email;
  this.code = code;
  this.type = type;
 }
}
