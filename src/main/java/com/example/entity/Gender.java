package com.example.entity;

public enum Gender {
	Man("男性"), Woman("女性"), NotAavailable("不提供");

	private String gender;

	Gender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

}
