package com.example.entity;

import java.util.Date;

public class Urine {
	private Appearance appearance;//外觀
	private Severity leukocytes;//尿白血球
	private Severity glucose;//尿糖
	private Severity protein;//尿蛋白
	private Severity bilirubin;//尿膽紅素
	private String urobilirubin;//尿膽素元
	private Severity ketones;//尿丙酮體
	private Severity occultBlood;//潛血反應
	private Severity nitrite;//亞硝酸鹽
	private Double PH;//酸鹼反應
	private Double specificGravity;//比重
	private Date recordDay;

	public Urine() {
	
	}
	
	public Urine(Appearance appearance, Severity leukocytes, Severity glucose, Severity protein, Severity bilirubin,
			String urobilirubin, Severity ketones, Severity occultBlood, Severity nitrite, Double PH,
			Double specificGravity, Date recordDay) {
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
	
	public Appearance getAppearance() {
		return appearance;
	}
	
	public void setAppearance(Appearance appearance) {
		this.appearance = appearance;
	}
	
	public Severity getLeukocytes() {
		return leukocytes;
	}
	
	public void setLeukocytes(Severity leukocytes) {
		this.leukocytes = leukocytes;
	}
	
	public Severity getGlucose() {
		return glucose;
	}
	
	public void setGlucose(Severity glucose) {
		this.glucose = glucose;
	}
	
	public Severity getProtein() {
		return protein;
	}
	
	public void setProtein(Severity protein) {
		this.protein = protein;
	}
	
	public Severity getBilirubin() {
		return bilirubin;
	}
	
	public void setBilirubin(Severity bilirubin) {
		this.bilirubin = bilirubin;
	}
	
	public String getUrobilirubin() {
		return urobilirubin;
	}
	
	public void setUrobilirubin(String urobilirubin) {
		this.urobilirubin = urobilirubin;
	}
	
	public Severity getKetones() {
		return ketones;
	}
	
	public void setKetones(Severity ketones) {
		this.ketones = ketones;
	}
	
	public Severity getOccultBlood() {
		return occultBlood;
	}
	
	public void setOccultBlood(Severity occultBlood) {
		this.occultBlood = occultBlood;
	}
	
	public Severity getNitrite() {
		return nitrite;
	}
	
	public void setNitrite(Severity nitrite) {
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
	
	public Date getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(Date recordDay) {
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
