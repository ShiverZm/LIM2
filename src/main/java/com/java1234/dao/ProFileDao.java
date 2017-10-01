package com.java1234.dao;

import com.java1234.entity.ProFile;

public interface ProFileDao {

	public int add(ProFile proFile);

	public ProFile findByProId(int proId);

}
