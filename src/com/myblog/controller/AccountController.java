package com.myblog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myblog.entity.Account;
import com.myblog.entity.Person;
import com.myblog.service.IAccountService;
import com.myblog.service.IPersonService;

@Controller
public class AccountController {

	@Resource
	private IAccountService accountService;
	@Resource
	private IPersonService personService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * to index page
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "index.do")
	public String index(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			model.addAttribute("user", user);
			Person person = personService.getById(user.getPersonId());
			model.addAttribute("user", user);
			model.addAttribute("person", person);
			return "person/index";
		} else {
			List<Account> users = accountService.findAllUser();
			if (users != null) {
				model.addAttribute("users", users);
			}
			return "home";
		}
	}

	/**
	 * user login
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(ModelMap model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Account user = accountService.findByUserName(username, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			Person person = personService.getById(user.getPersonId());
			model.addAttribute("user", user);
			model.addAttribute("person", person);
		} else {
			model.addAttribute("loginflag", "The username or password is wrong!!");
			model.addAttribute("users", accountService.findAllUser());
			return "home";
		}
		return "person/index";
	}

	/**
	 * to register page
	 * 
	 * @return
	 */
	@RequestMapping(value = "toregister.do", method = RequestMethod.GET)
	public String register() {
		return "register";
	}

	/**
	 * to edit password page
	 * 
	 * @return
	 */
	@RequestMapping(value = "editPassword.do", method = RequestMethod.GET)
	public String editPassword(Model model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			model.addAttribute("user", obj);
		}
		return "person/editpass";
	}

	/**
	 * to change password
	 * 
	 * @return
	 */
	@RequestMapping(value = "changePass.do")
	public String changePass(Account account) {
		accountService.updateUser(account);
		request.getSession().setAttribute("user", account);
		return "redirect:/index.do";
	}

	/**
	 * logout
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/index.do";
	}

}
