package com.example.entity;

import java.util.Date;

public class Urine {
	private String appearance;//外觀
	private String leukocytes;//尿白血球
	private String glucose;//尿糖
	private String protein;//尿蛋白
	private String bilirubin;//尿膽紅素
	private String urobilirubin;//尿膽素元
	private String ketones;//尿丙酮體
	private String occultBlood;//潛血反應
	private String nitrite;//亞硝酸鹽
	private Double PH;//酸鹼反應
	private Double specificGravity;//比重
	private String recordDay;

	public Urine() {
	
	}
	
	public Urine(String appearance, String leukocytes, String glucose, String protein, String bilirubin,
			String urobilirubin, String ketones, String occultBlood, String nitrite, Double PH,
			Double specificGravity, String recordDay) {
		this.appearance = appearance;
		this.leukocytes = leukocytes;
		this.glucose = glucose;
		this.protein = protein;
		this.bilirubin = bilirubin;
		this.urobilirubin = urobilirubin;
		this.ketones = ketones;
		this.occultBlood = occultBlood;
		this.nitrite = nitrite;
		this.PH = PH;
		this.specificGravity = specificGravity;
		this.recordDay = recordDay;
	}
	
	public String getAppearance() {
		return appearance;
	}
	
	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}
	
	public String getLeukocytes() {
		return leukocytes;
	}
	
	public void setLeukocytes(String leukocytes) {
		this.leukocytes = leukocytes;
	}
	
	public String getGlucose() {
		return glucose;
	}
	
	public void setGlucose(String glucose) {
		this.glucose = glucose;
	}
	
	public String getProtein() {
		return protein;
	}
	
	public void setProtein(String protein) {
		this.protein = protein;
	}
	
	public String getBilirubin() {
		return bilirubin;
	}
	
	public void setBilirubin(String bilirubin) {
		this.bilirubin = bilirubin;
	}
	
	public String getUrobilirubin() {
		return urobilirubin;
	}
	
	public void setUrobilirubin(String urobilirubin) {
		this.urobilirubin = urobilirubin;
	}
	
	public String getKetones() {
		return ketones;
	}
	
	public void setKetones(String ketones) {
		this.ketones = ketones;
	}
	
	public String getOccultBlood() {
		return occultBlood;
	}
	
	public void setOccultBlood(String occultBlood) {
		this.occultBlood = occultBlood;
	}
	
	public String getNitrite() {
		return nitrite;
	}
	
	public void setNitrite(String nitrite) {
		this.nitrite = nitrite;
	}
	
	public Double getPH() {
		return PH;
	}
	
	public void setPH(Double PH) {
		this.PH = PH;
	}
	
	public Double getSpecificGravity() {
		return specificGravity;
	}
	
	public void setSpecificGravity(Double specificGravity) {
		this.specificGravity = specificGravity;
	}
	
	public String getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Urine [appearance=" + appearance + ", leukocytes=" + leukocytes + ", glucose=" + glucose + ", protein="
				+ protein + ", bilirubin=" + bilirubin + ", urobilirubin=" + urobilirubin + ", ketones=" + ketones
				+ ", occultBlood=" + occultBlood + ", nitrite=" + nitrite + ", PH=" + PH + ", specificGravity="
				+ specificGravity + "]";
	}

}
