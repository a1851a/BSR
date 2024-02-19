package com.example.entity;

import java.util.Date;

public class BP {
	private Integer SBP;    //收縮壓
	private Integer DBP;    //舒張壓
	private Integer pulse;  //脈搏
	private String recordDay;
	
	public BP() {
	
	}
	
	public BP(Integer SBP, Integer DBP, Integer pulse, String recordDay) {
		this.SBP = SBP;
		this.DBP = DBP;
		this.pulse = pulse;
		this.recordDay = recordDay;
	}
	
	public Integer getSBP() {
		return SBP;
	}
	
	public void setSBP(Integer SBP) {
		this.SBP = SBP;
	}
	
	public Integer getDBP() {
		return DBP;
	}
	
	public void setDBP(Integer DBP) {
		this.DBP = DBP;
	}
	
	public Integer getPulse() {
		return pulse;
	}
	
	public void setPulse(Integer pulse) {
		this.pulse = pulse;
	}
	
	public String getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "BP [SBP=" + SBP + ", DBP=" + DBP + ", pulse=" + pulse + ", recordDay=" + recordDay + "]";
	} 
}
