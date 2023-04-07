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
import com.managementsystem.DAO.PersonalCareDAO;
import com.managementsystem.model.PersonalCare;


@Controller
public class PersonalCareController {

	@Autowired
	private PersonalCareDAO pcdao;
	
	@RequestMapping(value = "/addPersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView addPersonalCare(HttpServletRequest request, HttpSession session) {
		String personalCareName = request.getParameter("personalCareName").trim();
		int personalCareQuantity = Integer.parseInt(request.getParameter("personalCareQuantity").trim());
		Float personalCarePrice = Float.parseFloat(request.getParameter("personalCarePrice").trim());
		PersonalCare pc = new PersonalCare(personalCareName, personalCareQuantity, personalCarePrice);
		pcdao.addPersonalCare(pc);
		return new ModelAndView("ManagePersonalCare");
	}
	
	@RequestMapping(value = "/searchPersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView searchPC(HttpServletRequest request) {
		String searchTerm = request.getParameter("searchTerm");
		List pcList;
		if(null != searchTerm) {
			if(searchTerm.isEmpty()) {
				pcList = pcdao.searchForPersonalCare(searchTerm);
			} else {
				pcList = pcdao.searchForPersonalCare(searchTerm);
			}
			return new ModelAndView("SearchResultPersonalCare", "searchResult", pcList);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/navigateToUpdatePersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView navigateUpdatePersonalCare(HttpServletRequest request) {
		PersonalCare updatePC = null;
		Gson gson = new Gson();
		updatePC = gson.fromJson(request.getParameter("selectedRow"), PersonalCare.class);
		return new ModelAndView("UpdatePersonalCare", "PersonalCareData", updatePC);
	}
	
	@RequestMapping(value = "/deletePersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView deletePersonalCare(HttpServletRequest request) {
		PersonalCare deletePC = null;
		Gson gson = new Gson();
		deletePC = gson.fromJson(request.getParameter("selectedRow"), PersonalCare.class);
		List pclist;
		if (deletePC != null) {
			pclist = pcdao.deletePersonalCare(deletePC);
			return new ModelAndView("SearchResultPersonalCare", "searchResult", pclist);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/updatePersonalCare.htm", method = RequestMethod.POST)
	public ModelAndView updatePersonalCare(HttpServletRequest request) {
		String personalCareName = request.getParameter("personalCareName").trim();
		int personalCareQuantity = Integer.parseInt(request.getParameter("personalCareQuantity").trim());
		Float personalCarePrice = Float.parseFloat(request.getParameter("personalCarePrice").trim());
		PersonalCare pc = new PersonalCare(personalCareName, personalCareQuantity, personalCarePrice);
		List pclist;
		pclist = pcdao.updatePersonalCare(pc);
		if (pclist != null)
			return new ModelAndView("SupplierDashboard", "searchResult", pclist);
		return null;
	}
	
	
}
