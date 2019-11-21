package com.myblog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.IFriendDao;
import com.myblog.entity.Friend;

@Repository
public class FriendDaoImpl implements IFriendDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public void save(Friend friend) {
		sessionfactory.getCurrentSession().save(friend);
	}

	@Override
	public List<Friend> getByPersonId(int personId) {
		String hql = "FROM Friend where personId = ?";
		@SuppressWarnings("unchecked")
		List<Friend> list = (List<Friend>) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, personId)//
				.list();
		return list;
	}

	@Override
	public void delFriend(int personId, int friendId) {
		String hql = "Delete FROM Friend Where personId=? and friendId = ?";
		sessionfactory.getCurrentSession().createQuery(hql)//
				.setInteger(0, personId)//
				.setInteger(1, friendId)//
				.executeUpdate();

	}

	@Override
	public boolean checkExist(Friend friend) {
		String hql = "FROM Friend where personId = ? and friendId = ?";
		@SuppressWarnings("unchecked")
		List<Friend> list = (List<Friend>) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, friend.getPersonId())//
				.setInteger(1, friend.getFriendId())//
				.list();
		if (list != null && list.size() > 0) {
			return true;
		}
		return false;
	}
}
