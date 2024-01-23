package com.example.entity;

public enum Appearance {
	yellow("深黃色"),colorless("無色"),red("紅色"),green("綠色");

	private String apperance;

	public String getApperance() {
		return apperance;
	}

	private Appearance(String apperance) {
		this.apperance = apperance;
	}
	
}
