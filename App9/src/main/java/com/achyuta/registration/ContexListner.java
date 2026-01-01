package com.achyuta.registration;

import jakarta.servlet.ServletContextAttributeEvent;
import jakarta.servlet.ServletContextAttributeListener;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

//@WebListener
public class ContexListner implements ServletContextListener,ServletContextAttributeListener {
	
	@Override
	public void contextInitialized(ServletContextEvent et) {
		System.out.println("Context Object Created");
		System.out.println("Application deployed "+et.getServletContext().getServerInfo());
	}
	@Override
	public void contextDestroyed (ServletContextEvent et) {
		System.out.println("Context Object destroyed");
	}
	@Override
	public void attributeAdded(ServletContextAttributeEvent evt) {
		System.out.println("Attribute added to the Context Object :==>"+evt.getName());
	}
	@Override
	public void attributeRemoved(ServletContextAttributeEvent evt) {
		System.out.println("Attribute removed from the Context Object ");
	}

}
