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
import com.java1234.entity.ProjectApply;
import com.java1234.entity.ProjectCheck;
import com.java1234.service.ProjectApplyService;
import com.java1234.service.ProjectCheckService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

@Controller
@RequestMapping("/projectCheck")
public class ProjectCheckController {
   
	@Resource
	private ProjectCheckService projectCheckService;
	@Resource
	private ProjectApplyService projectApplyService;
	
	/**
	 * 
	 * @param page
	 * @param rows
	 * @param s_ProjectCheckName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,ProjectCheck s_proName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("proName", StringUtil.formatLike(s_proName.getProName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<ProjectCheck> projectCheckList=projectCheckService.find(map);
		Long total=projectCheckService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(projectCheckList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/check")
	public String check(ProjectCheck projectCheck,HttpServletResponse response) throws Exception {
		int i=0;
		System.out.println(projectCheck.getProName()+","+projectCheck.getCheckByTeacher()+","+projectCheck.getCheckByDirector()+","+projectCheck.getCheckByCDirector() );
		if(projectCheck.getProId()!=null) {
			i=projectCheckService.check(projectCheck);
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
	
	@RequestMapping("/getFinishedPro")
	public String getFinishedPro(HttpServletResponse response) throws Exception{
		
		List<Integer> passedId=projectCheckService.getFinishedPro();
		List<ProjectApply> proList=new ArrayList<ProjectApply>();
		for (Integer id : passedId) {
			System.out.println(id);
			ProjectApply pa=projectApplyService.findById(id);
			System.out.println("name:"+pa.getProName());
			proList.add(pa);
		}
		JSONObject result=new JSONObject();
		result.put("rows", proList);
		ResponseUtil.write(response, result);
		return null;
	}
}
