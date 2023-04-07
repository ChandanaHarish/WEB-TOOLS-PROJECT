package com.managementsystem.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.managementsystem.model.User;

@Repository
public class UserDAO extends DAO{
	public UserDAO() {
	}

	public void addUser(User user) {
		try {
			begin();
			save(user);
			commit();
		} catch (HibernateException e) {
			rollback();
			System.out.println("Could not save user " + user.getFirstname());
		}
	}
	
	public User checkLogin(String username, String password) {
		try {
			String hql = "FROM User u WHERE u.username = :username and u.password = :password";
			Query query = getSession().createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("password", password);
			return (User) query.uniqueResult();
		} catch (HibernateException e) {
			System.out.println("Could not check Login for user: " + username);
			return null;
		}

	}
	
	public List searchForUsers(String searchTerm) {
		try {
			if (searchTerm.isEmpty() || searchTerm.isBlank()) {
				String hql = "FROM User";
				Query query = getSession().createQuery(hql);
				return query.list();
			} else {
				String hql = "FROM User u WHERE u.username = :username";
				Query query = getSession().createQuery(hql);
				query.setParameter("username", searchTerm);
				return query.list();
			}
		} catch (HibernateException e) {
			System.out.println("Could not search for user with username: " + searchTerm);
			return null;
		}
	}
	
	public List deleteuser(User user) {
		try {
			begin();
			User user1 = getSession().get(User.class, user.getId());
			getSession().delete(user1);
			commit();
			String hql = "FROM User";
			Query query = getSession().createQuery(hql);
			return query.list();
		} catch (HibernateException e) {
			System.out.println("Could not delete for user with username: " + user.getUsername());
			return null;
		}
	}
	
	public List updateuser(User user) {
		try {
			begin();
			String hql = "FROM User u WHERE u.username = :username";
			Query query = getSession().createQuery(hql);
			query.setParameter("username", user.getUsername());
			User user1 = (User) query.uniqueResult();
			user1.setAddress(user.getAddress());
			user1.setAge(user.getAge());
			user1.setFirstname(user.getFirstname());
			user1.setLastname(user.getLastname());
			user1.setPassword(user.getPassword());
			user1.setRole(user.getRole());
			user1.setUsername(user.getUsername());
			getSession().update(user1);
			commit();
			hql = "FROM User";
			query = getSession().createQuery(hql);
			return query.list();
		} catch (HibernateException e) {
			System.out.println("Could not update for user with username: " + user.getUsername());
			return null;
		}
	}

}
