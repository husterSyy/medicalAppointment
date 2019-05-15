package com.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class ApplicationContextProvider implements ApplicationContextAware {
	//������ʵ�����
	private static ApplicationContext applicationContext;
	
	@SuppressWarnings("static-access")
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
	public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
	public static Object getBean(String name) {
        return getApplicationContext().getBean(name);
    }
	//�������õ�bean
	public static <T> T getBean(Class<T> c) {
        return getApplicationContext().getBean(c);
    }
}
