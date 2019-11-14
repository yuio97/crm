package com.crm.Util;

import java.util.Random;

import org.apache.shiro.crypto.hash.Md5Hash;

public class CharUtil {
	
	/**
	 * ����ָ�������ַ���
	 * @param count
	 * @return
	 */
	public static String getRandomString(int count)
	{
		char fu[] = {'a','b','c','d','e','f','g','1','2','3'};
		Random random = new Random();
		StringBuffer code = new StringBuffer();
		for(int i = 0; i < count; i++)
		{
			int nextInt = random.nextInt(10);
			code.append(fu[nextInt]);
		}
		return code.toString();
		
	}
	
	public static String passwordMd5(String password,String salt) {
		Md5Hash md5Hash = new Md5Hash(password, salt);
		String string = md5Hash.toString();
		return string.toString();
		
	}
	
	public static void main(String[] args) {
		System.out.println(CharUtil.passwordMd5("123456", "qwerty"));
	}
}
