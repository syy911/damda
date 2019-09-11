package com.bit.pro.vo;

public class LoginVo {

	private int userNum;
	private String userId;
	private String userPw;
	private String userName;
	private	String userAddr;
	private int userPostnum;
	private int userPhone;
	private String userEmain;
	private int userBuy;
	private String userAcc;
	private String userBank;
	private String userAccount;
	private String userGrade;
	private int category;
	private int userPoint;
	
	
	public LoginVo() {}
	
	public LoginVo(int userNum, String userId, String userPw, String userName, String userAddr, int userPostnum,
			int userPhone, String userEmain, int userBuy, String userAcc, String userBank, String userAccount,
			String userGrade, int category, int userPoint) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAddr = userAddr;
		this.userPostnum = userPostnum;
		this.userPhone = userPhone;
		this.userEmain = userEmain;
		this.userBuy = userBuy;
		this.userAcc = userAcc;
		this.userBank = userBank;
		this.userAccount = userAccount;
		this.userGrade = userGrade;
		this.category = category;
		this.userPoint = userPoint;
	}
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public int getUserPostnum() {
		return userPostnum;
	}
	public void setUserPostnum(int userPostnum) {
		this.userPostnum = userPostnum;
	}
	public int getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmain() {
		return userEmain;
	}
	public void setUserEmain(String userEmain) {
		this.userEmain = userEmain;
	}
	public int getUserBuy() {
		return userBuy;
	}
	public void setUserBuy(int userBuy) {
		this.userBuy = userBuy;
	}
	public String getUserAcc() {
		return userAcc;
	}
	public void setUserAcc(String userAcc) {
		this.userAcc = userAcc;
	}
	public String getUserBank() {
		return userBank;
	}
	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + category;
		result = prime * result + ((userAcc == null) ? 0 : userAcc.hashCode());
		result = prime * result + ((userAccount == null) ? 0 : userAccount.hashCode());
		result = prime * result + ((userAddr == null) ? 0 : userAddr.hashCode());
		result = prime * result + ((userBank == null) ? 0 : userBank.hashCode());
		result = prime * result + userBuy;
		result = prime * result + ((userEmain == null) ? 0 : userEmain.hashCode());
		result = prime * result + ((userGrade == null) ? 0 : userGrade.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + userNum;
		result = prime * result + userPhone;
		result = prime * result + userPoint;
		result = prime * result + userPostnum;
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
		return result;
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoginVo other = (LoginVo) obj;
		if (category != other.category)
			return false;
		if (userAcc == null) {
			if (other.userAcc != null)
				return false;
		} else if (!userAcc.equals(other.userAcc))
			return false;
		if (userAccount == null) {
			if (other.userAccount != null)
				return false;
		} else if (!userAccount.equals(other.userAccount))
			return false;
		if (userAddr == null) {
			if (other.userAddr != null)
				return false;
		} else if (!userAddr.equals(other.userAddr))
			return false;
		if (userBank == null) {
			if (other.userBank != null)
				return false;
		} else if (!userBank.equals(other.userBank))
			return false;
		if (userBuy != other.userBuy)
			return false;
		if (userEmain == null) {
			if (other.userEmain != null)
				return false;
		} else if (!userEmain.equals(other.userEmain))
			return false;
		if (userGrade == null) {
			if (other.userGrade != null)
				return false;
		} else if (!userGrade.equals(other.userGrade))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userNum != other.userNum)
			return false;
		if (userPhone != other.userPhone)
			return false;
		if (userPoint != other.userPoint)
			return false;
		if (userPostnum != other.userPostnum)
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "LoginVo [userNum=" + userNum + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userAddr=" + userAddr + ", userPostnum=" + userPostnum + ", userPhone=" + userPhone
				+ ", userEmain=" + userEmain + ", userBuy=" + userBuy + ", userAcc=" + userAcc + ", userBank="
				+ userBank + ", userAccount=" + userAccount + ", userGrade=" + userGrade + ", category=" + category
				+ ", userPoint=" + userPoint + "]";
	}
	
}
