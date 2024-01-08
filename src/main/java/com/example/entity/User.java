package com.example.entity;

import java.time.LocalDate;
import java.time.Period;

//定義使用者資料(POJO)
public class User {
	private String account;              // 帳號
	private String password;             // 密碼
	private static Integer count = 0;   	 // 使用者ID的初始值
	private Integer userId;					 // 使用者ID
	private String name;                 // 姓名
	private Gender gender;               // 性別
	private String birthday;             // 出生年月日
	private Integer age;                 // 年齡

	public User() {
		this.userId = ++count;
	}

	public User(String account, String password, String name, Gender gender, String birthday) {
		this();
		this.account = account;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.age = getAge(birthday);
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	private Integer getAge(String birthday) {
		//取得出生日期 
	    LocalDate birthDate = LocalDate.parse(birthday);
	    //取得目前日期 
	    LocalDate currentDate = LocalDate.now();
	    //計算時間
	    Period totalAliveTime = Period.between(birthDate, currentDate);
	    return totalAliveTime.getYears();
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "account:" + account + "\n" + "password:" + password + "\n" +
				"userId:"+userId+"\n"+"name:" + name + "\n" + "gender:"+
				gender.getGender() + "\n" + "birthday:" + birthday + "\n" +
				"age:" + age + "\n";
	}

}
