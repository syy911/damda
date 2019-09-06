package com.bit.pro.vo;

public class MateVo {
	private int matenum;
	private String mateName;
	private int mateprice;
	private String matectg;
	private int salestatus;
	
	public MateVo(){
		
	}

	public int getMatenum() {
		return matenum;
	}

	public void setMatenum(int matenum) {
		this.matenum = matenum;
	}

	public String getMateName() {
		return mateName;
	}

	public void setMateName(String mateName) {
		this.mateName = mateName;
	}

	public int getMateprice() {
		return mateprice;
	}

	public void setMateprice(int mateprice) {
		this.mateprice = mateprice;
	}

	public String getMatectg() {
		return matectg;
	}

	public void setMatectg(String matectg) {
		this.matectg = matectg;
	}

	public int getSalestatus() {
		return salestatus;
	}

	public void setSalestatus(int salestatus) {
		this.salestatus = salestatus;
	}

	@Override
	public String toString() {
		return "MateVo [matenum=" + matenum + ", mateName=" + mateName + ", mateprice=" + mateprice + ", matectg="
				+ matectg + ", salestatus=" + salestatus + "]";
	}

	public MateVo(int matenum, String mateName, int mateprice, String matectg, int salestatus) {
		super();
		this.matenum = matenum;
		this.mateName = mateName;
		this.mateprice = mateprice;
		this.matectg = matectg;
		this.salestatus = salestatus;
	}
	
	
	
	
}
