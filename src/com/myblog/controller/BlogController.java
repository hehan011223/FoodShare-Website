package com.myblog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myblog.entity.Blog;
import com.myblog.entity.Account;
import com.myblog.service.IBlogService;
import com.myblog.service.ICommentService;
import com.myblog.vo.BlogVo;
import com.myblog.vo.CommentVo;

@Controller
public class BlogController {

	@Resource
	private IBlogService blogService;
	@Resource
	private ICommentService commentService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * blog list
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "blogList.do")
	public String blogList(ModelMap model) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		int currentUserId = 0;
		if (obj != null) {
			Account user = (Account) obj;
			currentUserId = user.getPersonId();
		}
		List<BlogVo> blogs = blogService.getList(currentUserId);
		model.addAttribute("blogs", blogs);
		return "blog/index";
	}

	/**
	 * to addblog page
	 * 
	 * @return
	 */
	@RequestMapping(value = "toaddBlog.do")
	public String toaddBlog() {
		return "blog/add";
	}

	/**
	 * add a blog
	 * 
	 * @param blog
	 * @return
	 */
	@RequestMapping(value = "addBlog.do")
	public String addBlog(Blog blog) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		System.out.println(obj);
		if (obj != null) {
			Account user = (Account) obj;
			blog.setPersonId(user.getPersonId());
			//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//blog.setCreateTime(new Date());
			System.out.println(blog.getCreateTime());
			blogService.save(blog);
		}
		return "redirect:/blogList.do";
	}

	/**
	 * del a blog
	 * 
	 * @return
	 */
	@RequestMapping(value = "delBlog.do")
	public String delBlog() {
		String id = request.getParameter("id");
		blogService.delBlog(id);
		return "redirect:/blogList.do";
	}

	/**
	 * get a blog
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getBlog.do")
	public String getBlog(ModelMap model) {
		String blogId = request.getParameter("id");
		BlogVo bv = blogService.getBlog(blogId);
		model.addAttribute("blog", bv);

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			Account user = (Account) obj;
			List<CommentVo> comments = commentService.getByBlogId(blogId, user.getPersonId());
			model.addAttribute("comments", comments);
		}
		return "blog/detail";
	}

}
