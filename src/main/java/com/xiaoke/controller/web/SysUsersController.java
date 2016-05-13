package com.xiaoke.controller.web;

import com.xiaoke.entity.SysUsers;
import com.xiaoke.entity.SysUsersRoles;
import com.xiaoke.entity.qo.SysUsersQO;
import com.xiaoke.service.SysUsersRolesService;
import com.xiaoke.service.SysUsersService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/user")
@RestController
public class SysUsersController {

	Logger logger = LoggerFactory.getLogger(SysUsersController.class);
	
	@Autowired
	private SysUsersService sysUsersService;
	@Autowired
	private SysUsersRolesService sysUsersRolesService;
	
	/**
	 * 显示用户分页对象
	 * @author wwh
	 * @Date 2016年3月16日 下午2:20:34
	 */
	@RequestMapping(method=RequestMethod.GET,value="/show")
	public String showSysUsers(int index,int pageSize,String mobile,String loginName){
        if(index==0){
            index=1;
        }

		SysUsersQO param = new SysUsersQO(pageSize,index,mobile,loginName);
		JSONObject json =  new JSONObject();

		try {
			json = sysUsersService.findSysUsersByCondition(param);
		} catch (Exception e) {
			logger.error(e.getMessage());
            e.printStackTrace();
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}
	
	/**
	 * 添加用户
	 * 
	 * @param user
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午3:14:09
	 */
	@RequestMapping(method=RequestMethod.POST,value="/add")
	public String addUser(SysUsers user){
		JSONObject json =  new JSONObject();
		
		try {
			json = sysUsersService.addUser(user);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}
	
	/**
	 * 根据id删除用户
	 * 
	 * @param id 
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午3:02:04
	 */
	@RequestMapping(method=RequestMethod.POST,value="/del/{id}")
	public String delUserById(@PathVariable Integer id){
		JSONObject json =  new JSONObject();
		try {
			json = sysUsersService.delUserById(id);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		return json.toString();
	}
	
	/**
	 * 修改用户
	 * 
	 * @param user 
	 * @return
	 * 
	 * @author wwh
	 * @Date 2016年3月23日 上午11:15:06
	 */
	@RequestMapping(method=RequestMethod.POST,value="/update")
	public String updateUser(SysUsersQO user){
		JSONObject json =  new JSONObject();
		try {
			json = sysUsersService.updateUser(user);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		return json.toString();
	}
	
	/**
	 * 添加或删除用户角色
	 * 
	 * @param userId 用户id
	 * @param roleId 角色id
	 * @param flag 标识 , 判断是删除还是新增  del:删除, add:新增
	 * 
	 * @author wwh
	 * @Date 2016年3月25日 下午5:17:09
	 */
	@RequestMapping(method=RequestMethod.POST,value="/aod")
	public String addOrDelUsersRoles(Integer userId,Integer roleId,String flag){
		JSONObject json =  new JSONObject();
		try {
			
			if(flag.equalsIgnoreCase("del")){
				json = sysUsersRolesService.delUsersRoles(new SysUsersRoles(userId, roleId));
			}else{
				json = sysUsersRolesService.addUsersRoles(new SysUsersRoles(userId, roleId));
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}
	
	/**
	 * 根据id查询用户
	 * @author wwh
	 * @Date 2016年3月18日 下午4:28:07
	 */
	/*@RequestMapping("/find/{id}")
	public String findUserById(@PathVariable String id){
		JSONObject json = new JSONObject();
		
		try {
			json = sysUsersService.findUserById(id);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("ERROR", "服务器异常 error_code(500)");
		}
		
		return json.toString();
	}*/	
		
	
}
