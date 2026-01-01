package com_student;

import java.io.Serializable;

public class Userbean  implements Serializable 
{
 private String id;
 private String name;
 private String phone;
 
 public Userbean() {
	super();
 }

 public String getId() {
	return id;
 }

 public void setId(String id) {
	this.id = id;
 }

 public String getName() {
	return name;
 }

 public void setName(String name) {
	this.name = name;
 }

 public String getPhone() 
 {
	return phone;
 }

 public void setPhone(String phone) 
 {
	this.phone = phone;
 }
 
}
