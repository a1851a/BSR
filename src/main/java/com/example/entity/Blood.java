package com.example.entity;

import java.util.Date;

public class Blood {
	private Double WBC;//白血球
	private Double RBC;//紅血球
	private Double Hgb;//血色素
	private Double Hct;//血球容積比
	private Double MCV;//平均紅血球容積
	private Integer MCH;//平均紅血球血紅素量
	private Integer MCHC;//平均紅血球血紅素濃度
	private Integer PLT;//血小板
	private Date recordDay;
	
	public Blood() {

	}
	
	public Blood(Double WBC, Double RBC, Double Hgb, Double Hct, Double MCV, Integer MCH, Integer MCHC, Integer PLT,
			Date recordDay) {
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
	
	public Double getWBC() {
		return WBC;
	}
	
	public void setWBC(Double WBC) {
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
	
	public Integer getMCH() {
		return MCH;
	}
	
	public void setMCH(Integer MCH) {
		this.MCH = MCH;
	}
	
	public Integer getMCHC() {
		return MCHC;
	}
	
	public void setMCHC(Integer MCHC) {
		this.MCHC = MCHC;
	}
	
	public Integer getPLT() {
		return PLT;
	}
	
	public void setPLT(Integer PLT) {
		this.PLT = PLT;
	}
	
	public Date getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Blood [WBC=" + WBC + ", RBC=" + RBC + ", Hgb=" + Hgb + ", Hct=" + Hct + ", MCV=" + MCV + ", MCH=" + MCH
				+ ", MCHC=" + MCHC + ", PLT=" + PLT + ", recordDay=" + recordDay + "]";
	}
	
}
