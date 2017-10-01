package com.java1234.dao;

import com.java1234.entity.LaboratoryClass;

public interface LaboratoryClassDao {


	public int add(LaboratoryClass laboratoryClass);

	public LaboratoryClass findByLabId(int labId);
}
