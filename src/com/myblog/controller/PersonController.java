package com.myblog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myblog.entity.Account;
import com.myblog.entity.Person;
import com.myblog.service.IAccountService;
import com.myblog.service.IPersonService;

@Controller
public class PersonController {

	@Resource
	private IAccountService accountService;
	@Resource
	private IPersonService personService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * register
	 * 
	 * @param person
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String register(Person person, Account user) {
		personService.save(person, user);
		return "toindex";
	}

	/**
	 * to edit person
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "editPerson.do")
	public String editPerson(ModelMap model) {
		String personId = request.getParameter("personId");
		Person person = personService.getById(Integer.parseInt(personId));
		model.addAttribute("person", person);
		return "person/edit";
	}

	/**
	 * edit person
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "edit.do")
	public String edit(Person person) {
		personService.update(person);
		return "redirect:/index.do";
	}

}
