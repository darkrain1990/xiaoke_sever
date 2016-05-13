package com.xiaoke.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyIntercepor implements HandlerInterceptor {

	/**
	 * 执行时机：视图已经被解析完毕,类似try catch 后的finally
	 */
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception ex)
			throws Exception {
		/*System.out.println("afterCompletion...");
		ex.printStackTrace();
		System.out.println("================");*/
		
	}
	/**
	 * 执行时机：controller执行完，视图解析器没有把视图解析成页面,
	 * 对视图做统一的修改，主要体现在Model上
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView mv) throws Exception {
		/*System.out.println("postHandler...");
		Map<String, Object> map = mv.getModel();
		map.put("test", "append something");*/

	}
	
	/**
	 * 执行时机：在执行controller之前来执行
	 * 返回值类型：boolean：true代表放行可以访问controller，false不可以访问controller
	 */
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		System.out.println("preHander...");
		return true;
	}

}
