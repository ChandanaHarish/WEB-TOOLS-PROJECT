package com.managementsystem.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Order implements Serializable{
	
	private static final long serialVersionUID = -2752668888190430487L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long orderid;

	@ManyToOne
	private User customer;
	
	@ManyToOne
	private Medicine medicineorder;
	
	@Column(name = "totalcost", nullable = false)
	float totalcost;
	
	public Order() {
		
	}
	
	public Order(User customer, Medicine medicineorder,  float totalcost) {
		super();
		this.customer = customer;
		this.medicineorder = medicineorder;
		this.totalcost = totalcost;
	}

	public long getOrderid() {
		return orderid;
	}

//	public void setOrderid(long orderid) {
//		this.orderid = orderid;
//	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public Medicine getMedicineorder() {
		return medicineorder;
	}

	public void setMedicineorder(Medicine medicineorder) {
		this.medicineorder = medicineorder;
	}
	

	public float getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(float totalcost) {
		this.totalcost = totalcost;
	}
	
	
}
