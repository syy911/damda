package com.bit.pro.vo;

public class JoinVo {
	private String userid, userpw, username, useraddr1, useraddr2, useremail,userbirth, userphone;
	private int userpostnum;
	
	public JoinVo() {
	}

	public JoinVo(String userid, String userpw, String username, String useraddr1, String useraddr2, String useremail, int userpostnum,
			String userphone, String userbirth) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userbirth = userbirth;
		this.useraddr1 = useraddr1;
		this.useraddr2 = useraddr2;
		this.useremail = useremail;
		this.userpostnum = userpostnum;
		this.userphone = userphone;
	}

	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @return the userpw
	 */
	public String getUserpw() {
		return userpw;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @return the useraddr1
	 */
	public String getUseraddr1() {
		return useraddr1;
	}

	/**
	 * @return the useraddr2
	 */
	public String getUseraddr2() {
		return useraddr2;
	}

	/**
	 * @return the useremail
	 */
	public String getUseremail() {
		return useremail;
	}

	/**
	 * @return the userbirth
	 */
	public String getUserbirth() {
		return userbirth;
	}

	/**
	 * @return the userphone
	 */
	public String getUserphone() {
		return userphone;
	}

	/**
	 * @return the userpostnum
	 */
	public int getUserpostnum() {
		return userpostnum;
	}

	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/**
	 * @param userpw the userpw to set
	 */
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param useraddr1 the useraddr1 to set
	 */
	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}

	/**
	 * @param useraddr2 the useraddr2 to set
	 */
	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}

	/**
	 * @param useremail the useremail to set
	 */
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	/**
	 * @param userbirth the userbirth to set
	 */
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}

	/**
	 * @param userphone the userphone to set
	 */
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	/**
	 * @param userpostnum the userpostnum to set
	 */
	public void setUserpostnum(int userpostnum) {
		this.userpostnum = userpostnum;
	}

	@Override
	public String toString() {
		return "JoinVo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", useraddr1=" + useraddr1
				+ ", useraddr2=" + useraddr2 + ", useremail=" + useremail + ", userbirth=" + userbirth + ", userphone="
				+ userphone + ", userpostnum=" + userpostnum + "]";
	}

	
	
	
	
	
	
	
}
