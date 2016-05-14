package com.xiaoke.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xiaoke.entity.vo.SysAuthorities;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoke.common.util.StringUtilSingleton;
import com.xiaoke.entity.SysUsers;
import com.xiaoke.entity.SysUsersRoles;
import com.xiaoke.entity.qo.SysAuthorityResourceQO;
import com.xiaoke.entity.qo.SysRolesAuthoritiesQO;
import com.xiaoke.entity.qo.SysUsersQO;
import com.xiaoke.entity.vo.PageBean;
import com.xiaoke.entity.vo.SysUsersVO;
import com.xiaoke.mapper.SysAuthoritiesMapper;
import com.xiaoke.mapper.SysUsersMapper;
import com.xiaoke.mapper.SysUsersRolesMapper;
import com.xiaoke.service.SysUsersService;
import org.springframework.transaction.annotation.Transactional;

//@Service("sysUsersService")
@Service
public class SysUsersServiceImpl implements SysUsersService {
	@Autowired
	private SysUsersMapper sysUsersMapper;
	@Autowired
	private SysUsersRolesMapper sysUsersRolesMapper;
	@Autowired
	private SysAuthoritiesMapper sysAuthoritiesMapper;
	
	private final String RESULT = "result";
	private final String SUCCESS = "SUCCESS";
	private final String FAILURE = "FAILURE";
	
	private StringUtilSingleton sus = StringUtilSingleton.getInstance();

	/**
	 * 条件查询SysUsers分页对象
	 * 
	 * @param param 条件对象
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午2:05:12
	 */
    @Override
	public JSONObject findSysUsersByCondition(SysUsersQO param) {
		Validate.notNull(param);
		//计算起始行及结束行
		param.calculateBeginRowAndEndRow();	
		JSONObject json = new JSONObject();
		
		//获取分页对象
		int total = sysUsersMapper.findTotal(param);
		
		PageBean<SysUsers> page = new PageBean<SysUsers>(param.getPageSize(), total);
		page.setIndex(param.getIndex());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageTotal", page.getPageTotal());
		map.put("index", page.getIndex());
		
		if(total>0){
			List<SysUsers> users = sysUsersMapper.findSysUsers(param);
			page.setList(users);
			map.put("users", users);
		}else
			map.put("users", null);

		json = JSONObject.fromObject(map);
		return json;
	}

	/**
	 * 添加用户，用户密码进行md5加密
	 * 
	 * @param user
	 * 
	 * @author wwh
	 * @Date 2016年3月16日 下午2:05:12
	 */
    @Transactional
	public JSONObject addUser(SysUsers user) {
		Validate.notNull(user, "user is null");
		JSONObject json = new JSONObject();
		
		//验证登录名是否存在
		SysUsersQO qo = new SysUsersQO();
		qo.setLoginName(user.getLoginName());
		int count = sysUsersMapper.findTotal(qo);
		
		if(count>0)
			json.put(RESULT, "用户名已存在");
		else{
			// 判断邮箱是否为空，如果邮箱不为空则判断邮箱格式是否正确
			if(!StringUtils.isEmpty(user.getEmail()) && !sus.isEmail(user.getEmail()))
				json.put(RESULT, "邮箱地址格式不正确");
			else{
				//判断手机号是否为空，如果不为空则判断手机号格式是否正确
				if(!StringUtils.isEmpty(user.getMobileNum()) && !sus.isMobile( user.getMobileNum()))
					json.put(RESULT, "手机号格式不正确");
				else{
					//初始化一些参数，并将密码MD5加密
					user.initialize();
					int row = sysUsersMapper.addUser(user);

                    //TODO TEST
                    SysAuthorities sa=new SysAuthorities();
                    sa.setId(null);
                    sa.setAuthority_name("aaaa");
                    sysAuthoritiesMapper.addAuth(sa);

					if(row>0){
						SysUsersQO param = new SysUsersQO();
						json = findSysUsersByCondition(param);
						json.put(RESULT, SUCCESS);
					} else
						json.put(RESULT, FAILURE);
				}
				
			}
			
		}
		
		return json;
	}
	
	/**
	 * 修改用户
	 * @param user
	 * @return 
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 上午10:17:31
	 */
	public JSONObject updateUser(SysUsersQO user) {
		Validate.notNull(user, "user is null");
		JSONObject json = new JSONObject();
		
		int count = sysUsersMapper.updateUserById(user);
		
		if(count>0){
			SysUsersQO param = new SysUsersQO();
			param.setIndex(user.getIndex());
			json = findSysUsersByCondition(param);
			json.put(RESULT, SUCCESS);
		} else
			json.put(RESULT, FAILURE);
		
		return json;
	}

	/**
	 * 根据id删除用户
	 * @param id
	 * @return 受影响行数
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午2:56:17
	 */
	public JSONObject delUserById(Integer id) {
		Validate.notNull(id, "id can't be null");
		JSONObject json = new JSONObject();
		
		int count = sysUsersMapper.delUserById(id);
		
		if(count>0){
			SysUsersQO param = new SysUsersQO();
			json = findSysUsersByCondition(param);
			json.put(RESULT, SUCCESS);
		} else
			json.put(RESULT, FAILURE);
		
		return json;
	}
	
	/**
	 * 根据id获取用户
	 * 
	 * @param id
	 * 
	 * @author wwh
	 * @Date 2016年3月18日 下午4:50:58
	 */
	public JSONObject findUserById(Integer id) {
		Validate.notNull(id, "id can't be or null");
		
		JSONObject json = new JSONObject();
		SysUsersVO userVO = null;
		SysUsers user = new SysUsers();
		user.setId(id);
		
		user = sysUsersMapper.userLogin(user);
		
		if(user!=null){
			userVO = new SysUsersVO(user.getId(),
									user.getLoginName(),
									user.getUserName(),
									user.getUserDesc(), 
									user.getEnabled(), 
									user.getIssys(),
									user.getUserDept(), 
									user.getUserDuty(), 
									user.getEmail(), 
									user.getMobileNum());
		}
		json.put("user", userVO);
		
		return json;
	}

	/**
	 * 登录验证
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 9:54 AM 2016.3.24
	 */
	@Override
	public SysUsers checkUserLogin(SysUsers user) {
		// TODO Auto-generated method stub
		SysUsers sysU = sysUsersMapper.userLogin(user);
		return sysU;
	}

	/**
	 * 获取角色根据登录用户
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 2:06 PM 2016.3.24
	 */
	@Override
	public List<SysUsersRoles> findRolesByUser(SysUsers user) {
		// TODO Auto-generated method stub
		SysUsersRoles s = new SysUsersRoles();
		s.setUserId(user.getId());
		List<SysUsersRoles> lUR = sysUsersRolesMapper.findRoleByUser(s);
		return lUR;
	}
	
	/**
	 * 根据角色获取权限
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 4:06 PM 2016.3.28
	 */
	@Override
	public List<SysRolesAuthoritiesQO> findAuthByRoles(Integer role_id) {
		// TODO Auto-generated method stub
		List<SysRolesAuthoritiesQO> list = new ArrayList<SysRolesAuthoritiesQO>();
		List<Map> map = sysAuthoritiesMapper.findAuthByRoles(role_id);
		for(int i=0;i<map.size();i++){
			Map m = map.get(i);
			SysRolesAuthoritiesQO qo = new SysRolesAuthoritiesQO();
			qo.setAu_id((Integer) m.get("au_id"));
			qo.setRole_id((Integer) m.get("role_id"));
			qo.setAu_name((String) m.get("au_name"));
			qo.setRole_name((String) m.get("role_name"));
			list.add(qo);
		}
		return list;
	}
	
	/**
	 * 根据权限获取资源
	 * @param user
	 * @return
	 * @author wwh
	 * @Date 4:06 PM 2016.3.28
	 */
	@Override
	public List<SysAuthorityResourceQO> findResByAu(Integer au_id) {
		// TODO Auto-generated method stub
		List<SysAuthorityResourceQO> list = new ArrayList<SysAuthorityResourceQO>();
		List<Map> map = sysAuthoritiesMapper.findResByAu(au_id);
		for(int i=0;i<map.size();i++){
			Map m = map.get(i);
			SysAuthorityResourceQO qo = new SysAuthorityResourceQO();
			qo.setAu_id((Integer) m.get("au_id"));
			qo.setRe_id((Integer) m.get("Re_id"));
			qo.setAu_name((String) m.get("au_name"));
			qo.setRe_name((String) m.get("re_name"));
			list.add(qo);
		}
		return list;
	}
}
