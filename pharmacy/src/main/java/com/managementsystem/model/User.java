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
@Table(name = "users")
public class User implements Externalizable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name="firstname", nullable=false)
	private String firstname;

	@Column(name="lastname")
	private String lastname;

	@Column(name="username", unique=true, nullable=false)
	private String username;

	@Column(name="password", nullable=false)
	private String password;

	@Column(name="address")
	private String address;

	@Column(name="role", nullable=false)
	private String role;

	@Column(name="age")
	private int age;

	public User() {
		
	}
	
	public User(String firstname, String lastname, String username, String password, String address, String role, int age) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.password = password;
		this.address = address;
		this.role = role;
		this.age = age;
	}

	public long getId() {
		return id;
	}

//	public void setId(long id) {
//		this.id = id;
//	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		// TODO Auto-generated method stub
		out.writeLong(id);
		out.writeUTF(firstname);
		out.writeUTF(lastname);
		out.writeUTF(username);
		out.writeUTF(password);
		out.writeUTF(address);
		out.writeUTF(role);
		out.writeInt(age);
		
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
		id = in.readLong();
		firstname = in.readUTF();
		lastname = in.readUTF();
		username = in.readUTF();
		password = in.readUTF();
		address = in.readUTF();
		role = in.readUTF();
		age = in.readInt();
		
		
	}

}
