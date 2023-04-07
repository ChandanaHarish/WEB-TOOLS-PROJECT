package com.managementsystem.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LandingPageController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView defaultRouter(HttpSession session) {
		session.setAttribute("isLoggedin", false);
		return new ModelAndView("LandingPage");
	}

	@RequestMapping(value = "/register.htm", method = RequestMethod.GET)
	public ModelAndView navigateToRegistration(HttpSession session) {
		session.setAttribute("isLoggedin", false);
		return new ModelAndView("UserRegistration");
	}

	@RequestMapping(value = "/navigate.htm", method = RequestMethod.GET)
	public ModelAndView navigateToPage(HttpServletRequest request) {
		return new ModelAndView(request.getParameter("page"));
	}

}
