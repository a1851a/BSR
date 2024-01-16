package com.example.entity;

public class BMI {
	
	private Double height; //身高
	private Double weight; //體重
	private Double BMI;    //質量指數
	private Double BMR;    //基礎代謝率
	private Double level;  //代謝水平
	
	private User user;     //使用者物件
	
	
	public BMI() {
		
	}

	public BMI(Double height, Double weight,Integer userId) {
		this.height = height;
		this.weight = weight;
		this.BMI = BMI;
		this.BMR = BMR;
		
		//利用userId查找user
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getBMI() {
		return BMI;
	}

	public void setBMI(Double height, Double weight) {
		BMI = weight/((height/100)*(height/100));
	}

	public Double getBMR() {
		return BMR;
	}

	public void setBMR(Double bMR) {
		BMR = bMR;
	}

	public Double getLevel() {
		return level;
	}

	public void setLevel(Double BMI, Double BMR) {
		this.level = BMI/BMR;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
