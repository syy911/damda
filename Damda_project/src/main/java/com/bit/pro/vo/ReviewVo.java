package com.bit.pro.vo;

import java.sql.Date;

public class ReviewVo {
	private int reviewNum;
	private int r_userNum;
	private int r_itemNum;
	private String reviewCon;
	private int adminSelect;
	private int recommend;
	private Date date;
	
	//photo table
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
	
	//userinfo
	private int userNum;
	private String userId;
	private String userPW;
	private String userName;
	private String useraddr;
	private int userPostnum;
	private int userPhone;
	private String userEmail;
	private int userBuy;
	private String userAcc;
	private String userBank;
	private String userAccowner;
	private String userGrade;
	private int category;
	private int userPoint;
	
	//페이징
	private int p;
	private int startpoint;
	private int row;
	
	//아이템정렬 
	private String itemalign;
	
	public ReviewVo() {	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getR_userNum() {
		return r_userNum;
	}

	public void setR_userNum(int r_userNum) {
		this.r_userNum = r_userNum;
	}

	public int getR_itemNum() {
		return r_itemNum;
	}

	public void setR_itemNum(int r_itemNum) {
		this.r_itemNum = r_itemNum;
	}

	public String getReviewCon() {
		return reviewCon;
	}

	public void setReviewCon(String reviewCon) {
		this.reviewCon = reviewCon;
	}

	public int getAdminSelect() {
		return adminSelect;
	}

	public void setAdminSelect(int adminSelect) {
		this.adminSelect = adminSelect;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUseraddr() {
		return useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
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

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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

	public String getUserAccowner() {
		return userAccowner;
	}

	public void setUserAccowner(String userAccowner) {
		this.userAccowner = userAccowner;
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

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getStartpoint() {
		return startpoint;
	}

	public void setStartpoint(int startpoint) {
		this.startpoint = startpoint;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public String getItemalign() {
		return itemalign;
	}

	public void setItemalign(String itemalign) {
		this.itemalign = itemalign;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + adminSelect;
		result = prime * result + category;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((itemalign == null) ? 0 : itemalign.hashCode());
		result = prime * result + ((originalName == null) ? 0 : originalName.hashCode());
		result = prime * result + p;
		result = prime * result + p_eventNum;
		result = prime * result + p_ingredientNum;
		result = prime * result + p_itemNum;
		result = prime * result + p_noticeNum;
		result = prime * result + p_qnaNum;
		result = prime * result + p_reviewNum;
		result = prime * result + photoCtg;
		result = prime * result + ((photoCtg2 == null) ? 0 : photoCtg2.hashCode());
		result = prime * result + ((photoName == null) ? 0 : photoName.hashCode());
		result = prime * result + photoNum;
		result = prime * result + ((photoPath == null) ? 0 : photoPath.hashCode());
		result = prime * result + r_itemNum;
		result = prime * result + r_userNum;
		result = prime * result + recommend;
		result = prime * result + ((reviewCon == null) ? 0 : reviewCon.hashCode());
		result = prime * result + reviewNum;
		result = prime * result + row;
		result = prime * result + startpoint;
		result = prime * result + ((userAcc == null) ? 0 : userAcc.hashCode());
		result = prime * result + ((userAccowner == null) ? 0 : userAccowner.hashCode());
		result = prime * result + ((userBank == null) ? 0 : userBank.hashCode());
		result = prime * result + userBuy;
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userGrade == null) ? 0 : userGrade.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + userNum;
		result = prime * result + ((userPW == null) ? 0 : userPW.hashCode());
		result = prime * result + userPhone;
		result = prime * result + userPoint;
		result = prime * result + userPostnum;
		result = prime * result + ((useraddr == null) ? 0 : useraddr.hashCode());
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
		ReviewVo other = (ReviewVo) obj;
		if (adminSelect != other.adminSelect)
			return false;
		if (category != other.category)
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (itemalign == null) {
			if (other.itemalign != null)
				return false;
		} else if (!itemalign.equals(other.itemalign))
			return false;
		if (originalName == null) {
			if (other.originalName != null)
				return false;
		} else if (!originalName.equals(other.originalName))
			return false;
		if (p != other.p)
			return false;
		if (p_eventNum != other.p_eventNum)
			return false;
		if (p_ingredientNum != other.p_ingredientNum)
			return false;
		if (p_itemNum != other.p_itemNum)
			return false;
		if (p_noticeNum != other.p_noticeNum)
			return false;
		if (p_qnaNum != other.p_qnaNum)
			return false;
		if (p_reviewNum != other.p_reviewNum)
			return false;
		if (photoCtg != other.photoCtg)
			return false;
		if (photoCtg2 == null) {
			if (other.photoCtg2 != null)
				return false;
		} else if (!photoCtg2.equals(other.photoCtg2))
			return false;
		if (photoName == null) {
			if (other.photoName != null)
				return false;
		} else if (!photoName.equals(other.photoName))
			return false;
		if (photoNum != other.photoNum)
			return false;
		if (photoPath == null) {
			if (other.photoPath != null)
				return false;
		} else if (!photoPath.equals(other.photoPath))
			return false;
		if (r_itemNum != other.r_itemNum)
			return false;
		if (r_userNum != other.r_userNum)
			return false;
		if (recommend != other.recommend)
			return false;
		if (reviewCon == null) {
			if (other.reviewCon != null)
				return false;
		} else if (!reviewCon.equals(other.reviewCon))
			return false;
		if (reviewNum != other.reviewNum)
			return false;
		if (row != other.row)
			return false;
		if (startpoint != other.startpoint)
			return false;
		if (userAcc == null) {
			if (other.userAcc != null)
				return false;
		} else if (!userAcc.equals(other.userAcc))
			return false;
		if (userAccowner == null) {
			if (other.userAccowner != null)
				return false;
		} else if (!userAccowner.equals(other.userAccowner))
			return false;
		if (userBank == null) {
			if (other.userBank != null)
				return false;
		} else if (!userBank.equals(other.userBank))
			return false;
		if (userBuy != other.userBuy)
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
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
		if (userPW == null) {
			if (other.userPW != null)
				return false;
		} else if (!userPW.equals(other.userPW))
			return false;
		if (userPhone != other.userPhone)
			return false;
		if (userPoint != other.userPoint)
			return false;
		if (userPostnum != other.userPostnum)
			return false;
		if (useraddr == null) {
			if (other.useraddr != null)
				return false;
		} else if (!useraddr.equals(other.useraddr))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReviewVo [reviewNum=" + reviewNum + ", r_userNum=" + r_userNum + ", r_itemNum=" + r_itemNum
				+ ", reviewCon=" + reviewCon + ", adminSelect=" + adminSelect + ", recommend=" + recommend + ", date="
				+ date + ", photoNum=" + photoNum + ", photoCtg=" + photoCtg + ", photoCtg2=" + photoCtg2
				+ ", photoPath=" + photoPath + ", photoName=" + photoName + ", originalName=" + originalName
				+ ", p_itemNum=" + p_itemNum + ", p_ingredientNum=" + p_ingredientNum + ", p_reviewNum=" + p_reviewNum
				+ ", p_eventNum=" + p_eventNum + ", p_noticeNum=" + p_noticeNum + ", p_qnaNum=" + p_qnaNum
				+ ", userNum=" + userNum + ", userId=" + userId + ", userPW=" + userPW + ", userName=" + userName
				+ ", useraddr=" + useraddr + ", userPostnum=" + userPostnum + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userBuy=" + userBuy + ", userAcc=" + userAcc + ", userBank="
				+ userBank + ", userAccowner=" + userAccowner + ", userGrade=" + userGrade + ", category=" + category
				+ ", userPoint=" + userPoint + ", p=" + p + ", startpoint=" + startpoint + ", row=" + row
				+ ", itemalign=" + itemalign + "]";
	}

	public ReviewVo(int reviewNum, int r_userNum, int r_itemNum, String reviewCon, int adminSelect, int recommend,
			Date date, int photoNum, int photoCtg, String photoCtg2, String photoPath, String photoName,
			String originalName, int p_itemNum, int p_ingredientNum, int p_reviewNum, int p_eventNum, int p_noticeNum,
			int p_qnaNum, int userNum, String userId, String userPW, String userName, String useraddr, int userPostnum,
			int userPhone, String userEmail, int userBuy, String userAcc, String userBank, String userAccowner,
			String userGrade, int category, int userPoint, int p, int startpoint, int row, String itemalign) {
		super();
		this.reviewNum = reviewNum;
		this.r_userNum = r_userNum;
		this.r_itemNum = r_itemNum;
		this.reviewCon = reviewCon;
		this.adminSelect = adminSelect;
		this.recommend = recommend;
		this.date = date;
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
		this.userNum = userNum;
		this.userId = userId;
		this.userPW = userPW;
		this.userName = userName;
		this.useraddr = useraddr;
		this.userPostnum = userPostnum;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userBuy = userBuy;
		this.userAcc = userAcc;
		this.userBank = userBank;
		this.userAccowner = userAccowner;
		this.userGrade = userGrade;
		this.category = category;
		this.userPoint = userPoint;
		this.p = p;
		this.startpoint = startpoint;
		this.row = row;
		this.itemalign = itemalign;
	}

	
	
	
}
