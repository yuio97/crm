package com.crm.configration;

import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.crm.realm.MyRealm;


@Configuration
public class ShiroConfig {
	
	//匹配器
	@Bean
	public CredentialsMatcher credentialsMatcher() {
		HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
		credentialsMatcher.setHashAlgorithmName("md5");
		credentialsMatcher.setHashIterations(1);
		return credentialsMatcher;
		
	}
	
	//自定义域:注入匹配器
	@Bean
	public MyRealm myRealm() {
		MyRealm myRealm = new MyRealm();
		myRealm.setCredentialsMatcher(credentialsMatcher());
		return myRealm;
	}
	
	//缓存管理器
	@Bean
	public CacheManager cacheManager() {
		return new EhCacheManager();
	}
	
	//会话管理器 
	@Bean
	public SessionManager sessionManager() {
		DefaultWebSessionManager sessionManager = new	DefaultWebSessionManager();
		sessionManager.setGlobalSessionTimeout(1800000);
		sessionManager.setDeleteInvalidSessions(true);
		return sessionManager;
	}
	
	//安全管理器
	@Bean
	public SecurityManager securityManager() {
		System.out.println("------------SecurityManager--------------");
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(myRealm());
		securityManager.setCacheManager(cacheManager());
		securityManager.setSessionManager(sessionManager());
		return  securityManager;
	}
	//<!-- 配置过滤器工厂类 -->
	@Bean
	public ShiroFilterFactoryBean shiroFilterFactoryBean() {
		
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager());
		
		shiroFilterFactoryBean.setLoginUrl("/login.jsp");
		shiroFilterFactoryBean.setSuccessUrl("/child.jsp");
		shiroFilterFactoryBean.setUnauthorizedUrl("/unauthorized.jsp");
		
		//表单认证器
		FormAuthenticationFilter formAuthenticationFilter = new FormAuthenticationFilter();
		formAuthenticationFilter.setLoginUrl("/login");
		formAuthenticationFilter.setUsernameParam("name");
		formAuthenticationFilter.setPasswordParam("password");
		
		//退出登录
		LogoutFilter logoutFilter = new LogoutFilter();
		logoutFilter.setRedirectUrl("/login.jsp");
		
		
		
		Map<String, Filter> filters = shiroFilterFactoryBean.getFilters();
		filters.put("authc", formAuthenticationFilter);
		filters.put("logout", logoutFilter);
		
		//<!-- 配置请求的拦截或不拦截 -->
		Map<String, String> filterChainDefinitionMap = shiroFilterFactoryBean.getFilterChainDefinitionMap();
		filterChainDefinitionMap.put("/js/**", "anon");
		filterChainDefinitionMap.put("/css/**", "anon");
		filterChainDefinitionMap.put("/images/**", "anon");
		filterChainDefinitionMap.put("/data/**", "anon");
		filterChainDefinitionMap.put("/vendor/**", "anon");
		filterChainDefinitionMap.put("/fonts/**", "anon");
		filterChainDefinitionMap.put("/layui/**", "anon");
		filterChainDefinitionMap.put("/login.jsp", "anon");
		filterChainDefinitionMap.put("/register.jsp", "anon");
		filterChainDefinitionMap.put("/favicon.ico", "anon");

//		filterChainDefinitionMap.put("/**", "anon");
		
//		filterChainDefinitionMap.put("/logout", "logout");
//		filterChainDefinitionMap.put("/**", "authc");
//		
		return shiroFilterFactoryBean;
	}
	
//使得controller可以使用注解的方式，配置权限
	
	//使让权限注解生效的对象的生命周期controller一致
	
	@Bean(name="lifecycleBeanPostProcessor")
	public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
		return new LifecycleBeanPostProcessor();
	}
	
	@Bean
	@DependsOn(value="lifecycleBeanPostProcessor")
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
		defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
		return defaultAdvisorAutoProxyCreator;
	}
	@Bean
	public AuthorizationAttributeSourceAdvisor authorzationAdvisor() {
		AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
		advisor.setSecurityManager(securityManager());
		advisor.setSecurityManager(securityManager());
		return advisor;
	}
	
	
	//使用全局异常专门处理未授权异常，跳转到对应页面
	@Bean
	public HandlerExceptionResolver simpleMappingExceptionResolver() {
		SimpleMappingExceptionResolver resolver = new SimpleMappingExceptionResolver();
		Properties properties = new Properties();
		properties.put("org.apache.shiro.authz.UnauthorizedException", "/unauthorized.jsp");
		return resolver;
	}
}
