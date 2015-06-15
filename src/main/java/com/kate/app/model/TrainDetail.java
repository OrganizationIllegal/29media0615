package com.kate.app.model;

import java.util.Date;

/**
 * TrainDetail entity. @author MyEclipse Persistence Tools
 */
public class TrainDetail{
	private int id;
	private String title;
	private String detail;
	private Date time;
	private int train_id;
	private String train_img;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getTrain_id() {
		return train_id;
	}
	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}
	public String getTrain_img() {
		return train_img;
	}
	public void setTrain_img(String train_img) {
		this.train_img = train_img;
	}
	
}