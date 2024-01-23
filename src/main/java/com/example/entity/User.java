package com.example.entity;

import java.time.Period;
import java.util.Date;

//定義使用者資料(POJO)
public class User {
	
	private String userId;
	private String email;
	private String name;
	private String gender;
	private String birth;
	private Integer age;
	
	public User() {
		
	}

	public User(String userId,String email,String name, String gender, String birth, Integer age) {
		this.userId = userId;
		this.email = email;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.age = age;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birthday) {
		this.birth = birthday;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", gender=" + gender + ", birth=" + birth + ", age=" + age + "]";
	}

}
