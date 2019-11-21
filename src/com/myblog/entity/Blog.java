package com.myblog.entity;

import java.util.Date;

public class Blog {
	private int id;
	private String subject;
	private String body;
	private Date createTime;
	private String imageurl;
	private int personId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}
	
	public String getImageurl() {
		return imageurl;
	}
	
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

}
