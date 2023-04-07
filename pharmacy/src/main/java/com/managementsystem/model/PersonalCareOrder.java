package com.managementsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderpc")
public class PersonalCareOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long pcoID;
	
	@ManyToOne
	private Order order;
	
	@ManyToOne
	private PersonalCare personalcare;
	
	public PersonalCareOrder(Order order, PersonalCare personalcare) {
		super();
		this.order = order;
		this.personalcare = personalcare;
	}

	public long getPcoID() {
		return pcoID;
	}

//	public void setPcoID(long pcoID) {
//		this.pcoID = pcoID;
//	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public PersonalCare getPersonalcare() {
		return personalcare;
	}

	public void setPersonalcare(PersonalCare personalcare) {
		this.personalcare = personalcare;
	}
	
	
}
