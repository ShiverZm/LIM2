package com.java1234.entity;

import java.util.Date;

public class ProjectApply {
		private Integer id;//
		private String proName;
		private String proContent;
		private String proApplicant;
		private String proGroupMember;
		private String proStartTime;
		private String proTeacher;
		private String proEquipment;
		private String proAddress;
		private String proStartFile;
		private String proEndFile;
		
		public ProjectApply() {
			
		}
		public ProjectApply(Integer id, String proName) {
			super();
			this.id = id;
			this.proName = proName;
		}
		
		public String getProStartTime() {
			return proStartTime;
		}
		public void setProStartTime(String proStartTime) {
			this.proStartTime = proStartTime;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getProName() {
			return proName;
		}
		public void setProName(String proName) {
			this.proName = proName;
		}
		public String getProContent() {
			return proContent;
		}
		public void setProContent(String proContent) {
			this.proContent = proContent;
		}
		public String getProApplicant() {
			return proApplicant;
		}
		public void setProApplicant(String proApplicant) {
			this.proApplicant = proApplicant;
		}
		public String getProGroupMember() {
			return proGroupMember;
		}
		public void setProGroupMember(String proGroupMember) {
			this.proGroupMember = proGroupMember;
		}
		public String getProTeacher() {
			return proTeacher;
		}
		public void setProTeacher(String proTeacher) {
			this.proTeacher = proTeacher;
		}
		public String getProEquipment() {
			return proEquipment;
		}
		public void setProEquipment(String proEquipment) {
			this.proEquipment = proEquipment;
		}
		public String getProAddress() {
			return proAddress;
		}
		public void setProAddress(String proAddress) {
			this.proAddress = proAddress;
		}
		public String getProStartFile() {
			return proStartFile;
		}
		public void setProStartFile(String proStartFile) {
			this.proStartFile = proStartFile;
		}
		public String getProEndFile() {
			return proEndFile;
		}
		public void setProEndFile(String proEndFile) {
			this.proEndFile = proEndFile;
		}
		@Override
		public String toString() {
			return "ProjectApply [id=" + id + ", proName=" + proName + ", proContent=" + proContent + ", proApplicant="
					+ proApplicant + ", proGroupMember=" + proGroupMember + ", proStartTime=" + proStartTime
					+ ", proTeacher=" + proTeacher + ", proEquipment=" + proEquipment + ", proAddress=" + proAddress
					+ ", proStartFile=" + proStartFile + ", proEndFile=" + proEndFile + "]";
		}
		
}
