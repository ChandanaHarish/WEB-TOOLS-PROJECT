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
@Table(name = "medicines")
public class Medicine implements Externalizable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long medicineID;
	
	@Column(name = "medicineName", unique = true, nullable = false)
	private String medicineName;

	@Column(name = "medicineDescription", unique = true, nullable = false)
	private String medicineDescription;

	@Column(name = "price", nullable = false)
	private float price;
	
	public Medicine() {
		
	}
	
	public Medicine(String medicineName, String medicineDescription, float price) {
		super();
		this.medicineName = medicineName;
		this.medicineDescription = medicineDescription;
		this.price = price;
	}

	public long getMedicineID() {
		return medicineID;
	}

//	public void setMedicineID(long medicineID) {
//		this.medicineID = medicineID;
//	}

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	public String getMedicineDescription() {
		return medicineDescription;
	}

	public void setMedicineDescription(String medicineDescription) {
		this.medicineDescription = medicineDescription;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		// TODO Auto-generated method stub
		out.writeLong(medicineID);
		out.writeUTF(medicineName);
		out.writeUTF(medicineDescription);
		out.writeFloat(price);
		
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
		medicineID = in.readLong();
		medicineName = in.readUTF();
		medicineDescription = in.readUTF();
		price = in.readFloat();
		
	}

}
