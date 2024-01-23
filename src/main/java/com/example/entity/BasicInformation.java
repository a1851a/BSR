package com.example.entity;

import java.util.Date;

public class BasicInformation {

	private Double height;
	private Double weight;
	private Double BMI;
	private Double BMR;
	private Double level;
	private Date recodeDay;
	
	public BasicInformation() {

	}
	
	public BasicInformation(Double height, Double weight, Double BMI, Double BMR, Double level, Date recodeDay) {
		this.height = height;
		this.weight = weight;
		this.BMI = BMI;
		this.BMR = BMR;
		this.level = level;
		this.recodeDay = recodeDay;
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
	
	public void setBMI(Double BMI) {
		this.BMI = BMI;
	}
	
	public Double getBMR() {
		return BMR;
	}
	
	public void setBMR(Double BMR) {
		this.BMR = BMR;
	}
	
	public Double getLevel() {
		return level;
	}
	
	public void setLevel(Double level) {
		this.level = level;
	}
	
	public Date getRecodeDay() {
		return recodeDay;
	}
	
	public void setRecodeDay(Date recodeDay) {
		this.recodeDay = recodeDay;
	}
	
	@Override
	public String toString() {
		return "BasicInformation [height=" + height + ", Weight=" + weight + ", BMI=" + BMI + ", BMR=" + BMR
				+ ", level=" + level + ", recodeDay=" + recodeDay + "]";
	}
	
}
