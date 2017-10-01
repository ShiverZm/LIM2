package com.java1234.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.User;
import com.java1234.entity.PageBean;
import com.java1234.entity.User;
import com.java1234.service.UserService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 用户
 * @author zsw
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
    private UserService userService;
    /**
     * 登录
     * @param user
     * @param request
     * @param session
     * @param response
     * @return
     * @throws Exception
     */
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception {
		User resultUser=userService.login(user);
		Subject subject=SecurityUtils.getSubject();
		
		if(resultUser==null) {
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}else {
			UsernamePasswordToken token=new UsernamePasswordToken(resultUser.getUserName(), resultUser.getPassword());
			session=request.getSession();
			subject.login(token);
			session.setAttribute("currentUser", resultUser);
			response.sendRedirect("../main.jsp");
			return null;
		}
	}
	/**
	 * 登出
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
		System.out.println("---------------logout!!!--------------------");
		return "redirect:/login.jsp";
	}
	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 * @param s_userName
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="rows",required=false)String rows,User s_userName,HttpServletResponse response)
	throws Exception
	{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userName", StringUtil.formatLike(s_userName.getUserName()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		Long total=userService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 保存修改
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(User user,HttpServletResponse response)throws Exception{
		int resultTotal=0;//
		if(user.getId()==null){
			resultTotal=userService.add(user);
		}else{
			resultTotal=userService.update(user);
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
			userService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 修改密码
	 * @param userName
	 * @param oldPassword1
	 * @param newPassword
	 * @return
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(String userName,String oldPassword1,String newPassword) {
		System.out.println("userName:"+userName);
		System.out.println("oldPassword1:"+oldPassword1);
		System.out.println("newPassword:"+newPassword);
		
		int result=userService.modifyPassword(userName,oldPassword1,newPassword);
		if(result==1) {
			System.out.println("修改密码成功");
		}else {
			System.out.println("修改密码失败");
		}
	    return "redirect:/main.jsp";
	}
}
