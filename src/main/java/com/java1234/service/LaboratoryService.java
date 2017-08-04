package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Laboratory;

public interface LaboratoryService {
    /**
     * 查询实验室集合
     * @param map
     * @return
     */
    public List<Laboratory> find(Map<String, Object> map);
    
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public long getTotal(Map<String, Object> map);

    /**
     * 修改实验室
     * @param equipment
     * @return
     */
    public int update(Laboratory equipment);
    
    /**
     * 添加实验室
     * @param equipment
     * @return
     */
    public int add(Laboratory equipment);
    
    /**
     * 删除实验室 
     * @param id
     * @return
     */
    public int delete(Integer id);
}
