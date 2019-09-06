package com.bit.pro.vo;

import java.sql.Date;

public class QnaVo {
	
	private int qnaNum;
	private String useremail;
	private String userName;
	private int userNum;
	private String qnaSub;
	private String qnaKind;
	private String qnaPw;
	private String qnaCon;
	private String answerCon;
	private String qnaStatus;
	private Date qnaDate;
	public QnaVo() {
		// TODO Auto-generated constructor stub
	}
	public QnaVo(int qnaNum, String useremail, String userName, int userNum, String qnaSub, String qnaKind,
			String qnaPw, String qnaCon, String answerCon, String qnaStatus, Date qnaDate) {
		super();
		this.qnaNum = qnaNum;
		this.useremail = useremail;
		this.userName = userName;
		this.userNum = userNum;
		this.qnaSub = qnaSub;
		this.qnaKind = qnaKind;
		this.qnaPw = qnaPw;
		this.qnaCon = qnaCon;
		this.answerCon = answerCon;
		this.qnaStatus = qnaStatus;
		this.qnaDate = qnaDate;
	}

	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getQnaSub() {
		return qnaSub;
	}
	public void setQnaSub(String qnaSub) {
		this.qnaSub = qnaSub;
	}
	public String getQnaKind() {
		return qnaKind;
	}
	public void setQnaKind(String qnaKind) {
		this.qnaKind = qnaKind;
	}
	public String getQnaPw() {
		return qnaPw;
	}
	public void setQnaPw(String qnaPw) {
		this.qnaPw = qnaPw;
	}
	public String getQnaCon() {
		return qnaCon;
	}
	public void setQnaCon(String qnaCon) {
		this.qnaCon = qnaCon;
	}
	public String getAnswerCon() {
		return answerCon;
	}
	public void setAnswerCon(String answerCon) {
		this.answerCon = answerCon;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	@Override
	public String toString() {
		return "QnaVo [qnaNum=" + qnaNum + ", useremail=" + useremail + ", userName=" + userName + ", userNum="
				+ userNum + ", qnaSub=" + qnaSub + ", qnaKind=" + qnaKind + ", qnaPw=" + qnaPw + ", qnaCon=" + qnaCon
				+ ", answerCon=" + answerCon + ", qnaStatus=" + qnaStatus + ", qnaDate=" + qnaDate + "]";
	}
	
}
