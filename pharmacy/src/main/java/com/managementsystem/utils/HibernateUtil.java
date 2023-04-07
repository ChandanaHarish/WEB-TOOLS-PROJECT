package com.managementsystem.utils;

import javax.persistence.EntityManagerFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HibernateUtil {
	@Autowired
	private EntityManagerFactory emf;
	
	@Bean
	public SessionFactory getSessionFactory() {
		if(emf.unwrap(SessionFactory.class) == null) {
			throw new NullPointerException("The factory obtained is not a hibernate factory");
		}
		return emf.unwrap(SessionFactory.class);
	}

}
