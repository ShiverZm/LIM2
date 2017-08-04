package com.java1234.entity;

public class Laboratory {
    private Integer id;
    private  String labName;
    private String labStatus;
    private String labCode;
    private String labAddress;
    private String labDutyPerson;
    public Laboratory() {
	
    }
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLabName() {
		return labName;
	}
	public void setLabName(String labName) {
		this.labName = labName;
	}
	public String getLabStatus() {
		return labStatus;
	}
	public void setLabStatus(String labStatus) {
		this.labStatus = labStatus;
	}
	public String getLabCode() {
		return labCode;
	}
	public void setLabCode(String labCode) {
		this.labCode = labCode;
	}
	public String getLabAddress() {
		return labAddress;
	}
	public void setLabAddress(String labAddress) {
		this.labAddress = labAddress;
	}
	public String getLabDutyPerson() {
		return labDutyPerson;
	}
	public void setLabDutyPerson(String labDutyPerson) {
		this.labDutyPerson = labDutyPerson;
	}
    
    
}
