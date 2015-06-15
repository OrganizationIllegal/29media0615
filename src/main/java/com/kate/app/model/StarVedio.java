package com.kate.app.model;

/**
 * StarVedio entity. @author MyEclipse Persistence Tools
 */
public class StarVedio{
	private int id;
	private int star_num;
	private String video_pic;
	private int video_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStar_num() {
		return star_num;
	}
	public void setStar_num(int star_num) {
		this.star_num = star_num;
	}
	public String getVideo_pic() {
		return video_pic;
	}
	public void setVideo_pic(String video_pic) {
		this.video_pic = video_pic;
	}
	public int getVideo_id() {
		return video_id;
	}
	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}
}