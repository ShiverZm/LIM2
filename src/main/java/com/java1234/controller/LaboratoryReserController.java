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

import com.java1234.entity.LaboratoryReser;
import com.java1234.entity.PageBean;
import com.java1234.entity.ProjectApply;
import com.java1234.service.LaboratoryReserService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

@Controller
@RequestMapping("/laboratoryReser")
public class LaboratoryReserController {
   
	@Resource
	private LaboratoryReserService laboratoryReserService;
	
	/**
	 * 分页条件查询实验�?
	 * @param page
	 * @param rows
	 * @param s_LaboratoryReserName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,LaboratoryReser s_labName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("labName", StringUtil.formatLike(s_labName.getLabName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<LaboratoryReser> laboratoryReserList=laboratoryReserService.find(map);
		Long total=laboratoryReserService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(laboratoryReserList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 
	 * @param laboratoryReser
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(LaboratoryReser laboratoryReser,HttpServletResponse response)throws Exception{
		int resultTotal=0;
		if(laboratoryReser.getId()==null){
			resultTotal=laboratoryReserService.add(laboratoryReser);
		}else{
			resultTotal=laboratoryReserService.update(laboratoryReser);
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
	 *
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response) throws Exception{
		String []idsStr=ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			laboratoryReserService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping(value="/findMyLabReserv")
	public String findMyProject(String realName,HttpServletResponse response) throws Exception {
		System.out.println("--------------------------"+realName);
		List<LaboratoryReser> lr=laboratoryReserService.findByLabResPerson(realName);
		System.out.println(lr.toString());
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(lr);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, result);
		return null;
	}
}
