package com.example.entity;

import java.util.Date;

public class Electrolyte {
	private Double Ca;//血中鈣
	private Double P;//血中磷
	private Integer na;//鈉離子
	private Integer k;//鉀離子
	private Integer cl;//氯離子
	private Date recordDay;
	
	public Electrolyte() {
	
	}
	
	public Electrolyte(Double Ca, Double P, Integer na, Integer k, Integer cl, Date recordDay) {
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
	
	public Integer getK() {
		return k;
	}
	
	public void setK(Integer k) {
		this.k = k;
	}
	
	public Integer getCl() {
		return cl;
	}
	
	public void setCl(Integer cl) {
		this.cl = cl;
	}
	
	public Date getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Electrolyte [Ca=" + Ca + ", P=" + P + ", na=" + na + ", k=" + k + ", cl=" + cl + ", recordDay="
				+ recordDay + "]";
	}

}
