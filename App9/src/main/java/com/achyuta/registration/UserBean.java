package com.achyuta.registration;

import java.io.Serializable;

public class UserBean implements Serializable{
	 
	private String userName;
	private String password;
	private String firstName;
	private String lastName;
	private String mail;
	private String phone;
	
	public UserBean() {
		super();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getMail() {
		return mail;
	}

	public String getPhone() {
		return phone;
	}
	
	

}
