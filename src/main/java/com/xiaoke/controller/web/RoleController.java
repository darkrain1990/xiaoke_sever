package com.xiaoke.controller.web;


import com.xiaoke.entity.Role;
import com.xiaoke.entity.vo.SysAuthorities;
import com.xiaoke.entity.SysRoleAuthorities;
import com.xiaoke.entity.qo.SysRoleQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.service.RoleService;
import com.xiaoke.service.SysRoleAuthoritiesService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private SysRoleAuthoritiesService service;
	
	Logger logger = LoggerFactory.getLogger(SysUsersController.class);
	/**
	 * 显示角色分页对象
	 * @author wwh
	 * @throws UnsupportedEncodingException 
	 * @Date 2016年3月17日 
	 */
	@RequestMapping("/searchRole")
	@ResponseBody
	public String seacheRole(int index,int pageSize,String roleName, int systemId) throws UnsupportedEncodingException {
		/*
		 * index:当前页面索引
		 * pagesize:页面大小 所显示的总条数
		 * roleName:角色名称
		 * systemId:所属系统id
		 * */
		//解决编码格式问题
		String ro=new String(roleName.getBytes("iso-8859-1"),"utf-8");
		
		SysRoleQO sq=new SysRoleQO(index,pageSize,ro,systemId);
		PageBean<Role> page=roleService.searchRoleByCondition(sq);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageTotal", page.getPageTotal());
		map.put("index", index);
		
		//页面只显示flag=1的角色 除去roles中flag为0的角色
		List<Role> roles=page.getList();

		map.put("roles", roles);
		JSONObject json = JSONObject.fromObject(map);
		return json.toString();
		
	}
	
	/**
	 * 添加角色
	 * @author wwh
	 * @throws UnsupportedEncodingException 
	 * @Date 2016年3月16日 下午2:20:34
	 */
	@ResponseBody
	@RequestMapping("/add")
	public String addRole(String roleName,String roleDesc,Integer systemId,Integer enabled,Integer issys) throws UnsupportedEncodingException {
		//设置可能出现中文字段  存入数据库的编码格式
		String ro=new String(roleName.getBytes("iso-8859-1"),"utf-8");
		String des=new String(roleDesc.getBytes("iso-8859-1"),"utf-8");

		
		Role role=new Role(ro,des,enabled,issys,systemId);
		JSONObject json = roleService.addRoles(role);
		return json.toString();
	}
	/**
	 * 删除角色
	 * @author wwh
	 * @Date 2016年3月17日 
	 */
	@ResponseBody
	@RequestMapping("/dele/{id}")
	public String deleteRole(@PathVariable String id){
		JSONObject json =  new JSONObject();
		//System.out.println(id);
		try {
			json=roleService.delRoelById(id);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		return json.toString();
	}
	/**
	 * 修改角色
	 * @author wwh
	 * @throws UnsupportedEncodingException 
	 * @Date 2016年3月22日 
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateRole(int id,String roleName,String roleDesc,Integer systemId,Integer enabled,Integer issys) throws UnsupportedEncodingException{
		JSONObject json =  new JSONObject();
		String ro=new String(roleName.getBytes("iso-8859-1"),"utf-8");
		String des=new String(roleDesc.getBytes("iso-8859-1"),"utf-8");
		
		Role role=new Role(ro,des,enabled,issys,1,systemId);
		try {
			json=roleService.updateRoleById(role);
		} catch (Exception e) {
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		return json.toString();
	}
	
	/**
	 * 给角色添加或者删除权限
	 * @author wwh
	 * */
	@RequestMapping("/addordel")
	@ResponseBody
	public String addordelAuthorities(int roleId,int authorityId,String flag){
		JSONObject json =  new JSONObject();
		
		JSONObject str =  new JSONObject();
		str=service.selrole(new SysRoleAuthorities(roleId, authorityId) );
		Boolean bool=(Boolean) str.get("result");
		
		try {
			
			if(flag.equalsIgnoreCase("del")){//给角色删除权限操作
				
				if(bool){//判断数据库中该角色是否有对应的权限   有  就删除
					json = service.delRoleAuthorities(new SysRoleAuthorities(roleId, authorityId));
				}else{
					
				}
				
			}else{//给角色添加权限操作
				if(bool){
					
				}else{
					json = service.addRoleAuthorities(new SysRoleAuthorities(roleId, authorityId));
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}
	/**
	 * 显示系统所有的权限
	 * */
	@RequestMapping("/show/{systemId}")
	@ResponseBody
	public String showAuthorities(@PathVariable int systemId){
		JSONObject json =  new JSONObject();
		
		List<SysAuthorities> list=service.findAuthorities(systemId);
		
		json.put("result", list);
		
		return json.toString();
	}
	/**
	 * 查询角色所拥有的权限
	 * */
	@RequestMapping("/sel")
	@ResponseBody
	public String selRole(int roleId,int authorityId){
		JSONObject json =  new JSONObject();
		SysRoleAuthorities sys=new SysRoleAuthorities(roleId, authorityId);
		json = service.selrole(sys);
		
		return json.toString();
	}
}
