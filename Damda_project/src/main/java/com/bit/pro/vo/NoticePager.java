package com.bit.pro.vo;

public class NoticePager {
	//페이지당 게시물 수
	public static final int PAGE_SCALE = 10;
	//화면 당 페이지 수
	public static final double BLOCK_SCALE = 5.0;
	
	//현재 페이지
	private int curPage;
	//전체 페이지 갯수
	private int totPage;
	//전체 페이지 블록 갯수
	private int totBlock;
	//현재 페이지 블록
	private int curBlock; 
	//이전 페이지 블록
	private int prevBlock;
	//다음 페이지 블록
	private int nextBlock;
	
	//현재 페이지 블록의 시작번호
	private int blockBegin;
	//현재 페이지 블록의 끝 번호
	private int blockEnd;
	
	//생성자
	public NoticePager(int count, int curPage){
		//현재 페이지 설정
		this.curPage = curPage;
		//전체 페이지 갯수 계산
		setTotPage(count);
		//전체 페이지 블록 갯수 계산
		setTotBlock();
		//페이지 블록의 시작,끝 번호 계산
		setBlockRange();
	}

	private void setBlockRange() {
	  //현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		//(현재페이지-1)/페이지블록단위+1
		//1페이지 -> 1블록 (1-1)/10 +1 = 1
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		
	  //현재 페이지 블록의 시작 계산
		/* blockBegin = (int) (((curPage-1)/5.0)*BLOCK_SCALE+1); */
					//(현재 페이지 블록-1)*화면당페이지 수+1
			
	  //페이지 블록의 시작번호 계산
		//blockBegin = (int)Math.round((curPage+BLOCK_SCALE)/6.0);
		if(curPage==1 || curPage==2) {
			blockBegin = 1;
		}else {
			blockBegin = (int)(curPage - (BLOCK_SCALE-1)/2);
		}
		
	  //페이지 블록의 끝번호 계산
		blockEnd = (int)(blockBegin+(BLOCK_SCALE-1));

	  //마지막 블록이 범위를 초과하지 않도록 계산
		if(blockEnd > totPage) blockEnd = totPage;
	}
	
	
	//getter/setter
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		// Math.ceil(실수) 올림 처리
		totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}
	
	public void setTotBlock() {
		// 전체 페이지 갯수 / 10
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
}
