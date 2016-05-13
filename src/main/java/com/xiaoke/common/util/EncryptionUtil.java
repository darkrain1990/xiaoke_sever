/************************************************************************************
 * Copyright (c) 2012 xiaoke.com.cn, Inc. All  Rights Reserved.
 * This software is published under the terms of the xiaoke Software
 * License version 1.0, a copy of which has been included with this
 * distribution in the LICENSE.txt file.
 * 
 * @File name:      EncryptionUtil.java
 * @Create on:      2012-9-12 上午9:48:13 
 * @Author :        "wwh"
 * 
 * @ChangeList
 * ----------------------------------------------------------------------------------
 * Date									Editor						ChangeReasons
 * 2012-9-12 上午9:48:13			"wwh"						Create
 * 2012-9-12 上午9:48:13			"wwh"						Update
 ************************************************************************************/
package com.xiaoke.common.util;

import org.apache.commons.lang3.StringUtils;

import java.util.UUID;

/**@Create on:      2012-9-12 上午9:48:13 
 * @Author :        "wwh"
 */
public class EncryptionUtil {

	/**
	 * 加密采用用户名和密码混合的MD5算法。
	 * @param password
	 * @DESCRIPION :
	 * @Create on: 2012-9-12 上午9:46:31
	 * @Author : "wwh"
	 * @return : String
	 */
	public static String encryption(String userName, String password) {
		String userPassword = StringUtils.join(password, "{", userName, "}");
		String newPassword = MD5.md5(userPassword);
		return newPassword;
	}
	
	/** 
     * 获得一个UUID 
     * @return String UUID 
     */ 
	public static String getUUID(){ 
        String s = UUID.randomUUID().toString(); 
        //去掉“-”符号 
        return s.replace("-", ""); 
    } 
	
}
