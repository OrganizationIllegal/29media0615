package com.kate.app.model;

/**
 * StarVedio entity. @author MyEclipse Persistence Tools
 */
public class StarVedio{
	private int id;
	private String star_num;
	private String video_link;
	private String video_pic;
	private String video_id;
	private String video_desc;
	private String type;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public String getVideo_desc() {
		return video_desc;
	}
	public void setVideo_desc(String video_desc) {
		this.video_desc = video_desc;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStar_num() {
		return star_num;
	}
	public void setStar_num(String star_num) {
		this.star_num = star_num;
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
	public String getVideo_link() {
		return video_link;
	}
	public void setVideo_link(String video_link) {
		this.video_link = video_link;
	}
}