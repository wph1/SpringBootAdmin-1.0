package com.geekcattle.model.console;

import java.io.Serializable;

/**
 * 创建日期:2018年4月7日<br/>
 * 代码创建:黄聪<br/>
 * 功能描述:用户实体类<br/>
 */
public class SysUser implements Serializable {
	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 密码
	 */
	private String password;

	private static final long serialVersionUID = 1L;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}