package com.example.entity;

public class HealthInformation {
	private String title;
	private String category;
	private String web_url;
	
	public HealthInformation() {
		
	}
	
	public HealthInformation(String title, String category, String web_url) {
		this.title = title;
		this.category = category;
		this.web_url = web_url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWeb_url() {
		return web_url;
	}

	public void setWeb_url(String web_url) {
		this.web_url = web_url;
	}

	@Override
	public String toString() {
		return "HealthInformation [title=" + title + ", category=" + category + ", web_url=" + web_url + "]";
	}
	
}
