package com.managementsystem.controllers;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.managementsystem.DAO.MedicineDAO;
import com.managementsystem.DAO.OrderDAO;
import com.managementsystem.DAO.OrderPersonalCareDAO;
import com.managementsystem.DAO.PersonalCareDAO;
import com.managementsystem.DAO.UserDAO;
import com.managementsystem.model.Medicine;
import com.managementsystem.model.Order;
import com.managementsystem.model.PersonalCare;
import com.managementsystem.model.PersonalCareOrder;
import com.managementsystem.model.User;



@Controller
public class OrderPageController {
	
	@Autowired
	private MedicineDAO medicineDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PersonalCareDAO personalCareDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderPersonalCareDAO pcDAO;
	
	private Medicine selectedMedicine;
	
	
	@RequestMapping(value = "/createOrder.htm", method = RequestMethod.POST)
	public ModelAndView createOrder(HttpServletRequest request, HttpSession session) {
		Enumeration<String> parameternames = request.getParameterNames();
		float totalcost = 0f;
		String[] personalCarenames = request.getParameterValues("PersonalCareCheckbox");
		List<PersonalCare> personalCareList = new ArrayList<>();
		
		
		for(String personalCareName : personalCarenames) {
			PersonalCare tempPC = (PersonalCare) personalCareDAO.searchForPersonalCare(personalCareName).get(0);
			personalCareList.add(tempPC);
			totalcost += tempPC.getPersonalCarePrice();
				
			}
		
		totalcost += selectedMedicine.getPrice();
		Medicine medicine = (Medicine) medicineDAO.searchForMedicine(selectedMedicine.getMedicineName()).get(0);
		Order order = new Order((User) session.getAttribute("currentUser"), medicine, totalcost);
		orderDAO.placeOrder(order);
		
		for(PersonalCare pc : personalCareList) {
			PersonalCareOrder pco = new PersonalCareOrder(order, pc);
			pcDAO.addOrderPersonalCare(pco);
			pc.setPersonalCareQuantity(pc.getPersonalCareQuantity() - 1);
			personalCareDAO.addPersonalCare(pc);
		}
		session.setAttribute("personalcare", personalCareList);
		return new ModelAndView("OrderSuccessful", "order", order);
	}


	public static boolean isNumeric(String strNum) {
		if (strNum == null) {
			return false;
		}
		try {
			float f = Float.parseFloat(strNum);
		} catch (NumberFormatException nfe) {
			return false;
		}
		return true;
	}
	
	@RequestMapping(value = "/choosePersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView choosePersonalCare(HttpServletRequest request, HttpSession session) {
		Gson gson = new Gson();
		selectedMedicine = gson.fromJson(request.getParameter("selectedRow"), Medicine.class);
		List<PersonalCare> personalcare = personalCareDAO.searchForPersonalCare("");
		return new ModelAndView("ChoosePersonalCare", "PersonalCareData", personalcare);
	}
}
