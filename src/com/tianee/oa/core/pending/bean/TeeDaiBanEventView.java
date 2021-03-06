package com.tianee.oa.core.pending.bean;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="daibanevent")
public class TeeDaiBanEventView {
	@Id
	@Column(name="ID")
	private String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="title")
	private String title;
	
	@Column(name="content")
	private String content;
	
	@Column(name="address")
	private String address;
	
	@Column(name="model")
	private String model;
	
	@Column(name="recUser")
	private String recUser;
	
	@Column(name="recUserId")
	private int recUserId;
	
	@Column(name="sendUser")
	private String sendUser;
	
	
	@Column(name="time")
	private Calendar createTime;
	
	@Column(name="IS_REND")
	private int isRead;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getRecUser() {
		return recUser;
	}
	public void setRecUser(String recUser) {
		this.recUser = recUser;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	
	
	public Calendar getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
	}
	public int getRecUserId() {
		return recUserId;
	}
	public void setRecUserId(int recUserId) {
		this.recUserId = recUserId;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	
	
	
	
	
}
