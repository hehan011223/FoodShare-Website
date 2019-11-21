package com.myblog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.IMessageDao;
import com.myblog.entity.Message;

@Repository
public class MessageDaoImpl implements IMessageDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public void save(Message message) {
		sessionfactory.getCurrentSession().save(message);
	}

	@Override
	public List<Message> getByPersonId(int personId) {
		String hql = "FROM Message where receiverId = ? order by createTime desc";
		@SuppressWarnings("unchecked")
		List<Message> list = (List<Message>) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, personId)//
				.list();
		return list;
	}

	@Override
	public void delMessage(int id) {
		String hql = "Delete FROM Message Where id=?";
		sessionfactory.getCurrentSession().createQuery(hql)//
				.setInteger(0, id)//
				.executeUpdate();
	}

	@Override
	public Message getByMsgId(String msgId) {
		return (Message) sessionfactory.getCurrentSession().get(Message.class, Integer.parseInt(msgId));
	}

}
