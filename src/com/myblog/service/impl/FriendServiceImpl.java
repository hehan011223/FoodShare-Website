package com.myblog.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.IAccountDao;
import com.myblog.dao.IFriendDao;
import com.myblog.dao.IPersonDao;
import com.myblog.entity.Account;
import com.myblog.entity.Friend;
import com.myblog.service.IFriendService;

@Service
public class FriendServiceImpl implements IFriendService {

	@Resource
	private IFriendDao friendDao;
	@Resource
	private IAccountDao accountDao;
	@Resource
	private IPersonDao personDao;

	/**
	 * save friend
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void save(Friend friend) {
		boolean flag = friendDao.checkExist(friend);
		// true -- not Exist
		if (!flag) {
			friendDao.save(friend);
		}
	}

	/**
	 * get friends by personId
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<Account> getByPersonId(int personId) {
		List<Account> list = new ArrayList<Account>();
		List<Friend> friends = friendDao.getByPersonId(personId);
		if (friends != null && friends.size() > 0) {
			for (Friend friend : friends) {
				Account account = accountDao.getByPersonId(friend.getFriendId());
				list.add(account);
			}
		}
		return list;
	}

	/**
	 * del by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void delFriend(int personId, int friendId) {
		friendDao.delFriend(personId, friendId);
	}
}
