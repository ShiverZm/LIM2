package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.LaboratoryReserDao;
import com.java1234.entity.LaboratoryReser;
import com.java1234.service.LaboratoryReserService;



@Service("laboratoryReserService")
public class LaboratoryReserServiceImpl implements LaboratoryReserService{
   
	@Resource
	private LaboratoryReserDao laboratoryReserDao;

	
	public List<LaboratoryReser> find(Map<String, Object> map){
		return laboratoryReserDao.find(map);
	}

	
	public long getTotal(Map<String, Object> map) {
		return laboratoryReserDao.getTotal(map);
	}

	
	public int update(LaboratoryReser laboratory) {
		
		return laboratoryReserDao.update(laboratory);
	}

	
	public int add(LaboratoryReser laboratory) {
		
		return laboratoryReserDao.add(laboratory);
	}

	
	public int delete(Integer id) {
		
		return laboratoryReserDao.delete(id);
	}
	
	public List<LaboratoryReser> findByLabResPerson(String realName){
		return laboratoryReserDao.findByLabResPerson(realName);
	}
}
