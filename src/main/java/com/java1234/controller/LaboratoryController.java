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

import com.java1234.entity.Laboratory;
import com.java1234.entity.PageBean;
import com.java1234.service.LaboratoryService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

/**
 * 实验室管理
 * @author zsw
 *
 */
@Controller
@RequestMapping("/laboratory")
public class LaboratoryController {
   
	@Resource
	private LaboratoryService laboratoryService;
	
	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 * @param s_LaboratoryName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,Laboratory s_labName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("labName", StringUtil.formatLike(s_labName.getLabName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Laboratory> laboratoryList=laboratoryService.find(map);
		Long total=laboratoryService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(laboratoryList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 保存修改
	 * @param laboratory
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Laboratory laboratory,HttpServletResponse response)throws Exception{
		int resultTotal=0;//鎿嶄綔璁板綍鏉℃暟
		if(laboratory.getId()==null){
			resultTotal=laboratoryService.add(laboratory);
		}else{
			resultTotal=laboratoryService.update(laboratory);
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
	 * 删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response) throws Exception{
		String []idsStr=ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			laboratoryService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
