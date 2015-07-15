package com.kate.app.model;

/**
 * NewsImage entity. @author MyEclipse Persistence Tools
 */
public class JoinUsImage{
	private int id;
	private int join_id;
	private String image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJoin_id() {
		return join_id;
	}
	public void setJoin_id(int join_id) {
		this.join_id = join_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}