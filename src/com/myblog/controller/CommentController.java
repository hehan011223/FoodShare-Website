package com.myblog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myblog.entity.Comment;
import com.myblog.entity.Account;
import com.myblog.service.ICommentService;

@Controller
public class CommentController {

	@Resource
	private ICommentService commentService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * add a coment
	 * 
	 * @param comment
	 * @return
	 */
	@RequestMapping(value = "addComment.do", method = RequestMethod.POST)
	public String register(Comment comment) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			comment.setPersonId(user.getPersonId());
			commentService.save(comment);
		}
		return "redirect:/blogList.do";
	}

	/**
	 * del a comment
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delComment.do")
	public String delComment(ModelMap model) {
		String commentId = request.getParameter("commentid");
		String blogid = request.getParameter("blogid");
		commentService.delComment(commentId);
		model.addAttribute("id", blogid);
		return "redirect:/getBlog.do";
	}

}
