package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.LaboratoryDao;
import com.java1234.entity.Laboratory;
import com.java1234.service.LaboratoryService;



@Service("laboratoryService")
public class LaboratoryServiceImpl implements LaboratoryService{
   
	@Resource
	private LaboratoryDao laboratoryDao;

	
	public List<Laboratory> find(Map<String, Object> map) {
		return laboratoryDao.find(map);
	}

	
	public long getTotal(Map<String, Object> map) {
		return laboratoryDao.getTotal(map);
	}

	
	public int update(Laboratory laboratory) {
		
		return laboratoryDao.update(laboratory);
	}

	
	public int add(Laboratory laboratory) {
		
		return laboratoryDao.add(laboratory);
	}

	
	public int delete(Integer id) {
		
		return laboratoryDao.delete(id);
	}


	public List<String> listLab() {
		
		return laboratoryDao.listLab();
	}
}
