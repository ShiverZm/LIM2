package com.java1234.service;

import com.java1234.entity.ProFile;

public interface ProFileService {
      public int add(ProFile proFile);
	
	  public ProFile findByProId(int proId);
}
