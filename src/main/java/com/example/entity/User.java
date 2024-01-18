package com.example.entity;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

//定義使用者資料(POJO)
public class User {
	private Integer userId;  //使用者Id
	private String email;    //信箱
	private String password; //密碼
	private String name;     //使用者名稱
	private String birth;    //使用者出生日期
	private Gender gender;	 //使用者性別
	private Integer age;	 //使用者年齡
		
	public User() {
		
	}

	public User(String email, String password, String name, String birth, Gender gender) {
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.age = age;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender.getGender();
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	//計算至今年齡(當日-生日)
		public Integer getAge() {		    
		    return age;
		}
		
//	//計算至今年齡(當日-生日)
//	public Integer getAge() {
//		//取得出生日期 
//	    LocalDate birthDate = LocalDate.parse(birth);
//	    //取得目前日期 
//	    LocalDate currentDate = LocalDate.now();
//	    //計算時間
//	    Period totalAliveTime = Period.between(birthDate, currentDate);
//	    
//	    return totalAliveTime.getYears();
//	}

	@Override
	public String toString() {
		return "userId:"+userId+
				"\nemail:"+email+
				"\npassword:"+password+
				"\nname:"+name+
				"\ngender:"+gender+
				"\nage:"+age+
				"\n";
	}

}
