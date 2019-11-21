package com.myblog.service;

import java.util.List;

import com.myblog.entity.Comment;
import com.myblog.vo.CommentVo;

public interface ICommentService {

	public void save(Comment comment);

	public List<CommentVo> getByBlogId(String blogId, int currentUserId);

	public void delComment(String id);
}
