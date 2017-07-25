package com.java1234.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java1234.entity.User;
import com.java1234.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
    private UserService userService;
    
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request) {
		User resultUser=userService.login(user);
		Subject subject=SecurityUtils.getSubject();
		
		if(resultUser==null) {
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}else {
			UsernamePasswordToken token=new UsernamePasswordToken(resultUser.getUserName(), resultUser.getPassword());
			HttpSession session=request.getSession();
			subject.login(token);
			session.setAttribute("currentUser", resultUser);
			return "redirect:/main.jsp";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		System.out.println("----------------session---------------------");
		return "redirect:/login.jsp";
	}
}
