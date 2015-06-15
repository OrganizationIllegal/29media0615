package com.kate.app.model;

import java.util.Set;

/**
 * Train entity. @author MyEclipse Persistence Tools
 */
public class Train{
	private int id;
	private String train_name;
	private String train_desc;
	private String train_image;
	private int train_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTrain_name() {
		return train_name;
	}
	public void setTrain_name(String train_name) {
		this.train_name = train_name;
	}
	public String getTrain_desc() {
		return train_desc;
	}
	public void setTrain_desc(String train_desc) {
		this.train_desc = train_desc;
	}
	public String getTrain_image() {
		return train_image;
	}
	public void setTrain_image(String train_image) {
		this.train_image = train_image;
	}
	public int getTrain_id() {
		return train_id;
	}
	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}
}