package com.myblog.service;

import com.myblog.entity.Person;
import com.myblog.entity.Account;

public interface IPersonService {
	public void save(Person person, Account user);

	public Person getById(int personId);

	public void update(Person person);
}
