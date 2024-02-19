package com.example.entity;

import java.util.Date;

public class RenalFunction {
	private Double BUN;//尿素氮
	private Double Cr;//肌酸酐
	private Double UA;//尿酸
	private Double mAlb;//微量白蛋白
	private String recordDay;
	
	public RenalFunction() {
	
	}
	
	public RenalFunction(Double BUN, Double Cr, Double UA, Double mAlb, String recordDay) {
		this.BUN = BUN;
		this.Cr = Cr;
		this.UA = UA;
		this.mAlb = mAlb;
		this.recordDay = recordDay;
	}

	public Double getBUN() {
		return BUN;
	}

	public void setBUN(Double BUN) {
		this.BUN = BUN;
	}

	public Double getCr() {
		return Cr;
	}

	public void setCr(Double Cr) {
		this.Cr = Cr;
	}

	public Double getUA() {
		return UA;
	}

	public void setUA(Double UA) {
		this.UA = UA;
	}

	public Double getmAlb() {
		return mAlb;
	}

	public void setmAlb(Double mAlb) {
		this.mAlb = mAlb;
	}

	public String getRecordDay() {
		return recordDay;
	}

	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}

	@Override
	public String toString() {
		return "RenalFunction [BUN=" + BUN + ", Cr=" + Cr + ", UA=" + UA + ", mAlb=" + mAlb + ", recordDay=" + recordDay
				+ "]";
	}

}
