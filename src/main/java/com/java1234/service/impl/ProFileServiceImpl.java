package com.java1234.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java1234.dao.ProFileDao;
import com.java1234.entity.ProFile;
import com.java1234.service.ProFileService;

@Service("proFileService")
public class ProFileServiceImpl implements ProFileService {
	 @Autowired
	 private ProFileDao proFileDao;
	 
      public int add(ProFile proFile) {
    	  return proFileDao.add(proFile);
      }
	public ProFile findByProId(int proId) {
		return proFileDao.findByProId(proId);
	}
}
