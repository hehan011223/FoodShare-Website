package com.myblog.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myblog.dao.ICommentDao;
import com.myblog.dao.IPersonDao;
import com.myblog.entity.Comment;
import com.myblog.entity.Person;
import com.myblog.service.ICommentService;
import com.myblog.utils.DateUtils;
import com.myblog.utils.StringUtils;
import com.myblog.vo.CommentVo;

@Service
public class CommentServiceImpl implements ICommentService {

	@Resource
	private ICommentDao commentDao;
	@Resource
	private IPersonDao personDao;

	/**
	 * save comment
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void save(Comment comment) {
		commentDao.save(comment);
	}

	/**
	 * get comments by blog
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<CommentVo> getByBlogId(String blogId, int currentUserId) {
		List<CommentVo> list = new ArrayList<CommentVo>();
		List<Comment> comments = commentDao.getByBlogId(Integer.parseInt(blogId));
		if (comments != null && comments.size() > 0) {
			for (Comment comment : comments) {
				CommentVo vo = new CommentVo();
				vo.setId(comment.getId());
				vo.setSubject(comment.getSubject());
				vo.setBody(comment.getBody());
				vo.setCreateTime(DateUtils.formatDate(comment.getCreateTime()));
				Person person = personDao.getById(comment.getPersonId());

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
				vo.setPerson(bf.toString());
				vo.setCandel(comment.getPersonId() == currentUserId ? true : false);
				list.add(vo);
			}
		}
		return list;
	}

	/**
	 * del by id
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void delComment(String id) {
		commentDao.delComment(id);
	}
}
