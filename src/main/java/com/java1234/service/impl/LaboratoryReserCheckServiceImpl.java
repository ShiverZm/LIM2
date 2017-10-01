package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.LaboratoryReserCheckDao;
import com.java1234.entity.LaboratoryReserCheck;
import com.java1234.service.LaboratoryReserCheckService;

@Service("laboratoryReserCheckService")
public class LaboratoryReserCheckServiceImpl implements LaboratoryReserCheckService {
    
	@Resource
	private LaboratoryReserCheckDao labReserCheckDao;
	
	public List<LaboratoryReserCheck> find(Map<String, Object> map) {
		
		return labReserCheckDao.find(map);
	}

	public long getTotal(Map<String, Object> map) {
		
		return labReserCheckDao.getTotal(map);
	}	
	
	public int check(LaboratoryReserCheck laboratoryReserCheck) {
		return labReserCheckDao.check(laboratoryReserCheck);
	}

	public int add(LaboratoryReserCheck pc) {
	
		return labReserCheckDao.add(pc);
	}
	public List<Integer> getFinishedPro(){
		return labReserCheckDao.getFinishedPro();
	}

	public int delete(int resId) {
		return labReserCheckDao.delete(resId);
	}
}
