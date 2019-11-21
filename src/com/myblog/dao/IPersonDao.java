package com.myblog.dao;

import com.myblog.entity.Person;

public interface IPersonDao {

	public int save(Person person);

	public Person getById(int personId);

	public void update(Person person);

}
