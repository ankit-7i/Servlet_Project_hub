package com.pack1;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class UserBean  implements Serializable{
	public UserBean() {}
	@Setter
	@Getter
	String userName,userMail,userMob;

}
