package com.java1234.entity;

public class ProFile {
    private int id;
    private int proId;
    private String proStartFilePath;
    private String proEndFilePath;
    private String proStartTime;
    private String proEndTime;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProStartFile() {
		return proStartFilePath;
	}
	public void setProStartFile(String proStartFilePath) {
		this.proStartFilePath = proStartFilePath;
	}
	public String getProEndFile() {
		return proEndFilePath;
	}
	public void setProEndFile(String proEndFilePath) {
		this.proEndFilePath = proEndFilePath;
	}
	public String getProStartTime() {
		return proStartTime;
	}
	public void setProStartTime(String proStartTime) {
		this.proStartTime = proStartTime;
	}
	public String getProEndTime() {
		return proEndTime;
	}
	public void setProEndTime(String proEndTime) {
		this.proEndTime = proEndTime;
	}
    
}
