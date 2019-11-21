package com.myblog.service;

import java.util.List;

import com.myblog.entity.Account;

public interface IAccountService {

	public void save(Account user);

	public void updateUser(Account user);

	public List<Account> findAllUser();

	public Account findByUserName(String username, String password);
}
