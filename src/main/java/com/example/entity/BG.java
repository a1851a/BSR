package com.example.entity;

import java.util.Date;

public class BG {
	private Integer AC;  //空腹血糖
	private Integer PC;  //飯後血糖
	private Integer HbA1c;//糖化血色素
	private Integer Amylase;//胰澱粉酶
	private Date recordDay;
	
	public BG() {
	
	}
	
	public BG(Integer AC, Integer PC, Integer HbA1c, Integer Amylase, Date recordDay) {
		this.AC = AC;
		this.PC = PC;
		this.HbA1c = HbA1c;
		this.Amylase = Amylase;
		this.recordDay = recordDay;
	}
	
	public Integer getAC() {
		return AC;
	}
	
	public void setAC(Integer aC) {
		this.AC = aC;
	}
	
	public Integer getPC() {
		return PC;
	}
	
	public void setPC(Integer pC) {
		this.PC = pC;
	}
	
	public Integer getHbA1c() {
		return HbA1c;
	}
	
	public void setHbA1c(Integer HbA1c) {
		this.HbA1c = HbA1c;
	}
	
	public Integer getAmylase() {
		return Amylase;
	}
	
	public void setAmylase(Integer Amylase) {
		this.Amylase = Amylase;
	}
	
	public Date getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "BG [AC=" + AC + ", PC=" + PC + ", HbA1c=" + HbA1c + ", Amylase=" + Amylase + ", recordDay=" + recordDay
				+ "]";
	}

}
