package com.java1234.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.java1234.entity.Message;
import com.java1234.entity.PageBean;
import com.java1234.entity.ProjectApply;
import com.java1234.entity.ProjectCheck;
import com.java1234.service.MessageService;
import com.java1234.service.ProjectApplyService;
import com.java1234.service.ProjectCheckService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

/**
 * 项目申请信息
 * @author zsw
 *
 */
@Controller
@RequestMapping("/projectApply")
public class ProjectApplyController {
   
	@Resource
	private ProjectApplyService projectApplyService;
	
	@Resource
	private ProjectCheckService projectCheckService;
	
	@Resource
	private MessageService messageService;

	/**
	 * 项目申请分页查询
	 * @param page
	 * @param rows
	 * @param s_proName
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
	 * 保存或修改 并提交审查
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
	 * 删除项目申请
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
			projectCheckService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 通过项目申请人姓名查找项目
	 * @param realName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findMyProject")
	public String findMyProject(String realName,HttpServletResponse response) throws Exception {
		List<ProjectApply> pa=projectApplyService.findByProApplicant(realName);
		System.out.println(pa.toString());
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(pa);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 通过项目编号 查找项目申请
	 * @param response
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findByProId")
	public String findByProId(HttpServletResponse response,Integer id) throws Exception {
		ProjectApply pa=projectApplyService.findById(id);
		JSONObject result=new JSONObject();
		result.put("pa", pa);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/*@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request,   
            HttpServletResponse response) throws Exception {  
//		 String path1=request.getServletContext().getRealPath("/upload");
//		 System.out.println(path1);
		String path=System.getProperty("file.separator")+"usr"+System.getProperty("file.separator")+"tomcat7.0"+System.getProperty("file.separator")+"projectFile";
        // 转型为MultipartHttpRequest：   
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;   
        // 获得文件：   
        MultipartFile file = multipartRequest.getFile("file");   
        // 获得文件名：   
        String filename = file.getOriginalFilename();   
        // 获得输入流：   
        InputStream input = file.getInputStream();   
        // 写入文件     
        file.transferTo(new File(path+System.getProperty("file.separator")+filename));
        System.out.println(filename);
		return "../index";
    }  

	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(String fliePath) throws IOException {
		//下载文件路径
        String path=fliePath;  
        File file=new File(path);  
        HttpHeaders headers = new HttpHeaders(); 
        //下载显示的文件名，解决中文名称乱码问题 
        String fileName=new String("小猫.jpg".getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", fileName); 
        //application/octet-stream ： 二进制流数据（最常见的文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);    
    }*/
	
	/**
	 * 查找项目的留言
	 * @param proId
	 * @param request
	 * @return
	 */
	@RequestMapping("/projectMessage")
	public String projectMessage(@RequestParam(value="proId")int proId,HttpServletRequest request) {
		ProjectApply pa=projectApplyService.findById(proId);
		List<Message> m=messageService.findByProId(proId);
		request.setAttribute("project", pa);
		request.setAttribute("messages", m);
		return "page/messageBoard";
	}
}
