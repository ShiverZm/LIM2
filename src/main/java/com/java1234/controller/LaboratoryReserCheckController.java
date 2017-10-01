package com.java1234.controller;

import java.util.ArrayList;
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


import com.java1234.entity.PageBean;
import com.java1234.entity.LaboratoryReser;
import com.java1234.entity.LaboratoryReserCheck;
import com.java1234.service.LaboratoryReserCheckService;
import com.java1234.service.LaboratoryReserService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;


/**
 * 实验室预约审查
 * @author zsw
 *
 */
@Controller
@RequestMapping("/laboratoryReserCheck")
public class LaboratoryReserCheckController {
   
	@Resource
	private LaboratoryReserCheckService labReserCheckService;
	
	@Resource
	private LaboratoryReserService labReserService;
	
	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 * @param s_LaboratoryReserCheckName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,LaboratoryReserCheck s_labName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("proName", StringUtil.formatLike(s_labName.getLabName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<LaboratoryReserCheck> laboratoryReserCheckList=labReserCheckService.find(map);
		Long total=labReserCheckService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(laboratoryReserCheckList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 实验室主任 中心主任 指导老师审查项目
	 * @param laboratoryReserCheck
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/check")
	public String check(LaboratoryReserCheck laboratoryReserCheck,HttpServletResponse response) throws Exception {
		int i=0;
		System.out.println(laboratoryReserCheck.getLabName()+","+laboratoryReserCheck.getCheckByTeacher()+","+laboratoryReserCheck.getCheckByDirector()+","+laboratoryReserCheck.getCheckByCDirector() );
		if(laboratoryReserCheck.getResId()!=null) {
			i=labReserCheckService.check(laboratoryReserCheck);
		}
		JSONObject result=new JSONObject();
		if(i!=0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
		
	}
	
	/**
	 * 获得全部通过审查的项目申请 并返回集合
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getFinishedPro")
	public String getFinishedPro(HttpServletResponse response) throws Exception{
		
		List<Integer> passedId=labReserCheckService.getFinishedPro();
		List<LaboratoryReser> proList=new ArrayList<LaboratoryReser>();
		for (Integer id : passedId) {
			System.out.println(id);
			LaboratoryReser lr=labReserService.findById(id);
			System.out.println("name:"+lr.getLabName());
			proList.add(lr);
		}
		JSONObject result=new JSONObject();
		result.put("rows", proList);
		ResponseUtil.write(response, result);
		return null;
	}
}
