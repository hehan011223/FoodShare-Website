package com.myblog.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.IMessageDao;
import com.myblog.dao.IPersonDao;
import com.myblog.entity.Message;
import com.myblog.entity.Person;
import com.myblog.service.IMessageService;
import com.myblog.utils.DateUtils;
import com.myblog.utils.StringUtils;
import com.myblog.vo.MessageVo;

@Service
public class MessageServiceImpl implements IMessageService {

	@Resource
	private IMessageDao messageDao;
	@Resource
	private IPersonDao personDao;

	/**
	 * save message
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void save(Message message) {
		messageDao.save(message);
	}

	/**
	 * get message by personId
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<MessageVo> getByPersonId(int personId) {
		List<MessageVo> list = new ArrayList<MessageVo>();
		List<Message> msgs = messageDao.getByPersonId(personId);
		if (msgs != null && msgs.size() > 0) {
			for (Message msg : msgs) {
				MessageVo vo = new MessageVo();
				vo.setId(msg.getId());
				vo.setSubject(msg.getSubject());
				vo.setBody(msg.getBody());
				vo.setCreateTime(DateUtils.formatDate(msg.getCreateTime()));
				Person person = personDao.getById(msg.getSenderId());

				StringBuffer bf = new StringBuffer();
				if (!StringUtils.isBlank(person.getFname())) {
					bf.append(person.getFname());
				}
				if (!StringUtils.isBlank(person.getMname())) {
					bf.append(" ").append(person.getMname());
				}
				if (!StringUtils.isBlank(person.getLname())) {
					bf.append(" ").append(person.getLname());
				}
				vo.setPerson(bf.toString());
				vo.setCandel(true);
				list.add(vo);
			}
		}
		return list;
	}

	/**
	 * del by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void delMessage(int id) {
		messageDao.delMessage(id);
	}

	/**
	 * get by id
	 * 
	 * @param msgId
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public MessageVo getById(String msgId) {
		Message msg = messageDao.getByMsgId(msgId);
		MessageVo vo = new MessageVo();
		if (msg != null) {
			vo.setId(msg.getId());
			vo.setSubject(msg.getSubject());
			vo.setBody(msg.getBody());
			vo.setCreateTime(DateUtils.formatDate(msg.getCreateTime()));
			Person person = personDao.getById(msg.getSenderId());

			StringBuffer bf = new StringBuffer();
			if (!StringUtils.isBlank(person.getFname())) {
				bf.append(person.getFname());
			}
			if (!StringUtils.isBlank(person.getMname())) {
				bf.append(" ").append(person.getMname());
			}
			if (!StringUtils.isBlank(person.getLname())) {
				bf.append(" ").append(person.getLname());
			}
			vo.setPerson(bf.toString());
			vo.setCandel(true);
		}
		return vo;
	}
}
