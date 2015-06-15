package com.kate.app.model;

import java.util.Date;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
public class News{
	private int id;
	private int news_id;
	private String news_title;
	private Date news_time;
	private String news_detail;
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
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public Date getNews_time() {
		return news_time;
	}
	public void setNews_time(Date news_time) {
		this.news_time = news_time;
	}
	public String getNews_detail() {
		return news_detail;
	}
	public void setNews_detail(String news_detail) {
		this.news_detail = news_detail;
	}
}