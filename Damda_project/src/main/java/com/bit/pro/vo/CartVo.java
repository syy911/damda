package com.bit.pro.vo;

public class CartVo {
	private int c_userNum;
	private int c_itemNum;
	private int c_customNum;
	private int ea;
	
	//allitem table
	private int itemNum;
	private String itemName;
	private int itemPrice;
	private int category;
	private String itemCon;
	private int itemStock;
	private int itemSales;
	
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
	
	public CartVo() {}

	public int getC_userNum() {
		return c_userNum;
	}

	public void setC_userNum(int c_userNum) {
		this.c_userNum = c_userNum;
	}

	public int getC_itemNum() {
		return c_itemNum;
	}

	public void setC_itemNum(int c_itemNum) {
		this.c_itemNum = c_itemNum;
	}

	public int getC_customNum() {
		return c_customNum;
	}

	public void setC_customNum(int c_customNum) {
		this.c_customNum = c_customNum;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getItemCon() {
		return itemCon;
	}

	public void setItemCon(String itemCon) {
		this.itemCon = itemCon;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public int getItemSales() {
		return itemSales;
	}

	public void setItemSales(int itemSales) {
		this.itemSales = itemSales;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + c_customNum;
		result = prime * result + c_itemNum;
		result = prime * result + c_userNum;
		result = prime * result + category;
		result = prime * result + ea;
		result = prime * result + ((itemCon == null) ? 0 : itemCon.hashCode());
		result = prime * result + ((itemName == null) ? 0 : itemName.hashCode());
		result = prime * result + itemNum;
		result = prime * result + itemPrice;
		result = prime * result + itemSales;
		result = prime * result + itemStock;
		result = prime * result + ((originalName == null) ? 0 : originalName.hashCode());
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
		CartVo other = (CartVo) obj;
		if (c_customNum != other.c_customNum)
			return false;
		if (c_itemNum != other.c_itemNum)
			return false;
		if (c_userNum != other.c_userNum)
			return false;
		if (category != other.category)
			return false;
		if (ea != other.ea)
			return false;
		if (itemCon == null) {
			if (other.itemCon != null)
				return false;
		} else if (!itemCon.equals(other.itemCon))
			return false;
		if (itemName == null) {
			if (other.itemName != null)
				return false;
		} else if (!itemName.equals(other.itemName))
			return false;
		if (itemNum != other.itemNum)
			return false;
		if (itemPrice != other.itemPrice)
			return false;
		if (itemSales != other.itemSales)
			return false;
		if (itemStock != other.itemStock)
			return false;
		if (originalName == null) {
			if (other.originalName != null)
				return false;
		} else if (!originalName.equals(other.originalName))
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
		return true;
	}

	@Override
	public String toString() {
		return "CartVo [c_userNum=" + c_userNum + ", c_itemNum=" + c_itemNum + ", c_customNum=" + c_customNum + ", ea="
				+ ea + ", itemNum=" + itemNum + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", category="
				+ category + ", itemCon=" + itemCon + ", itemStock=" + itemStock + ", itemSales=" + itemSales
				+ ", photoNum=" + photoNum + ", photoCtg=" + photoCtg + ", photoCtg2=" + photoCtg2 + ", photoPath="
				+ photoPath + ", photoName=" + photoName + ", originalName=" + originalName + ", p_itemNum=" + p_itemNum
				+ ", p_ingredientNum=" + p_ingredientNum + ", p_reviewNum=" + p_reviewNum + ", p_eventNum=" + p_eventNum
				+ ", p_noticeNum=" + p_noticeNum + ", p_qnaNum=" + p_qnaNum + "]";
	}

	public CartVo(int c_userNum, int c_itemNum, int c_customNum, int ea, int itemNum, String itemName, int itemPrice,
			int category, String itemCon, int itemStock, int itemSales, int photoNum, int photoCtg, String photoCtg2,
			String photoPath, String photoName, String originalName, int p_itemNum, int p_ingredientNum,
			int p_reviewNum, int p_eventNum, int p_noticeNum, int p_qnaNum) {
		super();
		this.c_userNum = c_userNum;
		this.c_itemNum = c_itemNum;
		this.c_customNum = c_customNum;
		this.ea = ea;
		this.itemNum = itemNum;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.category = category;
		this.itemCon = itemCon;
		this.itemStock = itemStock;
		this.itemSales = itemSales;
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

	
	
}
