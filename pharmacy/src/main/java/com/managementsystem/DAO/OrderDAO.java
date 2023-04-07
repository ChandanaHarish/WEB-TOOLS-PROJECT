package com.managementsystem.DAO;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Repository;

import com.managementsystem.model.Order;

@Repository
public class OrderDAO extends DAO{
	public OrderDAO() {
		
	}
	
	public void placeOrder(Order order) {
		try {
			begin();
			save(order);
			commit();
		} catch (HibernateException e) {
			rollback();
			System.out.println("Could not save order ----\n" + e);
		}
	}
	

}
