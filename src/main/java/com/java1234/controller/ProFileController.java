package com.java1234.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.java1234.entity.ProFile;
import com.java1234.service.ProFileService;
import com.java1234.util.DateTransform;
import com.java1234.util.ResponseUtil;
import com.mysql.fabric.Response;

import net.sf.json.JSONObject;

/**
 * 项目文件
 * @author zsw
 *
 */
@Controller
@RequestMapping("/proFile")
public class ProFileController {
	@Autowired
	private ProFileService proFileService;
	/**
	 * 开题文件和结题文件 文件上传
	 * @param request
	 * @param response
	 * @param proId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/upload")
	    public String upload(HttpServletRequest request,HttpServletResponse response,int proId) throws Exception {
//		    String path=request.getServletContext().getRealPath("/");
//		    System.out.println(path);
		 	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;       
	        // 获得文件：   
	        MultipartFile startFile = multipartRequest.getFile("startFile");   
	        MultipartFile endFile = multipartRequest.getFile("endFile");
	        // 获得文件名：   
	        String startFileName = startFile.getOriginalFilename();
	        String endFileName=endFile.getOriginalFilename();
	        // 获得输入流：   
	        InputStream input = startFile.getInputStream();   
	        // 写入文件     
	        String StartPath="F://proFile//"+startFileName;
	        String endPath="F://proFile//"+endFileName;
	        ProFile proFile=new ProFile();
	        proFile.setProId(proId);
	        proFile.setProStartFile(StartPath);
	        proFile.setProEndFile(endPath);
	        proFile.setProStartTime(DateTransform.transform(new Date()));
	        proFile.setProEndTime(DateTransform.transform(new Date()));
	        startFile.transferTo(new File(StartPath));
	        endFile.transferTo(new File(endPath));
	        JSONObject result=new JSONObject();
	        boolean success=true;
	        if(startFile.isEmpty()||endFile.isEmpty()) {
	        	success=false;
	        }
	        proFileService.add(proFile);
	        result.put("success", success);
	        ResponseUtil.write(response, result);
	    	return null;
    }
	/**
	 * 文件下载
	 * @param proId
	 * @param fileType
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(int proId,int fileType,HttpServletResponse response) throws IOException {
		ProFile proFile=proFileService.findByProId(proId);
		if(proFile!=null) {
		//下载文件路径
		StringBuffer path = null; 
		if(fileType==1) {
			path=new StringBuffer(proFile.getProStartFile());
		}else if(fileType==2) {
			path=new StringBuffer(proFile.getProEndFile());
		}
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
    }
}
