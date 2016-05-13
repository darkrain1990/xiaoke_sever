package com.xiaoke.controller.web;

import com.xiaoke.entity.qo.SysAuthoritiesQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.entity.vo.SysAuthoritiesVO;
import com.xiaoke.service.SysAuthoritiesService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限系统-权限
 * @author Zhao MengYuan
 *
 */

@Controller
@RequestMapping("/sys_authorities") 
public class SysAuthoritiesController {

	Logger log = LogManager.getLogger(SysAuthoritiesController.class);

	@Autowired
	private SysAuthoritiesService sysAuthoritiesService;

	/**
	 * 根据输入框的值查询权限
	 * @param value input中的用户姓名/手机号码
	 * @param sys 所属系统
	 * @return String 结果Json字符串
	 * @author Zhao MengYuan
	 * @Date 10:55 AM 2016.3.16
	 */
	@RequestMapping(value="/findAccessByInput",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String findAccessByInput(int index,int pageSize,String value,int sys){
		log.info("log findAccessByInput Start...");
		SysAuthoritiesQO param = new SysAuthoritiesQO(value,sys,pageSize,index);
		PageBean<SysAuthorities> page = sysAuthoritiesService.findAccessByInput(param);
		
		String result = null;
		if(page.getList().size() == 0){
			result = "NOT FOUND";
		}else{
			result = "SUCCESS";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageTotal", page.getPageTotal());
		map.put("index", index);
		map.put("users", page.getList());
		map.put("result",result);
		
		JSONObject json = JSONObject.fromObject(map);
		log.info("找到用户["+value+"],成功返回!");
		log.info("log findAccessByInput End...");
		return json.toString();
	}
	
	/**
	 * 新增权限
	 * @param authName 权限名称
	 * @param sys 所属系统
	 * @param authDesc 权限描述
	 * @param enabled 是否可用   1可用
	 * @param superAuth 是否超级权限   1可用
	 * @return String 结果Json字符串
	 * @author Zhao MengYuan
	 * @Date 4:59 PM 2016.3.17
	 */
	@RequestMapping(value="/addAuthority",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String addAuthority(String authName,Integer sys,String authDesc,String enabled,String superAuth){
		log.info("log addAuthority Start...");
		
		int en = 0;
		int issys = 0;
		if(enabled == "是" || enabled.equals("是")){
			en = 1;
		}
		if(superAuth == "是" || superAuth == "是"){
			issys = 1;
		}
		
		SysAuthorities au = new SysAuthorities(authName,authDesc,en,issys,sys,1);
		
		String result = sysAuthoritiesService.addAuthority(au);
		log.info(result);
		log.info("log addAuthority End...");
		return result;
	}
	
	/**
	 * 删除权限
	 * @param id id
	 * @return String 结果Json字符串
	 * @author Zhao MengYuan
	 * @Date 10:59 AM 2016.3.21
	 */
	@RequestMapping(value="/delAuthority",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delAuthority(Integer id){
		log.info("log delAuthority Start...");
		String result = null;
		
		SysAuthorities au = new SysAuthorities();
		au.setId(id);
		result = sysAuthoritiesService.delAuthority(au);
		
		log.info(result);
		log.info("log delAuthority End...");
		return result;
	}
	
	/**
	 * 更新权限
	 * @param 
	 * @return String 结果Json字符串
	 * @author Zhao MengYuan
	 * @Date 2:10 PM 2016.3.22
	 */
	@RequestMapping(value="/updAuthority",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String updAuthority(Integer id,String sysname,String sysdesc,Integer mou,String enab,String iss){
		log.info("log updAuthority Start...");
		String result = null;
		
		SysAuthorities au = new SysAuthorities();
		int enabled = 0;
		if(enab != null && enab != ""){
			if(enab.equals("可用") || enab == "可用"){
				enabled = 1;
			}
		}
		int issys = 0;
		if(iss != null && iss != ""){
			if(iss.equals("超级权限") || iss == "超级权限"){
				issys = 1;
			}
		}
		au.setAuthority_name(sysname);
		au.setAuthority_desc(sysdesc);
		au.setEnabled(enabled);
		au.setIssys(issys);
		au.setSystem_id(mou);
		au.setId(id);

		result = sysAuthoritiesService.updAuthority(au);
		
		log.info(result);
		log.info("log updAuthority End...");
		return result;
	}

	/**
	 * @author XuFei
	 * @param systemId 
	 * @return Json
	 **/
	
	@ResponseBody
	@RequestMapping(value="/searchResource",produces="application/json;charset=UTF-8")
	public String searchResource(String systemId,String authorityId,HttpServletRequest req,HttpServletResponse rep){
		//所有资源
		List<SysAuthoritiesVO>  salist = sysAuthoritiesService.searchResource(systemId);
		Map<String, String> selectmap = new HashMap<String, String>();
		selectmap.put("systemId", systemId);
		selectmap.put("authorityId", authorityId);
		//已拥有的资源
		List<SysAuthoritiesVO>  saselectlist = sysAuthoritiesService.searchResourceSelect(selectmap);
		
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<String> resultselect = new ArrayList<String>();
		for (int i = 0; i < saselectlist.size(); i++) {
			resultselect.add(saselectlist.get(i).getResourceName());
		}
		String strs = resultselect.toString().substring(1, resultselect.toString().length()-1);
		strs = strs.substring(0,strs.length());
		String[] str = strs.split(",");
		System.out.println(strs);
		Map<String, String> map = null;
	
		if(salist.size()>0){
			for(SysAuthoritiesVO s:salist) {
				System.out.println(s.getResourceName());
				map = new HashMap<String, String>();
				String resouceid =  s.getResourceId();
				map.put("id",resouceid);
				
				String parentid = s.getParentId();
				if("0".equals(parentid) || "1".equals(parentid) || "2".equals(parentid) || "7".equals(parentid)){
					map.put("pId", parentid);
					map.put("open","true");
				}else{
					map.put("pId", parentid);
				}
				String resourcename = s.getResourceName();
				
				for (int i = 0; i < str.length; i++) {
					System.out.println(i+"********");
					String sss = str[i];
					if(sss.equals(s.getResourceName())){
						map.put("name", resourcename);
						map.put("checked", "true");
					}else{
						map.put("name", resourcename);
					}
				}
				result.add(map);
			}
			JSONArray jsarr = JSONArray.fromObject(result.toArray());
			req.getSession().setAttribute("jsobj", jsarr);
			
			System.out.println("json----->"+jsarr.toString());
			return jsarr.toString();
		}else{
			return null;
		}
	}
}

