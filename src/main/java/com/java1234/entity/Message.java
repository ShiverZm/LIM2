package com.java1234.entity;

import java.util.List;

public class Message {
	 private Integer id;
	 private Integer proId;
	 private String content;
	 private String speaker;
	 private String speakTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSpeaker() {
		return speaker;
	}
	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}
	public String getSpeakTime() {
		return speakTime;
	}
	public void setSpeakTime(String speakTime) {
		this.speakTime = speakTime;
	}
	 
}
