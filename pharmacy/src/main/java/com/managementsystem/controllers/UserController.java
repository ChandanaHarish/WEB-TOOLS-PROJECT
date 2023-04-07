package com.managementsystem.controllers;

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
import com.managementsystem.DAO.PersonalCareDAO;
import com.managementsystem.DAO.UserDAO;
import com.managementsystem.model.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private PersonalCareDAO personalCareDAO;
	
	@Autowired
	private MedicineDAO medicineDAO;
	
	@RequestMapping(value = "/addUser.htm", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpSession session) {
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String firstname = request.getParameter("firstname").trim();
		String lastname = request.getParameter("lastname").trim();
		int age = 0;
		if(null != request.getParameter("age").trim() && !request.getParameter("age").trim().isEmpty()) {
			age = Integer.parseInt(request.getParameter("age").trim());
		}
		
		String role = request.getParameter("role").trim();
		String address = request.getParameter("address").trim();
		User user = new User(firstname, lastname, username, password, address, role, age);
		userDAO.addUser(user);
		return new ModelAndView("ManageUsers");
	}
	
	@RequestMapping(value = "/signup.htm", method = RequestMethod.POST)
	public ModelAndView saveUser(HttpServletRequest request, HttpSession session) {
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String firstname = request.getParameter("firstname").trim();
		String lastname = request.getParameter("lastname").trim();
		int age = 0;
		if(null != request.getParameter("age").trim() && !request.getParameter("age").trim().isEmpty()) {
			age = Integer.parseInt(request.getParameter("age").trim());
		}
		
		String role = request.getParameter("role").trim();
		String address = request.getParameter("address").trim();
		User user = new User(firstname, lastname, username, password, address, role, age);
		userDAO.addUser(user);
		session.setAttribute("isLoggedin", true);
		session.setAttribute("currentUser", user);
		switch(role) {
		case "Admin":
			return new ModelAndView("AdminDashboard", "user", user);
		case "Supplier":
			List list = personalCareDAO.searchForPersonalCare("");
			return new ModelAndView("SupplierDashboard", "searchResult", list);
		case "Consumer":
			List MedicinesList = medicineDAO.searchForMedicine("");
			return new ModelAndView("CustomerDashboard", "searchResult", MedicinesList);
		default:
			MedicinesList = medicineDAO.searchForMedicine("");
			return new ModelAndView("CustomerDashboard", "searchResult", MedicinesList);
		}
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();

		if (null != username && null != password && !username.isEmpty() && !password.isEmpty()) {
			User loggedinUser = userDAO.checkLogin(username, password);
			if (null != loggedinUser) {
				session.setAttribute("isLoggedin", true);
				session.setAttribute("currentUser", loggedinUser);
				switch (loggedinUser.getRole()) {
				case "Admin":
					return new ModelAndView("AdminDashboard", "user", loggedinUser);
				case "Supplier":
					List list = personalCareDAO.searchForPersonalCare("");
					return new ModelAndView("SupplierDashboard", "searchResult", list);
				case "Consumer":
					List MedicinesList = medicineDAO.searchForMedicine("");
					return new ModelAndView("CustomerDashboard", "searchResult", MedicinesList);
				default:
					MedicinesList = medicineDAO.searchForMedicine("");
					return new ModelAndView("CustomerDashboard", "searchResult", MedicinesList);
				}
			} else {
				session.setAttribute("isLoggedin", false);
				return new ModelAndView("LoginFail");
				}
			} else {
				return null;
			}
	}
	
	@RequestMapping(value = "/search.htm", method = RequestMethod.POST)
	public ModelAndView searchForUsers(HttpServletRequest request) {
		String searchTerm = request.getParameter("searchTerm");
		List usersList;
		if (null != searchTerm) {
			if (searchTerm.isEmpty()) {
				usersList = userDAO.searchForUsers(searchTerm);
			} else {
				usersList = userDAO.searchForUsers(searchTerm);
			}
			return new ModelAndView("SearchResult", "searchResult", usersList);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/deleteUser.htm", method = RequestMethod.POST)
	public ModelAndView deleteUser(HttpServletRequest request) {
		User userToBeDeleted = null;
		Gson gson = new Gson();
		userToBeDeleted = gson.fromJson(request.getParameter("selectedRow"), User.class);
		List usersList;
		if (userToBeDeleted != null) {
			usersList = userDAO.deleteuser(userToBeDeleted);
			return new ModelAndView("SearchResult", "searchResult", usersList);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/navigateToUpdateUser.htm", method = RequestMethod.POST)
	public ModelAndView navigateUpdateUser(HttpServletRequest request, HttpSession session) {
		User userToBeUpdated = null;
		Gson gson = new Gson();
		userToBeUpdated = gson.fromJson(request.getParameter("selectedRow"), User.class);
		return new ModelAndView("UpdateUser", "userData", userToBeUpdated);

	}
	
	@RequestMapping(value = "/updateUser.htm", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest request, HttpSession session) {
		String firstname = request.getParameter("firstname").trim();
		String lastname = request.getParameter("lastname").trim();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		int age = 0;
		if (null != request.getParameter("age").trim() && !request.getParameter("age").trim().isEmpty()) {
			age = Integer.parseInt(request.getParameter("age").trim());
		}

		String role = request.getParameter("role").trim();
		String address = request.getParameter("address").trim();
		User user = new User(firstname, lastname, username, password, address, role, age);
		List usersList;
		usersList = userDAO.updateuser(user);
		if (usersList != null)
			return new ModelAndView("SearchResult", "searchResult", usersList);
		return null;

	}
}
