package com.managementsystem.pharmacy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

import com.managementsystem.DAO.MedicineDAO;
import com.managementsystem.DAO.OrderDAO;
import com.managementsystem.DAO.PersonalCareDAO;

@SpringBootApplication
@ComponentScan({ "com.managementsystem.controllers", "com.managementsystem.DAO" })
@EntityScan("com.managementsystem.model")
public class PharmacyApplication implements CommandLineRunner{
	@Autowired
	PersonalCareDAO personalCareDAO;
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	MedicineDAO medDAO;

	public static void main(String[] args) {
		SpringApplication.run(PharmacyApplication.class, args);
	}
	
	@Override
	public void run(String... args) throws Exception{
		System.out.println("run");
	}

}
