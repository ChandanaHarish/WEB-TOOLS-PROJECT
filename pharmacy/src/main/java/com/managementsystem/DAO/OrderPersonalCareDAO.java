package com.managementsystem.DAO;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Repository;

import com.managementsystem.model.PersonalCareOrder;

@Repository
public class OrderPersonalCareDAO extends DAO{
	public OrderPersonalCareDAO() {
		
	}
	
	public void addOrderPersonalCare(PersonalCareOrder pcorder) {
		try {
			begin();
			save(pcorder);
			commit();
		} catch(HibernateException e) {
			rollback();
			System.out.println("Could not save order" + e);
		}
	}
}
