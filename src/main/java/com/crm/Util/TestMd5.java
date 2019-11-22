package com.crm.Util;

import org.apache.shiro.crypto.hash.Md5Hash;

public class TestMd5 {
	
	public static void main(String[] args) {
		Md5Hash md5Hash = new Md5Hash("123", "asdf");
		String string = md5Hash.toString();
		System.out.println(string);
		
	}

}
