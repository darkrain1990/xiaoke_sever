package com.xiaoke.entity;

import java.io.Serializable;

public class Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String recivePhone;

	private String sendDate;//发送日期
	private char sendType;//消息类型
	private String sendContent;//消息内容
	
	public String getRecivePhone() {
		return recivePhone;
	}
	public void setRecivePhone(String recivePhone) {
		this.recivePhone = recivePhone;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public char getSendType() {
		return sendType;
	}
	public void setSendType(char sendType) {
		this.sendType = sendType;
	}
	public String getSendContent() {
		return sendContent;
	}
	public void setSendContent(String sendContent) {
		this.sendContent = sendContent;
	}
	public Message() {
		super();

	}
	public Message(String recivePhone,String sendDate, char sendType,
			String sendContent) {
		super();
		this.recivePhone = recivePhone;
		this.sendDate = sendDate;
		this.sendType = sendType;
		this.sendContent = sendContent;
	}
}