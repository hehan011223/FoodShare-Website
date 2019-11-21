package com.myblog.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.IBlogDao;
import com.myblog.dao.IPersonDao;
import com.myblog.entity.Blog;
import com.myblog.entity.Person;
import com.myblog.service.IBlogService;
import com.myblog.utils.DateUtils;
import com.myblog.utils.StringUtils;
import com.myblog.vo.BlogVo;

@Service
public class BlogServiceImpl implements IBlogService {

	@Resource
	private IBlogDao blogDao;
	@Resource
	private IPersonDao personDao;

	/**
	 * get all order by createtime
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<BlogVo> getList(int currentUserId) {
		List<BlogVo> list = new ArrayList<BlogVo>();
		List<Blog> blogs = blogDao.getList();
		if (blogs != null && blogs.size() > 0) {
			for (Blog blog : blogs) {
				BlogVo bv = new BlogVo();
				bv.setId(blog.getId());
				bv.setSubject(blog.getSubject());
				bv.setBody(blog.getBody());
				bv.setImageurl(blog.getImageurl());
				// formate date
				bv.setCreateTime(DateUtils.formatDate(blog.getCreateTime()));
				// link the person
				Person person = personDao.getById(blog.getPersonId());
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

				bv.setPerson(bf.toString());
				bv.setCandel(blog.getPersonId() == currentUserId ? true : false);
				System.out.println(blog.getId());
				System.out.println(blog.getImageurl());
				list.add(bv);
			}
		}
		return list;
	}

	/**
	 * save a blog
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void save(Blog blog) {
		System.out.println(blog.getId());
		System.out.println(blog.getCreateTime());
		blogDao.save(blog);
	}

	/**
	 * del blog by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void delBlog(String id) {
		blogDao.delBlog(id);
	}

	/**
	 * get blog by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public BlogVo getBlog(String id) {
		BlogVo bv = new BlogVo();
		Blog blog = blogDao.getBlog(id);
		if (blog != null) {
			bv.setId(blog.getId());
			bv.setSubject(blog.getSubject());
			bv.setBody(blog.getBody());
			bv.setCreateTime(DateUtils.formatDate(blog.getCreateTime()));
			bv.setImageurl(blog.getImageurl());
			Person person = personDao.getById(blog.getPersonId());
			bv.setPerson(person.getFname() + " " + person.getMname() + " " + person.getLname());
			bv.setCandel(false);
		}
		return bv;
	}

}
