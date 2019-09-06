package com.bit.pro.vo;

public class EventVo {
	
	private int eventnum;
	private String eventsub;
	private String eventdateSta;
	private String eventdateEnd;
	private String eventcontent;
	
	public EventVo() {
		
	}

	public int getEventnum() {
		return eventnum;
	}

	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}

	public String getEventsub() {
		return eventsub;
	}

	public void setEventsub(String eventsub) {
		this.eventsub = eventsub;
	}

	public String getEventdateSta() {
		return eventdateSta;
	}

	public void setEventdateSta(String eventdateSta) {
		this.eventdateSta = eventdateSta;
	}

	public String getEventdateEnd() {
		return eventdateEnd;
	}

	public void setEventdateEnd(String eventdateEnd) {
		this.eventdateEnd = eventdateEnd;
	}

	public String getEventcontent() {
		return eventcontent;
	}

	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}

	@Override
	public String toString() {
		return "EventVo [eventnum=" + eventnum + ", eventsub=" + eventsub + ", eventdateSta=" + eventdateSta
				+ ", eventdateEnd=" + eventdateEnd + ", eventcontent=" + eventcontent + "]";
	}

	public EventVo(int eventnum, String eventsub, String eventdateSta, String eventdateEnd, String eventcontent) {
		super();
		this.eventnum = eventnum;
		this.eventsub = eventsub;
		this.eventdateSta = eventdateSta;
		this.eventdateEnd = eventdateEnd;
		this.eventcontent = eventcontent;
	}
	
	
	
}
