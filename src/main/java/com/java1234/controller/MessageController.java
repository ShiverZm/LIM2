package com.java1234.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.Message;
import com.java1234.entity.Message;
import com.java1234.entity.PageBean;
import com.java1234.service.MessageService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 留言管理
 * @author zsw
 *
 */
@Controller
@RequestMapping("message")
public class MessageController {
     @Resource
     private MessageService messageService;
     /**
      * 通过项目编号查找所有留言
      * @param id
      * @param response
      * @return
      * @throws Exception
      */
     @RequestMapping("findProAllByProId")
     public String findProAllByProId(int id,HttpServletResponse response) throws Exception {
    	 List<Message> messages=messageService.findProAllByProId(id);
    	 for (Message message : messages) {
			System.out.println("content:"+message.getContent());
		}
    	 JSONObject result=new JSONObject();
    	 JSONArray messageList=new JSONArray();
    	 messageList=JSONArray.fromObject(messages);
    	 result.put("messages",messageList);
    	 ResponseUtil.write(response, result);
    	 return null;
     }
     
     /**
      * 留言
      * @param proId
      * @param content
      * @param date
      * @param speaker
      * @param response
      * @return
      * @throws Exception
      */
     @RequestMapping("add")
     public String add(int proId,String content,Date date,String speaker,HttpServletResponse response) throws Exception{
        System.out.println("content");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String dateStr = formatter.format(date);
    	Message message=new Message();
    	message.setProId(proId);
    	message.setContent(content);
    	message.setSpeaker(speaker);
    	message.setSpeakTime(dateStr);
    	JSONObject result=new JSONObject();
    	Boolean success=false;
    	if(messageService.add(message)==1) {
    		success=true;
    	}
    	result.put("success", success);
    	ResponseUtil.write(response, result);
    	return null;
     }
     /**
      * 留言分页查询
      * @param page
      * @param rows
      * @param response
      * @return
      * @throws Exception
      */
     @RequestMapping("/list")
 	public String list(@RequestParam(value="page",required=false) String page,
 			@RequestParam(value="rows",required=false)String rows,HttpServletResponse response)
 	throws Exception
 	{ 
 		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
 		Map<String, Object> map=new HashMap<String, Object>();
 		map.put("start", pageBean.getStart());
 		map.put("size", pageBean.getPageSize());
 		List<Message> messageList=messageService.find(map);
 		Long total=messageService.getTotal(map);
 		JSONObject result=new JSONObject();
 		JSONArray jsonArray=JSONArray.fromObject(messageList);
 		result.put("rows", jsonArray);
 		result.put("total",total);
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
     @RequestMapping("delete")
     public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response) throws Exception{
 		String []idsStr=ids.split(",");
 		for (int i = 0; i < idsStr.length; i++) {
 			messageService.delete(Integer.parseInt(idsStr[i]));
 		}
 		JSONObject result=new JSONObject();
 		result.put("success", true);
 		ResponseUtil.write(response, result);
 		return null;
 	}
}
