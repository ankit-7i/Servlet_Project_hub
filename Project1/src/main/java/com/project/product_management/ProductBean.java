package com.project.product_management;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;



public class ProductBean implements Serializable {
	@Setter
	@Getter
	private String p_code,p_name,p_company,p_price,p_qty;
	public ProductBean() {
		// TODO Auto-generated constructor stub
	}

}
