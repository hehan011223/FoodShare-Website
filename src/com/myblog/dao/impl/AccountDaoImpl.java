package com.myblog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.IAccountDao;
import com.myblog.entity.Account;

@Repository
public class AccountDaoImpl implements IAccountDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public void save(Account account) {
		sessionfactory.getCurrentSession().save(account);
	}

	@Override
	public void delUser(Account account) {
		sessionfactory.getCurrentSession().delete(account);
	}

	@Override
	public void updateUser(Account account) {
		sessionfactory.getCurrentSession().update(account);
	}

	@Override
	public Account findUserById(String id) {
		Account account = (Account) sessionfactory.getCurrentSession().get(Account.class, id);
		return account;
	}

	@Override
	public List<Account> findAllUser() {
		@SuppressWarnings("unchecked")
		List<Account> list = sessionfactory.getCurrentSession().createQuery("from Account").list();
		return list;
	}

	@Override
	public Account findByUserName(String username) {
		String hql = "FROM Account where username = ?";
		Account account = (Account) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, username)//
				.uniqueResult();
		return account;
	}

	@Override
	public Account getByPersonId(int personId) {
		String hql = "FROM Account where personId = ?";
		Account account = (Account) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, personId)//
				.uniqueResult();
		return account;
	}

}
