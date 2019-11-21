package com.myblog.service;

import java.util.List;

import com.myblog.entity.Account;
import com.myblog.entity.Friend;

public interface IFriendService {

	public void save(Friend friend);

	public List<Account> getByPersonId(int personId);

	public void delFriend(int personId, int fiendId);
}
