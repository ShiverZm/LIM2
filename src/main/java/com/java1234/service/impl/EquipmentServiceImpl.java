package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.EquipmentDao;
import com.java1234.entity.Equipment;
import com.java1234.service.EquipmentService;



@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService{
   
	@Resource
	private EquipmentDao equipmentDao;

	
	public List<Equipment> find(Map<String, Object> map) {
		return equipmentDao.find(map);
	}

	
	public long getTotal(Map<String, Object> map) {
		return equipmentDao.getTotal(map);
	}

	
	public int update(Equipment equipment) {
		
		return equipmentDao.update(equipment);
	}

	
	public int add(Equipment equipment) {
		
		return equipmentDao.add(equipment);
	}

	
	public int delete(Integer id) {
		
		return equipmentDao.delete(id);
	}
}
