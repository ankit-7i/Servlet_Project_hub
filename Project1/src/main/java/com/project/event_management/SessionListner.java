package com.project.event_management;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionListner implements HttpSessionListener, HttpSessionAttributeListener {
	
	
	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		System.out.println("Session Object Created");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		System.out.println("Session Object Destroyed");
	}
	
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent hsbe) {
		System.out.println("Attribute added to the session "+hsbe.getName());
	}
	@Override
	public void attributeRemoved(HttpSessionBindingEvent hsbe) {
		System.out.println("Attribute Removed from the Session");
	}

}
