package com.myblog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myblog.entity.Account;
import com.myblog.entity.Message;
import com.myblog.service.IFriendService;
import com.myblog.service.IMessageService;
import com.myblog.vo.MessageVo;

@Controller
public class MesageController {

	@Resource
	private IMessageService messageService;
	@Resource
	private IFriendService friendService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * message list
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "messageList.do")
	public String friendList(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			List<MessageVo> msgs = messageService.getByPersonId(user.getPersonId());
			model.addAttribute("msgs", msgs);
		}
		return "message/index";
	}

	/**
	 * to add message page
	 * 
	 * @return
	 */
	@RequestMapping(value = "toaddMsg.do")
	public String toaddBlog(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			List<Account> friends = friendService.getByPersonId(user.getPersonId());
			model.addAttribute("friends", friends);
		}
		return "message/add";
	}

	/**
	 * add a message
	 * 
	 * @param message
	 * @return
	 */
	@RequestMapping(value = "addMsg.do")
	public String addBlog(Message msg) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			msg.setSenderId(user.getPersonId());
			messageService.save(msg);
		}
		return "redirect:/messageList.do";
	}

	/**
	 * del a message
	 * 
	 * @return
	 */
	@RequestMapping(value = "delMsg.do")
	public String delBlog() {
		String id = request.getParameter("id");
		messageService.delMessage(Integer.parseInt(id));
		return "redirect:/messageList.do";
	}

	/**
	 * get a message
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getMsg.do")
	public String getBlog(ModelMap model) {
		String msgId = request.getParameter("id");
		MessageVo mv = messageService.getById(msgId);
		model.addAttribute("msg", mv);
		return "message/detail";
	}

}
