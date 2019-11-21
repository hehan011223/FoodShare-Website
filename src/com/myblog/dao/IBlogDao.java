package com.myblog.dao;

import java.util.List;

import com.myblog.entity.Blog;

public interface IBlogDao {

	public List<Blog> getList();

	public void save(Blog blog);

	public void delBlog(String id);

	public Blog getBlog(String id);

}
