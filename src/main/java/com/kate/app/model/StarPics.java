package com.kate.app.model;

/**
 * StarPics entity. @author MyEclipse Persistence Tools
 */
public class StarPics{
	private int id;
	private int star_id;
	private String star_image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStar_id() {
		return star_id;
	}
	public void setStar_id(int star_id) {
		this.star_id = star_id;
	}
	public String getStar_image() {
		return star_image;
	}
	public void setStar_image(String star_image) {
		this.star_image = star_image;
	}
}