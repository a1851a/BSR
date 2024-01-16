package com.example.entity;

public class HealthInformation {

	private String url;      //網址
	private String title;    //標題
	private String context;  //內容
	private String picture;  //照片
	
	
	public HealthInformation() {
		
	}

	public HealthInformation(String url, String title, String context, String picture) {
		this.url = url;
		this.title = title;
		this.context = context;
		this.picture = picture;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
}
