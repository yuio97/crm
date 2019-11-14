package com.crm.realm;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;

import com.crm.bean.SysAccount;
import com.crm.bean.SysPermission;
import com.crm.bean.SysRole;
import com.crm.bean.SysRoleStaff;
import com.crm.bean.SysStaffInfo;
import com.crm.dao.SysAccountMapper;
import com.crm.dao.SysRoleMapper;
import com.crm.dao.SysRoleStaffMapper;
import com.crm.dao.SysStaffInfoMapper;


public class MyRealm extends AuthorizingRealm{
	
	@Resource
	private SysRoleMapper SysRoleMapper;
	
	@Resource
	public SysStaffInfoMapper sysStaffInfoMapper;
	
	@Resource
	public SysAccountMapper sysAccountMapper;
	

	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		SysAccount user = (SysAccount) principals.getPrimaryPrincipal();
		
		//存session
//		Subject subject = SecurityUtils.getSubject();
//		SysAccount user = (SysAccount) subject.getPrincipal();		
		SysStaffInfo info = sysStaffInfoMapper.getInfoByStaffName(user.getSysAccountName()); 		
//		subject.getSession().setAttribute("user", info);
		
		//根据用户信息查询角色和角色对应的权限
//		List<SysRoleStaff> list = sysRoleStaffMapper.getPermissionByStaffId(info.getSysStaffId());
//		for (SysRoleStaff sysRoleStaff : list) {
//			System.out.println(sysRoleStaff.getSysRoleId());
//			for (SysPermission dd : sysRoleStaff.getSysPerList()) {
//				System.out.println(dd.getSysPermissionName());
//			}
//		}
		
//		for (SysRoleStaff role : list) {
//			authorizationInfo.addRole(role);
//		}
//		
		
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String principal = (String) token.getPrincipal();
		SysAccount account = sysAccountMapper.getAccountByUserName(principal);
		
		if(account == null)
		{
			return null;
		}
		else
		{
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(account, account.getSysAccountPass(), ByteSource.Util.bytes(account.getSysAccountSalt()),"myrealm");
			
			List<SysRole> perByStaffId = SysRoleMapper.getPerByStaffId(1);
			
			return info;
		}
			
	}

}
