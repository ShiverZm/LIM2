package com.java1234.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.java1234.entity.Equipment;
import com.java1234.entity.LaboratoryClass;
import com.java1234.entity.PageBean;
import com.java1234.entity.LaboratoryClass;
import com.java1234.service.EquipmentService;
import com.java1234.service.LaboratoryClassService;
import com.java1234.util.DateTransform;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

/**
 * 实验室课表
 * @author zsw
 *
 */
@Controller
@RequestMapping("/laboratoryClass")
public class LaboratoryClassController {
   
	@Resource
	private LaboratoryClassService laboratoryClassService;
	
	
	/**
	 * 课表上传
	 * @param request
	 * @param response
	 * @param labId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/upload")
    public String upload(HttpServletRequest request,HttpServletResponse response,int labId) throws Exception {
//	    String path1=request.getServletContext().getRealPath("/upload");
//	    System.out.println(path1);
	 	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;       
        // 获得文件：   
        MultipartFile file = multipartRequest.getFile("file"); 
        // 获得文件名：   
        String fileName = file.getOriginalFilename();
        // 获得输入流：   
        InputStream input = file.getInputStream();   
        // 写入文件     
        String path=System.getProperty("file.separator")+"usr"+System.getProperty("file.separator")+"tomcat7.0"+System.getProperty("file.separator")+"labClassTable";
        System.out.println(path);
        LaboratoryClass laboratoryClass=new LaboratoryClass();
        laboratoryClass.setLabId(labId);
        laboratoryClass.setLabClassTable(path+System.getProperty("file.separator")+fileName);
        laboratoryClass.setLabPublishTime(DateTransform.transform(new Date()));
        file.transferTo(new File(path,fileName));
        JSONObject result=new JSONObject();
        boolean success=true;
        if(file.isEmpty()) {
        	success=false;
        }
        laboratoryClassService.add(laboratoryClass);
        result.put("success", success);
        ResponseUtil.write(response, result);
    	return null;
}
	
	/**
	 * 课表下载
	 * @param labId
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(int labId,HttpServletResponse response) throws IOException {
		LaboratoryClass laboratoryClass=laboratoryClassService.findByLabId(labId);
		try{
		if(laboratoryClass!=null) {
		//下载文件路径
		StringBuffer path = null; 
		path=new StringBuffer(laboratoryClass.getLabClassTable());
        File file=new File(path.toString()); 
        System.out.println(file.getName());
        HttpHeaders headers = new HttpHeaders(); 
        //下载显示的文件名，解决中文名称乱码问题 
        String fileName=new String(path.toString().getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment
        headers.setContentDispositionFormData("attachment", fileName); 
        //application/octet-stream ： 二进制流数据（最常见的文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);    
		}else {
			response.sendRedirect("../error.jsp");
			return null;
		}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("../error.jsp");
			return null;
		}
    }
}
