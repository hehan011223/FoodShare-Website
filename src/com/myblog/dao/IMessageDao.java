package com.myblog.dao;

import java.util.List;

import com.myblog.entity.Message;

public interface IMessageDao {

	public void save(Message message);

	public List<Message> getByPersonId(int personId);

	public void delMessage(int id);

	public Message getByMsgId(String msgId);

}
