package com.myblog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myblog.entity.Account;
import com.myblog.entity.Friend;
import com.myblog.entity.Person;
import com.myblog.service.IAccountService;
import com.myblog.service.IFriendService;
import com.myblog.service.IPersonService;

@Controller
public class FriendController {

	@Resource
	private IFriendService friendService;
	@Resource
	private IAccountService accountService;
	@Resource
	private IPersonService personService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * friend list
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "friendList.do")
	public String friendList(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			List<Account> friends = friendService.getByPersonId(user.getPersonId());
			model.addAttribute("friends", friends);
			List<Account> users = accountService.findAllUser();
			if (users != null) {
				model.addAttribute("users", users);
			}
		}
		return "friend/index";
	}

	/**
	 * add friend
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addFriend.do")
	public String addFriend(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		String friendId = request.getParameter("friendId");
		if (obj != null) {
			Account user = (Account) obj;
			Friend friend = new Friend();
			friend.setFriendId(Integer.parseInt(friendId));
			friend.setPersonId(user.getPersonId());
			friendService.save(friend);
		}
		return "redirect:/friendList.do";
	}

	/**
	 * del friend
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delFriend.do")
	public String delFriend(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			String friendId = request.getParameter("friendId");
			friendService.delFriend(user.getPersonId(), Integer.parseInt(friendId));
		}
		return "redirect:/friendList.do";
	}

	/**
	 * get person detail
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "userDetail.do", method = RequestMethod.GET)
	public String userDetail(ModelMap model) {
		String personId = request.getParameter("personId");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			Person person = personService.getById(Integer.parseInt(personId));
			model.addAttribute("person", person);

			// the self page
			if (personId.equals(user.getPersonId() + "")) {
				model.addAttribute("flag", 1);
			} else {
				if ("myfriend".equals(action)) {
					// myfriend --add
					model.addAttribute("flag", 2);
				} else {
					// remove friend
					model.addAttribute("flag", 3);
				}
			}
		}
		return "friend/detail";
	}

}
