package com.myblog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.IBlogDao;
import com.myblog.entity.Blog;

@Repository
public class BlogDaoImpl implements IBlogDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public List<Blog> getList() {
		@SuppressWarnings("unchecked")
		List<Blog> list = sessionfactory.getCurrentSession().createQuery("from Blog order by createTime desc").list();
		System.out.println(list);
		return list;
	}

	@Override
	public void save(Blog blog) {
		sessionfactory.getCurrentSession().save(blog);
	}

	@Override
	public void delBlog(String id) {
		Blog blog = new Blog();
		blog.setId(Integer.parseInt(id));
		sessionfactory.getCurrentSession().delete(blog);
	}

	@Override
	public Blog getBlog(String id) {
		return (Blog) sessionfactory.getCurrentSession().get(Blog.class, Integer.parseInt(id));
	}
}
