package com.java1234.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.java1234.dao.ProjectApplyDao;
import com.java1234.entity.PageBean;
import com.java1234.entity.ProjectApply;
import com.java1234.entity.ProjectCheck;
import com.java1234.service.ProjectApplyService;
import com.java1234.service.ProjectCheckService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

@Controller
@RequestMapping("/projectApply")
public class ProjectApplyController {
   
	@Resource
	private ProjectApplyService projectApplyService;
	
	@Resource
	private ProjectCheckService projectCheckService;
	/**
	 * 
	 * @param page
	 * @param rows
	 * @param s_ProjectApplyName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,ProjectApply s_proName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("proName", StringUtil.formatLike(s_proName.getProName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<ProjectApply> projectApplyList=projectApplyService.find(map);
		Long total=projectApplyService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(projectApplyList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	
	/**
	 * 
	 * @param projectApply
	 * @param response
	 * @return
	 * @throws Exception
	 */
	 
	@RequestMapping("/save")
	public String save(HttpServletResponse response,HttpServletRequest request,
			ProjectApply projectApply)
	throws Exception{
		int resultTotal=0;//
		System.out.println("--------------------------"+projectApply.toString());
		if(projectApply.getId()==null){
			resultTotal=projectApplyService.add(projectApply);
			int proId=projectApplyService.findIdByProName(projectApply.getProName());
			ProjectCheck pc=new ProjectCheck();
			pc.setProId(proId);
			pc.setProName(projectApply.getProName());
		    projectCheckService.add(pc);
		}else{
			resultTotal=projectApplyService.update(projectApply);
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
			projectApplyService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping(value="/findMyProject")
	public String findMyProject(String realName,HttpServletResponse response) throws Exception {
		System.out.println("--------------------------"+realName);
		List<ProjectApply> pa=projectApplyService.findByProApplicant(realName);
		System.out.println(pa.toString());
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(pa);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/findByProId")
	public String findByProId(HttpServletResponse response,Integer id) throws Exception {
		ProjectApply pa=projectApplyService.findById(id);
		System.out.println(pa.getId()+","+pa.getProContent()+","+pa.getProStartTime());
		JSONObject result=new JSONObject();
		result.put("pa", pa);
		ResponseUtil.write(response, result);
		return null;
	}
	
	public void upload(String path,File file) {
		
	}
}
