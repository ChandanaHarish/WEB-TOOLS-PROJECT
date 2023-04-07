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
import com.managementsystem.model.Medicine;

@Controller
public class MedicineController {
	@Autowired
	private MedicineDAO medicineDAO;
	
	@RequestMapping(value = "/addMedicine.htm", method = RequestMethod.POST)
	public ModelAndView addMedicine(HttpServletRequest request, HttpSession session) {
		String medicineName = request.getParameter("medicineName").trim();
		String medicineDescription = request.getParameter("medicineDescription").trim();
		Float price = Float.parseFloat(request.getParameter("price").trim());
		Medicine medicine = new Medicine(medicineName, medicineDescription, price);
		medicineDAO.addMedicine(medicine);
		return new ModelAndView("ManageMedicine");
	}
	
	@RequestMapping(value = "/searchMedicine.htm", method = RequestMethod.POST)
	public ModelAndView searchForMedicines(HttpServletRequest request) {
		String searchTerm = request.getParameter("searchTerm");
		List MedicinesList;
		if(null != searchTerm) {
			if(searchTerm.isEmpty()) {
				MedicinesList = medicineDAO.searchForMedicine(searchTerm);
			} else {
				MedicinesList = medicineDAO.searchForMedicine(searchTerm);
			}
			return new ModelAndView("SearchResultMedicine", "searchResult", MedicinesList);
		} else {
			return null;
		}
		
	}
	
	@RequestMapping(value = "/deleteMedicine.htm", method = RequestMethod.POST)
	public ModelAndView deleteMedicine(HttpServletRequest request) {
		Medicine deleteMedicine = null;
		Gson gson = new Gson();
		deleteMedicine = gson.fromJson(request.getParameter("selectedRow"), Medicine.class);
		List MedicinesList;
		if(deleteMedicine != null) {
			MedicinesList = medicineDAO.deletemedicine(deleteMedicine);
			return new ModelAndView("SearchResultMedicine", "searchResult", MedicinesList);
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/navigateToUpdateMedicine.htm", method = RequestMethod.POST)
	public ModelAndView navigateUpdateUser(HttpServletRequest request) {
		Medicine updateMedicine = null;
		Gson gson = new Gson();
		updateMedicine = gson.fromJson(request.getParameter("selectedRow"), Medicine.class);
		return new ModelAndView("UpdateMedicine", "MedicineData", updateMedicine);
	}
	@RequestMapping(value = "/updateMedicine.htm", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest request) {
		String name = request.getParameter("name").trim();
		String description = request.getParameter("description").trim();
		Float price = Float.parseFloat(request.getParameter("price").trim());
		Medicine medicine = new Medicine(name, description, price);
		List MedicinesList;
		MedicinesList = medicineDAO.updatemedicine(medicine);
		if(MedicinesList != null)
			return new ModelAndView("SearchResultMedicine", "SearchResult", MedicinesList);
		return null;
	}

}
