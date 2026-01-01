package com.project.event_management;

import jakarta.servlet.ServletContextAttributeListener;
import jakarta.servlet.ServletRequestAttributeEvent;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.annotation.WebListener;


//@WebListener
public class RequestListner implements ServletRequestListener, ServletContextAttributeListener {
	
	

	public void requestIntialized(ServletRequestEvent sre) {
		System.out.println("Request Object Created");
		
	}
	
	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("Request Object Destoyed");
	}
	
	
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		System.out.println("Attribute added" +srae.getName());
	}
	

	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		System.out.println("Attribute removed");
	}
	
	
}
