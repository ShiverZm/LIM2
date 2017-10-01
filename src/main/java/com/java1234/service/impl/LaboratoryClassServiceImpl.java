package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java1234.dao.LaboratoryClassDao;
import com.java1234.entity.Equipment;
import com.java1234.entity.LaboratoryClass;
import com.java1234.service.LaboratoryClassService;

@Service("laboratoryClassSerivce")
public class LaboratoryClassServiceImpl implements LaboratoryClassService{
	@Autowired
	private LaboratoryClassDao laboratoryClassDao; 
	
	public int add(LaboratoryClass laboratoryClass) {
		return laboratoryClassDao.add(laboratoryClass);
	}

	public int update(LaboratoryClass laboratoryClass) {
		return 0;
	}

	public int delete(int parseInt) {
		return 0;
	}

	public Long getTotal(Map<String, Object> map) {
		return null;
	}

	public List<Equipment> find(Map<String, Object> map) {
		return null;
	}

	public LaboratoryClass findByLabId(int labId) {
		return laboratoryClassDao.findByLabId(labId);
	}

}
