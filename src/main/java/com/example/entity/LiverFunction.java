package com.example.entity;

import java.util.Date;

public class LiverFunction {
	private Double dbit;//總膽紅素
	private Double dbil;//直接膽紅素
	private Double TP;//總蛋白
	private Double Alb;//白蛋白
	private Double Glo;//球蛋白
	private Integer sGOT;//麩胺酸苯醋酸轉氨基酶
	private Integer sGPT;//麩胺酸丙酮酸轉氨酶
	private Integer alkp;//鹼性磷酸酶
	private Integer ald;//酒精性肝炎(脂肪肝)
	private Date recordDay;
	
	public LiverFunction() {

	}
	
	public LiverFunction(Double dbit, Double dbil, Double tP, Double alb, Double glo, Integer sGOT, Integer sGPT,
			Integer alkp, Integer ald, Date recordDay) {
		this.dbit = dbit;
		this.dbil = dbil;
		this.TP = tP;
		this.Alb = alb;
		this.Glo = glo;
		this.sGOT = sGOT;
		this.sGPT = sGPT;
		this.alkp = alkp;
		this.ald = ald;
		this.recordDay = recordDay;
	}
	
	public Double getDbit() {
		return dbit;
	}
	
	public void setDbit(Double dbit) {
		this.dbit = dbit;
	}
	
	public Double getDbil() {
		return dbil;
	}
	
	public void setDbil(Double dbil) {
		this.dbil = dbil;
	}
	
	public Double getTP() {
		return TP;
	}
	
	public void setTP(Double TP) {
		this.TP = TP;
	}
	
	public Double getAlb() {
		return Alb;
	}
	
	public void setAlb(Double Alb) {
		this.Alb = Alb;
	}
	
	public Double getGlo() {
		return Glo;
	}
	
	public void setGlo(Double Glo) {
		this.Glo = Glo;
	}
	
	public Integer getsGOT() {
		return sGOT;
	}
	
	public void setsGOT(Integer sGOT) {
		this.sGOT = sGOT;
	}
	
	public Integer getsGPT() {
		return sGPT;
	}
	
	public void setsGPT(Integer sGPT) {
		this.sGPT = sGPT;
	}
	
	public Integer getAlkp() {
		return alkp;
	}
	
	public void setAlkp(Integer alkp) {
		this.alkp = alkp;
	}
	
	public Integer getAld() {
		return ald;
	}
	
	public void setAld(Integer ald) {
		this.ald = ald;
	}
	
	public Date getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "LiverFunction [dbit=" + dbit + ", dbil=" + dbil + ", TP=" + TP + ", Alb=" + Alb + ", Glo=" + Glo
				+ ", sGOT=" + sGOT + ", sGPT=" + sGPT + ", alkp=" + alkp + ", ald=" + ald + ", recordDay=" + recordDay
				+ "]";
	}
	
}
