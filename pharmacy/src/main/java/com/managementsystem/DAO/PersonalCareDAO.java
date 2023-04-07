package com.managementsystem.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.managementsystem.model.PersonalCare;


@Repository
public class PersonalCareDAO extends DAO{
	
	public PersonalCareDAO() {
		
	}
	
	public void addPersonalCare(PersonalCare personalcare) {
		try {
			begin();
			save(personalcare);
			commit();
		} catch(HibernateException e) {
			rollback();
			System.out.println("Could not saving personalcare" + personalcare.getPersonalCareName());
			
		}		
	}
	
	public List searchForPersonalCare(String searchTerm) {
		try {
			if(searchTerm.isEmpty() || searchTerm.isBlank()) {
				String hql = "FROM PersonalCare";
				Query query = getSession().createQuery(hql);
				return query.list();
			} else {
				String hql = "FROM PersonalCare pc WHERE pc.personalCareName = :personalCareName";
				Query query = getSession().createQuery(hql);
				query.setParameter("personalCareName", searchTerm);
				return query.list();
			}
		} catch (HibernateException e) {
			System.out.println("Could  not search for personal care:" + searchTerm);
			return null;
				
		}
	}
	
	public List deletePersonalCare(PersonalCare personalcare) {
		try {
			begin();
			String hql = "FROM PersonalCare pc WHERE pc.personalCareName = :pcpersonalCareName";
			Query query = getSession().createQuery(hql);
			query.setParameter("pcpersonalCareName", personalcare.getPersonalCareName());
			PersonalCare pc1 = (PersonalCare) query.uniqueResult();
			pc1.setPersonalCareQuantity(personalcare.getPersonalCareQuantity());
			pc1.setPersonalCarePrice(personalcare.getPersonalCarePrice());
			getSession().delete(pc1);
			commit();
			hql = "FROM PersonalCare";
			query = getSession().createQuery(hql);
			return query.list();
		} catch (HibernateException e) {
			System.out.println("Could not delete PersonalCare: " + personalcare.getPersonalCareName());
			return null;
		}
	}
	
	public List updatePersonalCare(PersonalCare personalcare) {
		try {
			begin();
			String hql = "FROM PersonalCare pc WHERE pc.personalCareName = :pcpersonalCareName";
			Query query = getSession().createQuery(hql);
			query.setParameter("pcpersonalCareName", personalcare.getPersonalCareName());
			PersonalCare pc1 = (PersonalCare) query.uniqueResult();
			pc1.setPersonalCarePrice(personalcare.getPersonalCarePrice());
			pc1.setPersonalCareQuantity(personalcare.getPersonalCareQuantity());
			getSession().update(pc1);
			commit();
			hql = "FROM PersonalCare";
			query = getSession().createQuery(hql);
			return query.list();
		} catch (HibernateException e) {
			System.out.println("Could not update PersonalCare: " + personalcare.getPersonalCareName());
			return null;
		}
	}

}
