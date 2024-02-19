package com.example.entity;

import java.util.Date;

public class Blood {
	private Integer WBC;//白血球
	private Double RBC;//紅血球
	private Double Hgb;//血色素
	private Double Hct;//血球容積比
	private Double MCV;//平均紅血球容積
	private Double MCH;//平均紅血球血紅素量
	private Double MCHC;//平均紅血球血紅素濃度
	private Integer PLT;//血小板
	private String recordDay;
	
	public Blood() {

	}
	
	public Blood(Integer WBC, Double RBC, Double Hgb, Double Hct, Double MCV, Double MCH, Double MCHC, Integer PLT,
			String recordDay) {
		this.WBC = WBC;
		this.RBC = RBC;
		this.Hgb = Hgb;
		this.Hct = Hct;
		this.MCV = MCV;
		this.MCH = MCH;
		this.MCHC = MCHC;
		this.PLT = PLT;
		this.recordDay = recordDay;
	}
	
	public Integer getWBC() {
		return WBC;
	}
	
	public void setWBC(Integer WBC) {
		this.WBC = WBC;
	}
	
	public Double getRBC() {
		return RBC;
	}
	
	public void setRBC(Double RBC) {
		this.RBC = RBC;
	}
	
	public Double getHgb() {
		return Hgb;
	}
	
	public void setHgb(Double Hgb) {
		this.Hgb = Hgb;
	}
	
	public Double getHct() {
		return Hct;
	}
	
	public void setHct(Double Hct) {
		this.Hct = Hct;
	}
	
	public Double getMCV() {
		return MCV;
	}
	
	public void setMCV(Double MCV) {
		this.MCV = MCV;
	}
	
	public Double getMCH() {
		return MCH;
	}
	
	public void setMCH(Double MCH) {
		this.MCH = MCH;
	}
	
	public Double getMCHC() {
		return MCHC;
	}
	
	public void setMCHC(Double MCHC) {
		this.MCHC = MCHC;
	}
	
	public Integer getPLT() {
		return PLT;
	}
	
	public void setPLT(Integer PLT) {
		this.PLT = PLT;
	}
	
	public String getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Blood [WBC=" + WBC + ", RBC=" + RBC + ", Hgb=" + Hgb + ", Hct=" + Hct + ", MCV=" + MCV + ", MCH=" + MCH
				+ ", MCHC=" + MCHC + ", PLT=" + PLT + ", recordDay=" + recordDay + "]";
	}
	
}
