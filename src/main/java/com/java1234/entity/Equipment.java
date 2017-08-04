package com.java1234.entity;

public class Equipment {
	private Integer id; // 编号
	private String equipmentName; // 设备名称
	private String model; // 型号
	private String unit; // 单位
	private Float price; // 价格
	private Integer store; // 库存
	private Integer sum;//总数
	private String remark; // 备注
	
	public Equipment() {
		// TODO Auto-generated constructor stub
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getStore() {
		return store;
	}
	public void setStore(Integer store) {
		this.store = store;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
