package com.myblog.vo;

public class MessageVo {
	private int id;
	private String subject;
	private String body;
	private String createTime;
	private String person;
	private boolean candel;

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

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public boolean isCandel() {
		return candel;
	}

	public void setCandel(boolean candel) {
		this.candel = candel;
	}
}
