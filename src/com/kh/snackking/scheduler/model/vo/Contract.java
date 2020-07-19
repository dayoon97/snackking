package com.kh.snackking.scheduler.model.vo;

import java.sql.Date;

public class Contract implements java.io.Serializable{
	private String c_code;//계약코드
	private Date s_date;//계약시작일
	private Date e_date;//계약종료일
	private Date c_date;//계약일
	private int deliv_count;//월배송횟수
	private int amount_perdeliv;//회차당 금액
	private String den_yn;//계약종료여부YN
	private int user_no;//회원번호
	private String corp_name;//거래처명
	private int total_amount;//월계약금액
	private int contract_no;//계약번호
	public Contract() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Contract(String c_code, Date s_date, Date e_date, Date c_date, int deliv_count, int amount_perdeliv,
			String den_yn, int user_no, String corp_name, int total_amount, int contract_no) {
		super();
		this.c_code = c_code;
		this.s_date = s_date;
		this.e_date = e_date;
		this.c_date = c_date;
		this.deliv_count = deliv_count;
		this.amount_perdeliv = amount_perdeliv;
		this.den_yn = den_yn;
		this.user_no = user_no;
		this.corp_name = corp_name;
		this.total_amount = total_amount;
		this.contract_no = contract_no;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getDeliv_count() {
		return deliv_count;
	}
	public void setDeliv_count(int deliv_count) {
		this.deliv_count = deliv_count;
	}
	public int getAmount_perdeliv() {
		return amount_perdeliv;
	}
	public void setAmount_perdeliv(int amount_perdeliv) {
		this.amount_perdeliv = amount_perdeliv;
	}
	public String getDen_yn() {
		return den_yn;
	}
	public void setDen_yn(String den_yn) {
		this.den_yn = den_yn;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getContract_no() {
		return contract_no;
	}
	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}
	@Override
	public String toString() {
		return "Contract [c_code=" + c_code + ", s_date=" + s_date + ", e_date=" + e_date + ", c_date=" + c_date
				+ ", deliv_count=" + deliv_count + ", amount_perdeliv=" + amount_perdeliv + ", den_yn=" + den_yn
				+ ", user_no=" + user_no + ", corp_name=" + corp_name + ", total_amount=" + total_amount
				+ ", contract_no=" + contract_no + "]";
	}
	
	
	
	
	
}




