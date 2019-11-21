package com.myblog.dao;

import java.util.List;

import com.myblog.entity.Friend;

public interface IFriendDao {

	public void save(Friend friend);

	public List<Friend> getByPersonId(int personId);

	public void delFriend(int personId, int friendId);

	public boolean checkExist(Friend friend);

}
