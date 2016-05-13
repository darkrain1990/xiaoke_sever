package com.xiaoke.controller.web;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dl")
public class LoginController{

	
	private static Logger LOGGER = Logger.getLogger(LoginController.class);


    @RequestMapping("/login")
	public String handleRequest(HttpServletRequest req,
			HttpServletResponse res,Model model,HttpSession session) throws Exception {
		String userName=req.getParameter("username");
		String password=req.getParameter("password");
		String erroMsg ="";
		
		if(StringUtils.isEmpty(userName)||StringUtils.isEmpty(password))
		{
			erroMsg ="用户名密码不能为空";
			LOGGER.info(erroMsg);
			req.setAttribute("erroMsg", erroMsg);
			
			return "../jsp/login";
		}else{
			
			LOGGER.info("LoginController:login");

			try{
				if(userName.equals("admin") && password.equals("Pass1234")){

//				Subject u = SecurityUtils.getSubject();
//				u.login(token);

					LOGGER.info("成功登录!");
//                   return "redirect:"+"../user/show";  到查找用户的方法
                    return "../loads/user";
				}else{
					erroMsg ="用户名密码不正确";
					LOGGER.info(erroMsg);
					req.setAttribute("erroMsg", erroMsg);
					return "../jsp/login";
				}
			}catch(Exception e){
				e.printStackTrace();
//				token.clear();
				erroMsg ="用户名密码不正确";
				LOGGER.info(erroMsg);
				req.setAttribute("erroMsg", erroMsg);
				return "../jsp/login";
			}
			
		}
		
	}
}