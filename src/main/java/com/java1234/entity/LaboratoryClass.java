package com.java1234.entity;

public class LaboratoryClass {
		private int id;
		private int labId;
		private String labClassTable;
		private String labPublishTime;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getLabId() {
			return labId;
		}
		public void setLabId(int labId) {
			this.labId = labId;
		}
		public String getLabClassTable() {
			return labClassTable;
		}
		public void setLabClassTable(String labClassTable) {
			this.labClassTable = labClassTable;
		}
		public String getLabPublishTime() {
			return labPublishTime;
		}
		public void setLabPublishTime(String labPublishTime) {
			this.labPublishTime = labPublishTime;
		}
		
		@Override
		public String toString() {
			return "LaboratoryClass [id=" + id + ", labId=" + labId + ", labClassTable=" + labClassTable
					+ ", labPublishTime=" + labPublishTime + "]";
		}
	
}

