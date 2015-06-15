package com.kate.app.model;

/**
 * NewsImage entity. @author MyEclipse Persistence Tools
 */
public class NewsImage{
	private int id;
	private int news_id;
	private String news_image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getNews_image() {
		return news_image;
	}
	public void setNews_image(String news_image) {
		this.news_image = news_image;
	}
}