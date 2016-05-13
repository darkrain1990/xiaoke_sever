package com.xiaoke.common.util;

import java.util.regex.Pattern;

/**
 * 字符串工具类（单例）
 * 
 * <p>该类为延迟加载单例类，提供一些字符串处理的方法。</p>
 * <p>如果有需要用到的一些对字符串处理的方法可以添加到该类中</p>
 * @author Xuwangshen
 *
 */
public class StringUtilSingleton {

	private StringUtilSingleton(){}
	
	private static class StringUtilSingletonHolder{
		private static final StringUtilSingleton INSTANCE  = new StringUtilSingleton();
	}
	
	/**
	 * 获取字符串工具类（单例）
	 * @author Xuwangshen
	 * @Date 2016年1月7日 下午3:11:03
	 */
	public static StringUtilSingleton getInstance(){
		return StringUtilSingletonHolder.INSTANCE;
	}
	
	/**
	 * 判断字符串是否为null 或""
	 * 
	 * @param str 字符串
	 * @return 是否为null 或""
	 * @author Xuwangshen
	 * @Date 2016年1月6日 下午4:06:10
	 */
	public boolean isEmpty(String str){
		if(str!=null && !str.trim().equals(""))
			return false;
		return true;
	}
	
	/**
	 * 判断手机号格式是否正确
	 * 
	 * @param mobile 手机号
	 * @return boolean 手机号格式是否正确
	 * @author Xuwangshen
	 * @Date 2016年1月6日 下午2:07:38
	 */
	public boolean isMobile(String mobile){
		if(!isEmpty(mobile)){
			//Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
			Pattern p = Pattern.compile("^1[3|4|5|7|8][0-9]{9}$");
			return p.matcher(mobile).matches();
		}
		return false;
	}
	
	/**
	 * 判断邮箱地址是否合法
	 * 
	 * @param email 邮箱地址
	 * @return 
	 * @author Xuwangshen
	 * @Date 2016年3月17日 下午2:32:45
	 */
	public boolean isEmail(String email){
		if(!isEmpty(email)){
			String regular = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
			Pattern p = Pattern.compile(regular);  
			return p.matcher(email).matches();
		}
		return false;
	}
	
	
	
}
