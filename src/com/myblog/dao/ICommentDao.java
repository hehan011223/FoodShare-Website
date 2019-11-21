package com.myblog.dao;

import java.util.List;

import com.myblog.entity.Comment;

public interface ICommentDao {

	public void save(Comment comment);

	public List<Comment> getByBlogId(int blogId);

	public void delComment(String id);

}
