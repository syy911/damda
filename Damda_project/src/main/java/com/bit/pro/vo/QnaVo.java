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
	private String answerStatus;
	private Date qnaDate;
	
	private int ROWNUM;
	private int whatBtn;
	private int nextBtnClick;
	private int totalCount;
	public QnaVo() {
		// TODO Auto-generated constructor stub
	}
	public QnaVo(int qnaNum, String useremail, String userName, int userNum, String qnaSub, String qnaKind,
			String qnaPw, String qnaCon, String answerCon, String answerStatus, Date qnaDate, int rOWNUM, int whatBtn,
			int nextBtnClick, int totalCount) {
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
		this.answerStatus = answerStatus;
		this.qnaDate = qnaDate;
		ROWNUM = rOWNUM;
		this.whatBtn = whatBtn;
		this.nextBtnClick = nextBtnClick;
		this.totalCount = totalCount;
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
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getROWNUM() {
		return ROWNUM;
	}
	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
	}
	public int getWhatBtn() {
		return whatBtn;
	}
	public void setWhatBtn(int whatBtn) {
		this.whatBtn = whatBtn;
	}
	public int getNextBtnClick() {
		return nextBtnClick;
	}
	public void setNextBtnClick(int nextBtnClick) {
		this.nextBtnClick = nextBtnClick;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "QnaVo [qnaNum=" + qnaNum + ", useremail=" + useremail + ", userName=" + userName + ", userNum="
				+ userNum + ", qnaSub=" + qnaSub + ", qnaKind=" + qnaKind + ", qnaPw=" + qnaPw + ", qnaCon=" + qnaCon
				+ ", answerCon=" + answerCon + ", answerStatus=" + answerStatus + ", qnaDate=" + qnaDate + ", ROWNUM="
				+ ROWNUM + ", whatBtn=" + whatBtn + ", nextBtnClick=" + nextBtnClick + ", totalCount=" + totalCount
				+ "]";
	}	
}
