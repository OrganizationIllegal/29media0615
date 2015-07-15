package com.kate.app.model;

/**
 * NewsImage entity. @author MyEclipse Persistence Tools
 */
public class JoinUsImage{
	private int id;
	private int join_id;
	private String news_image;
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
	public String getNews_image() {
		return news_image;
	}
	public void setNews_image(String news_image) {
		this.news_image = news_image;
	}
	
	
}