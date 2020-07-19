package com.kh.snackking.scheduler.model.vo;

import java.sql.Date;
import java.sql.Time;

public class SchedulerInfo implements java.io.Serializable{
	private int s_code;//스케줄코드
	private Date s_date;//배송날짜
	private Time s_time;//배송시간
	private int cu_no;//큐레이터 회원번호
	private int con_no;//계약회원 회원번호
	private int s_count;//월회차번호
	public SchedulerInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SchedulerInfo(int s_code, Date s_date, Time s_time, int cu_no, int con_no, int s_count) {
		super();
		this.s_code = s_code;
		this.s_date = s_date;
		this.s_time = s_time;
		this.cu_no = cu_no;
		this.con_no = con_no;
		this.s_count = s_count;
	}
	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public Time getS_time() {
		return s_time;
	}
	public void setS_time(Time s_time) {
		this.s_time = s_time;
	}
	public int getCu_no() {
		return cu_no;
	}
	public void setCu_no(int cu_no) {
		this.cu_no = cu_no;
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	@Override
	public String toString() {
		return "SchedulerInfo [s_code=" + s_code + ", s_date=" + s_date + ", s_time=" + s_time + ", cu_no=" + cu_no
				+ ", con_no=" + con_no + ", s_count=" + s_count + "]";
	}
	
}

