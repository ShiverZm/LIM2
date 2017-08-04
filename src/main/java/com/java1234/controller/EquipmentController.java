package com.java1234.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.Equipment;
import com.java1234.entity.PageBean;
import com.java1234.service.EquipmentService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {
   
	@Resource
	private EquipmentService equipmentService;
	
	/**
	 * 鍒嗛〉鏉′欢鏌ヨ璁惧
	 * @param page
	 * @param rows
	 * @param s_EquipmentName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,Equipment s_equipmentName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("equipmentName", StringUtil.formatLike(s_equipmentName.getEquipmentName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Equipment> equipmentList=equipmentService.find(map);
		Long total=equipmentService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(equipmentList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 娣诲姞鍜屼慨鏀硅澶�
	 * @param equipment
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Equipment equipment,HttpServletResponse response)throws Exception{
		int resultTotal=0;//
		if(equipment.getId()==null){
			resultTotal=equipmentService.add(equipment);
		}else{
			resultTotal=equipmentService.update(equipment);
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 鍒犻櫎璁惧
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response) throws Exception{
		String []idsStr=ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			equipmentService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
