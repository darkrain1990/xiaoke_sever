/************************************************************************************
 * @File name   :      ArrayListToJson.java
 *
 * @Author      :      "LiGang"
 *
 * @Date        :      2014-1-17
 *
 * @Copyright Notice: 
 * Copyright (c) 2011 SGM, Inc. All  Rights Reserved.
 * This software is published under the terms of the SGM Software
 * License version 1.0, a copy of which has been included with this
 * distribution in the LICENSE.txt file.
 * 
 * 
 * ----------------------------------------------------------------------------------
 * Date								Who					Version				Comments
 * 2014-1-17 下午04:05:16			    "LiGang"			1.0				    Initial Version
 ************************************************************************************/
package com.xiaoke.common.util;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 功能说明：
 * 典型用法：
 * 特殊用法：
 * 创建者：LiGang
 * 创建时间：2014-1-17
 */
public abstract class JsonUtils {
	
	/**
	 * 
	 * 功能说明：
	 * @Author      :      "LiGang"
	 * @Date        :      2014-1-17
	 * @param array
	 * @return
	 */
	public static <T> JSONArray coverList2JsonArray(List<T> array){
		return coverList2JsonArray(array,null);
	}

	/**
	 * 
	 * 功能说明：
	 * @Author      :      "LiGang"
	 * @Date        :      2014-1-17
	 * @param array
	 * @return
	 */
	public static <T> JSONArray coverList2JsonArray(List<T> array,String[] exclusions){
		JsonConfig jsonConfig = null;
		if(exclusions!=null && exclusions.length>0){
			jsonConfig = new JsonConfig();  
			jsonConfig.setExcludes(exclusions);  
		}
		JSONArray jsonArray =new JSONArray(); 
		JSONObject jsonObject = new JSONObject(); 
		T obj = null;
		for(int i=0;i<array.size();i++){
			obj=array.get(i);
			if(jsonConfig!=null){
				jsonObject=JSONObject.fromObject(obj,jsonConfig);
			}else{
				jsonObject=JSONObject.fromObject(obj);
			}
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
}
