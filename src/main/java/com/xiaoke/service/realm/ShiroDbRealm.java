package com.xiaoke.service.realm;

import com.xiaoke.entity.SysUsers;
import com.xiaoke.entity.SysUsersRoles;
import com.xiaoke.entity.qo.SysAuthorityResourceQO;
import com.xiaoke.entity.qo.SysRolesAuthoritiesQO;
import com.xiaoke.service.SysUsersService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ShiroDbRealm extends AuthorizingRealm{

	private Logger log = LoggerFactory.getLogger(ShiroDbRealm.class);
	private static final String OR_OPERATOR = " or ";
	private static final String AND_OPERATOR = " and ";
	private static final String NOT_OPERATOR = "not ";
	
	@Autowired
	private SysUsersService sysUsersService;
	
	public ShiroDbRealm() {
        setName("ShiroDbRealm");
        //setCredentialsMatcher(new HashedCredentialsMatcher("SHA-256"));
    }   

	/**
     * 支持or and not 关键词  不支持and or混用
     * @param principals
     * @param permission
     * @return
     */
    public boolean isPermitted(PrincipalCollection principals, String permission) {
        if(permission.contains(OR_OPERATOR)) {
            String[] permissions = permission.split(OR_OPERATOR);
            for(String orPermission : permissions) {
                if(isPermittedWithNotOperator(principals, orPermission)) {
                    return true;
                }
            }
            return false;
        } else if(permission.contains(AND_OPERATOR)) {
            String[] permissions = permission.split(AND_OPERATOR);
            for(String orPermission : permissions) {
                if(!isPermittedWithNotOperator(principals, orPermission)) {
                    return false;
                }
            }
            return true;
        } else {
            return isPermittedWithNotOperator(principals, permission);
        }
    }    
	     
    private boolean isPermittedWithNotOperator(PrincipalCollection principals, String permission) {
        if(permission.startsWith(NOT_OPERATOR)) {
            return !super.isPermitted(principals, permission.substring(NOT_OPERATOR.length()));
        } else {
            return super.isPermitted(principals, permission);
        }
    }    
	    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    	try {
    		SysUsers u = new SysUsers();
    		u.setLoginName((String) principals.getPrimaryPrincipal());
	    	SysUsers account = sysUsersService.checkUserLogin(u);
	    	
	        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
	        System.out.println("doGetAuthorizationInfo  --------------  "+account.getId());
	        
	        //根据用户得到角色
	        for (SysUsersRoles userRole : sysUsersService.findRolesByUser(account)) {
	            info.addRole(userRole.getRoleId().toString());
	            //根据角色得到权限
	            List<SysRolesAuthoritiesQO> list = sysUsersService.findAuthByRoles(userRole.getRoleId());
	            if ( ! CollectionUtils.isEmpty(list)) {
	            	for (SysRolesAuthoritiesQO p : list) {
	            		//根据权限得到资源
	            		List<SysAuthorityResourceQO> l = sysUsersService.findResByAu(p.getAu_id());
	            		if ( ! CollectionUtils.isEmpty(l)) {
	    	            	for (SysAuthorityResourceQO o : l) {
	    	            		info.addStringPermission(o.getRe_name());
	    	            	}
	    	            }
	            	}
	            }
	        }
	        return info;
    	} catch(Exception e){
    		e.printStackTrace();
    		log.error(e.getMessage());
    		return null;
    	}
    }   

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
    	try {
    		SysUsers u = new SysUsers();
    		u.setLoginName(((UsernamePasswordToken) token).getUsername());
	    	SysUsers account = sysUsersService.checkUserLogin(u);
	        if (account != null) {
	            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(account.getLoginName(), account.getUserPassword(),"");
	            info.setCredentialsSalt(ByteSource.Util.bytes(account.getLoginName()));
	            doGetAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	            return info;
	        } else {
	            return null;
	        }
		} catch(Exception e){
			log.error(e.getMessage());
			return null;
		}
    }   
}
