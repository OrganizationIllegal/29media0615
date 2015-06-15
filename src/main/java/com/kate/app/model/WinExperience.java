package com.kate.app.model;

import java.util.Date;

/**
 * WinExperience entity. @author MyEclipse Persistence Tools
 */
public class WinExperience{
	private int id;
	private String detail;
	private Date time;
	private int star_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getStar_id() {
		return star_id;
	}
	public void setStar_id(int star_id) {
		this.star_id = star_id;
	}
}