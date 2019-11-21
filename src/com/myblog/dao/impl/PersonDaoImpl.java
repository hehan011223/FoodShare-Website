package com.myblog.dao.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.IPersonDao;
import com.myblog.entity.Person;

@Repository
public class PersonDaoImpl implements IPersonDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public int save(Person person) {
		Serializable result = sessionfactory.getCurrentSession().save(person);
		return (Integer) result;
	}

	@Override
	public Person getById(int personId) {
		return (Person) sessionfactory.getCurrentSession().get(Person.class, personId);
	}

	@Override
	public void update(Person person) {
		sessionfactory.getCurrentSession().update(person);
	}
}
