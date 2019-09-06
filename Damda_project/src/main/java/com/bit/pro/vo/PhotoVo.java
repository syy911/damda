package com.bit.pro.vo;

public class PhotoVo {
	private int photoNum;
	private int photoCtg;
	private String photoCtg2;
	private String photoPath;
	private String photoName;
	private String originalName;
	private int p_itemNum;
	private int p_ingredientNum;
	private int p_reviewNum;
	private int p_eventNum;
	private int p_noticeNum;
	private int p_qnaNum;
	public PhotoVo() {
		// TODO Auto-generated constructor stub
	}
	public PhotoVo(int photoNum, int photoCtg, String photoCtg2, String photoPath, String photoName,
			String originalName, int p_itemNum, int p_ingredientNum, int p_reviewNum, int p_eventNum, int p_noticeNum,
			int p_qnaNum) {
		super();
		this.photoNum = photoNum;
		this.photoCtg = photoCtg;
		this.photoCtg2 = photoCtg2;
		this.photoPath = photoPath;
		this.photoName = photoName;
		this.originalName = originalName;
		this.p_itemNum = p_itemNum;
		this.p_ingredientNum = p_ingredientNum;
		this.p_reviewNum = p_reviewNum;
		this.p_eventNum = p_eventNum;
		this.p_noticeNum = p_noticeNum;
		this.p_qnaNum = p_qnaNum;
	}
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public int getPhotoCtg() {
		return photoCtg;
	}
	public void setPhotoCtg(int photoCtg) {
		this.photoCtg = photoCtg;
	}
	public String getPhotoCtg2() {
		return photoCtg2;
	}
	public void setPhotoCtg2(String photoCtg2) {
		this.photoCtg2 = photoCtg2;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public int getP_itemNum() {
		return p_itemNum;
	}
	public void setP_itemNum(int p_itemNum) {
		this.p_itemNum = p_itemNum;
	}
	public int getP_ingredientNum() {
		return p_ingredientNum;
	}
	public void setP_ingredientNum(int p_ingredientNum) {
		this.p_ingredientNum = p_ingredientNum;
	}
	public int getP_reviewNum() {
		return p_reviewNum;
	}
	public void setP_reviewNum(int p_reviewNum) {
		this.p_reviewNum = p_reviewNum;
	}
	public int getP_eventNum() {
		return p_eventNum;
	}
	public void setP_eventNum(int p_eventNum) {
		this.p_eventNum = p_eventNum;
	}
	public int getP_noticeNum() {
		return p_noticeNum;
	}
	public void setP_noticeNum(int p_noticeNum) {
		this.p_noticeNum = p_noticeNum;
	}
	public int getP_qnaNum() {
		return p_qnaNum;
	}
	public void setP_qnaNum(int p_qnaNum) {
		this.p_qnaNum = p_qnaNum;
	}
	@Override
	public String toString() {
		return "PhotoVo [photoNum=" + photoNum + ", photoCtg=" + photoCtg + ", photoCtg2=" + photoCtg2 + ", photoPath="
				+ photoPath + ", photoName=" + photoName + ", originalName=" + originalName + ", p_itemNum=" + p_itemNum
				+ ", p_ingredientNum=" + p_ingredientNum + ", p_reviewNum=" + p_reviewNum + ", p_eventNum=" + p_eventNum
				+ ", p_noticeNum=" + p_noticeNum + ", p_qnaNum=" + p_qnaNum + "]";
	}
	
	
}
