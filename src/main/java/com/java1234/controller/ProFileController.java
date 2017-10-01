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
 * ��Ŀ�ļ�
 * @author zsw
 *
 */
@Controller
@RequestMapping("/proFile")
public class ProFileController {
	@Autowired
	private ProFileService proFileService;
	/**
	 * �����ļ��ͽ����ļ� �ļ��ϴ�
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
	        // ����ļ���   
	        MultipartFile startFile = multipartRequest.getFile("startFile");   
	        MultipartFile endFile = multipartRequest.getFile("endFile");
	        // ����ļ�����   
	        String startFileName = startFile.getOriginalFilename();
	        String endFileName=endFile.getOriginalFilename();
	        // �����������   
	        InputStream input = startFile.getInputStream();   
	        // д���ļ�     
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
	 * �ļ�����
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
		//�����ļ�·��
		StringBuffer path = null; 
		if(fileType==1) {
			path=new StringBuffer(proFile.getProStartFile());
		}else if(fileType==2) {
			path=new StringBuffer(proFile.getProEndFile());
		}
        File file=new File(path.toString()); 
        System.out.println(file.getName());
        HttpHeaders headers = new HttpHeaders(); 
        //������ʾ���ļ������������������������ 
        String fileName=new String(path.toString().getBytes("UTF-8"),"iso-8859-1");
        //֪ͨ�������attachment
        headers.setContentDispositionFormData("attachment", fileName); 
        //application/octet-stream �� �����������ݣ�������ļ����أ�
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);    
		}else {
			response.sendRedirect("../error.jsp");
			return null;
		}
    }
}
