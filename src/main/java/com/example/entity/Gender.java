package com.example.entity;

public enum Gender {
	Man("男"),Woman("女"),Androgyne("雙性別"),NotAvailable("不提供");
	
	private String gender;

	private Gender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

}
