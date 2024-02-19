package com.example.entity;

import java.util.Date;

public class Electrolyte {
	private Double Ca;//血中鈣
	private Double P;//血中磷
	private Double k;//鉀離子
	private Integer na;//鈉離子
	private Integer cl;//氯離子
	private String recordDay;
	
	public Electrolyte() {
	
	}
	
	public Electrolyte(Double Ca, Double P, Integer na, Double k, Integer cl, String recordDay) {
		this.Ca = Ca;
		this.P = P;
		this.na = na;
		this.k = k;
		this.cl = cl;
		this.recordDay = recordDay;
	}
	
	public Double getCa() {
		return Ca;
	}
	
	public void setCa(Double Ca) {
		this.Ca = Ca;
	}
	
	public Double getP() {
		return P;
	}
	
	public void setP(Double P) {
		this.P = P;
	}
	
	public Integer getNa() {
		return na;
	}
	
	public void setNa(Integer na) {
		this.na = na;
	}
	
	public Double getK() {
		return k;
	}
	
	public void setK(Double k) {
		this.k = k;
	}
	
	public Integer getCl() {
		return cl;
	}
	
	public void setCl(Integer cl) {
		this.cl = cl;
	}
	
	public String getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Electrolyte [Ca=" + Ca + ", P=" + P + ", na=" + na + ", k=" + k + ", cl=" + cl + ", recordDay="
				+ recordDay + "]";
	}

}
