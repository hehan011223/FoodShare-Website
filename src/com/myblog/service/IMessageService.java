package com.myblog.service;

import java.util.List;

import com.myblog.entity.Message;
import com.myblog.vo.MessageVo;

public interface IMessageService {

	public void save(Message message);

	public List<MessageVo> getByPersonId(int personId);

	public void delMessage(int id);

	public MessageVo getById(String msgId);

}
