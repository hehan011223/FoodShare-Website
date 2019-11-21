package com.myblog.dao;

import java.util.List;

import com.myblog.entity.Account;

public interface IAccountDao {

	public void save(Account user);

	public void delUser(Account user);

	public void updateUser(Account user);

	public Account findUserById(String id);

	public List<Account> findAllUser();

	public Account findByUserName(String username);

	public Account getByPersonId(int friendId);
}
