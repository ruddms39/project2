package com.hair.vo;

import java.sql.Date;

public class UsersVO {
	String uid, role, udel;
	String uname;
	String upw;
	String upw2;
	String unick;
	String uphone;
	String gender;
	Date ubday;
	Date regdate;
	int uno;
	
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUdel() {
		return udel;
	}
	public void setUdel(String udel) {
		this.udel = udel;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUpw2() {
		return upw2;
	}
	public void setUpw2(String upw2) {
		this.upw2 = upw2;
	}
	public String getUnick() {
		return unick;
	}
	public void setUnick(String unick) {
		this.unick = unick;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getUbday() {
		return ubday;
	}
	public void setUbday(Date ubday) {
		this.ubday = ubday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "UsersVO [uid=" + uid + ", uname=" + uname + ", upw=" + upw + ", upw2=" + upw2 + ", unick=" + unick
				+ ", uphone=" + uphone + ", gender=" + gender + ", ubday=" + ubday + ", regdate=" + regdate + "]";
	}
	
	
}