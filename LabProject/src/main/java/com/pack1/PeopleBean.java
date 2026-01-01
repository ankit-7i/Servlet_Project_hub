package com.pack1;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class PeopleBean {
	
	@Setter
	@Getter
	 private String name;
	    private int age;
	    private String aadhar;
	    private String address;
	    
	    public PeopleBean() {}

}
