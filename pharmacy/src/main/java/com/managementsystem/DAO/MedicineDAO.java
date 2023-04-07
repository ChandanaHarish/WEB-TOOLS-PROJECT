package com.managementsystem.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.managementsystem.model.Medicine;


@Repository
public class MedicineDAO extends DAO{
	public MedicineDAO() {
		
	}
	
	public void addMedicine(Medicine medicine) {
		try {
			begin();
			save(medicine);
			commit();
		} catch (HibernateException e) {
			rollback();
			System.out.println("Could not save medicine " + medicine.getMedicineName());
		}
	}
	
	public List searchForMedicine(String searchTerm) {
		try {
			if (searchTerm.isEmpty() || searchTerm.isBlank()) {
				String hql = "FROM Medicine";
				Query query = getSession().createQuery(hql);
				return query.list();
			} else {
				String hql = "FROM Medicine m WHERE m.medicineName = :medicineName";
				Query query = getSession().createQuery(hql);
				query.setParameter("medicineName", searchTerm);
				return query.list();
			}
		} catch (HibernateException e) {
			System.out.println("Could not find the medicine: " + searchTerm);
			return null;
		}
	}
	
	public List deletemedicine(Medicine medicine) {
		try {
			begin();
			String hql = "FROM Medicine m WHERE m.medicineName = :mmedicineName";
			Query query = getSession().createQuery(hql);
			query.setParameter("mmedicineName", medicine.getMedicineName());
			Medicine med1 = (Medicine) query.uniqueResult();
			med1.setMedicineDescription(medicine.getMedicineDescription());;
			med1.setPrice(medicine.getPrice());
			getSession().delete(med1);
			commit();
			hql = "FROM Medicine";
			query = getSession().createQuery(hql);
			return query.list();
		} catch(HibernateException e) {
			System.out.println("Could not delete medicine:" + medicine.getMedicineName());
			return null;
		}
	}
	
	public List updatemedicine(Medicine medicine) {
		try {
			begin();
			String hql = "FROM Medicine m WHERE m.medicineName = :medicineName";
			Query query = getSession().createQuery(hql);
			query.setParameter("medicineName", medicine.getMedicineName());
			Medicine med1 = (Medicine) query.uniqueResult();
			med1.setMedicineDescription(medicine.getMedicineDescription());
			med1.setPrice(medicine.getPrice());
			getSession().update(med1);
			commit();
			hql = "FROM Medicine";
			query = getSession().createQuery(hql);
			return query.list();
		} catch (HibernateException e) {
			System.out.println("Could not update medicine: " + medicine.getMedicineName());
			return null;
		}
	}
		
}


