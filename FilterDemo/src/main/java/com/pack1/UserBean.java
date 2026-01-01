package com.pack1;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class UserBean {
	@Setter
	@Getter
	private String u_Name,u_Pwd,u_Fname,u_Lname,u_Mail,u_ph;
	
	public UserBean() {}
	

}
