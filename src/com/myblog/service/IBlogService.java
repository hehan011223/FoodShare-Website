package com.myblog.service;

import java.util.List;

import com.myblog.entity.Blog;
import com.myblog.vo.BlogVo;

public interface IBlogService {

	public List<BlogVo> getList(int currentUserId);

	public void save(Blog blog);

	public void delBlog(String id);

	public BlogVo getBlog(String id);

}
