package com.myblog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.myblog.dao.ICommentDao;
import com.myblog.entity.Comment;

@Repository
public class CommentDaoImpl implements ICommentDao {

	@Resource
	private SessionFactory sessionfactory;

	@Override
	public void save(Comment comment) {
		sessionfactory.getCurrentSession().save(comment);
	}

	@Override
	public List<Comment> getByBlogId(int blogId) {
		String hql = "FROM Comment where blogId = ? order by createTime desc";
		@SuppressWarnings("unchecked")
		List<Comment> list = (List<Comment>) sessionfactory.getCurrentSession().createQuery(hql)//
				.setParameter(0, blogId)//
				.list();
		return list;
	}

	@Override
	public void delComment(String id) {
		Comment comment = new Comment();
		comment.setId(Integer.parseInt(id));
		sessionfactory.getCurrentSession().delete(comment);
	}
}
