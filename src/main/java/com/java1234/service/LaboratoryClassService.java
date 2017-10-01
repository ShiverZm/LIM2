package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Equipment;
import com.java1234.entity.LaboratoryClass;

public interface LaboratoryClassService {

	int add(LaboratoryClass laboratoryClass);

	int update(LaboratoryClass laboratoryClass);

	int delete(int parseInt);

	Long getTotal(Map<String, Object> map);

	List<Equipment> find(Map<String, Object> map);

	LaboratoryClass findByLabId(int labId);

}
