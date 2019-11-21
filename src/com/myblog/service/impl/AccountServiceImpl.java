package com.myblog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.IAccountDao;
import com.myblog.entity.Account;
import com.myblog.service.IAccountService;

@Service
public class AccountServiceImpl implements IAccountService {
	Logger logger = Logger.getLogger(AccountServiceImpl.class);

	@Resource
	private IAccountDao userDao;

	/**
	 * save user
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void save(Account user) {
		userDao.save(user);
	}

	/**
	 * update user
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void updateUser(Account user) {
		userDao.updateUser(user);
	}

	/**
	 * get all users
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<Account> findAllUser() {
		return userDao.findAllUser();
	}

	/**
	 * check login user
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public Account findByUserName(String username, String password) {
		try {
			Account user = userDao.findByUserName(username);
			if (user != null) {
				if (password.equals(user.getPassword())) {
					return user;
				}
			}
		} catch (Exception e) {
			logger.error("error:" + e.getMessage());
		}
		return null;
	}

}
