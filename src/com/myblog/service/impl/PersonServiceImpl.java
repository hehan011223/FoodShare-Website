package com.myblog.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.IPersonDao;
import com.myblog.dao.IAccountDao;
import com.myblog.entity.Person;
import com.myblog.entity.Account;
import com.myblog.service.IPersonService;

@Service
public class PersonServiceImpl implements IPersonService {
	Logger logger = Logger.getLogger(PersonServiceImpl.class);
	private static final String role = "admin";

	@Resource
	private IPersonDao personDao;
	@Resource
	private IAccountDao userDao;

	/**
	 * save user and person
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = { RuntimeException.class,
			Exception.class })
	@Override
	public void save(Person person, Account user) {
		int personId = personDao.save(person);
		user.setPersonId(personId);
		user.setRole(role);
		userDao.save(user);
	}

	/**
	 * get person by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public Person getById(int personId) {
		return personDao.getById(personId);
	}

	/**
	 * update person
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void update(Person person) {
		personDao.update(person);
	}
}
