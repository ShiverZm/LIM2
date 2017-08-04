package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Equipment;

public interface EquipmentDao {
	
	    /**
	     * 查询用户集合
	     * @param map
	     * @return
	     */
	    public List<Equipment> find(Map<String, Object> map);
	    
	    /**
	     * 获取总记录数
	     * @param map
	     * @return
	     */
	    public long getTotal(Map<String, Object> map);
	    
	    /**
	     * 修改设备
	     * @param equipment
	     * @return
	     */
	    public int update(Equipment equipment);
	    
	    /**
	     * 添加设备
	     * @param equipment
	     * @return
	     */
	    public int add(Equipment equipment);
	    
	    /**
	     * 删除设备 
	     * @param id
	     * @return
	     */
	    public int delete(Integer id);
	    
	   

}
