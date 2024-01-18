package com.example.entity;

import java.time.LocalDate;
import java.util.Date;

//定義使用者身體質量資料(POJO)
public class BMI {
	
	private Integer BMIId;			  //身體質量指數Id
	private Integer userId;			  //使用者Id
	private  Double height;			  //身高
	private  Double weight;			  //體重
	private  Double BMI;				  //身體質量指數
	private  Double BMR;				  //身體代謝
	private  Double level;			  //身體代謝水平
	private Date recordDay;		  //紀錄日期
	
	private static Integer count = 0; //計算Id
	
	//關聯資料
	private User user;	//使用者物件

	public BMI() {
		
	}

	public BMI( Double height,  Double weight) {
		this.BMIId = ++count;
		this.userId = userId;
		this.height = height;
		this.weight = weight;
		this.BMI = BMI;
		this.BMR = BMR;
		this.level = level;
		this.recordDay = recordDay;
	}

	public Integer getBMIId() {
		return BMIId;
	}

	public void setBMIId(Integer BMIId) {
		this.BMIId = BMIId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public  Double getHeight() {
		return height;
	}

	public void setHeight( Double height) {
		this.height = height;
	}

	public  Double getWeight() {
		return weight;
	}

	public void setWeight( Double weight) {
		this.weight = weight;
	}

	public  Double getBMI(Double BMI) {
		//return weight/((height/100)*(height/100));
		return BMI;
	}

	public  Double getBMR(User user, Double BMR) {
		return BMR;
	}

	public  Double getLevel() {
		return level;
	}

	public void setLevel( Double level) {
		this.level = level;
	}

	public LocalDate getRecordDay() {
		LocalDate recordDay = LocalDate.now();
		return recordDay;
	}

	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "BMIId:" + BMIId + "\nuserId:" +	user.getUserId() + 
				"\nheight:" + height + "\nweight:"+ weight +
				"\nBMI:"+ BMI + "\nBMR:" + BMR + "\nlevel:" + level +
				"\nrecordDay:" + recordDay + "\n";
	}
	
}
