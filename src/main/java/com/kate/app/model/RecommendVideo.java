package com.kate.app.model;

/**
 * RecommendVideo entity. @author MyEclipse Persistence Tools
 */
public class RecommendVideo{
	private int id;
	private String video_pic;
	private String video_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVideo_pic() {
		return video_pic;
	}
	public void setVideo_pic(String video_pic) {
		this.video_pic = video_pic;
	}
	public String getVideo_id() {
		return video_id;
	}
	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}
}