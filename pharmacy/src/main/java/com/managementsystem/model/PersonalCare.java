package com.managementsystem.model;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "personalcare")
public class PersonalCare implements Externalizable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long pcID;
	
	@Column(name = "personalCareName", unique = true, nullable = false)
	String personalCareName;
	
	@Column(name = "personalCareQuantity", nullable = false)
	int personalCareQuantity;
	
	@Column(name = "personalCarePrice", nullable = false)
	float personalCarePrice;

	public long getPcID() {
		return pcID;
	}

//	public void setPcID(long pcID) {
//		this.pcID = pcID;
//	}

	public String getPersonalCareName() {
		return personalCareName;
	}

	public void setPersonalCareName(String personalCareName) {
		this.personalCareName = personalCareName;
	}

	public int getPersonalCareQuantity() {
		return personalCareQuantity;
	}

	public void setPersonalCareQuantity(int personalCareQuantity) {
		this.personalCareQuantity = personalCareQuantity;
	}

	public float getPersonalCarePrice() {
		return personalCarePrice;
	}

	public void setPersonalCarePrice(float personalCarePrice) {
		this.personalCarePrice = personalCarePrice;
	}
	
	public PersonalCare(String personalCareName, int personalCareQuantity, float personalCarePrice) {
		super();
		this.personalCareName = personalCareName;
		this.personalCareQuantity = personalCareQuantity;
		this.personalCarePrice = personalCarePrice; 
	}
	
	public PersonalCare() {
		super();
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		// TODO Auto-generated method stub
		out.writeLong(pcID);
		out.writeUTF(personalCareName);
		out.write(personalCareQuantity);
		out.writeFloat(personalCarePrice);
		
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
		pcID = in.readLong();
		personalCareName = in.readUTF();
		personalCareQuantity = in.read();
		personalCarePrice = in.readFloat();
		
	}
	
	
	
	
	
}
