package com.example.entity;

import java.util.Date;

public class Hyperlipidemia {
	private Integer TG;//三酸甘油酯
	private Integer TC;//膽固醇
	private Integer HDL;//高密度膽固醇
	private Integer LDL;//低密度膽固醇
	private Integer vldl;//極低密度膽固醇
	private Double angiosclerosis; //血管硬化機率
	private Double stroke;//中風率
	private String recordDay;
	
	public Hyperlipidemia() {

	}
	
	public Hyperlipidemia(Integer TG, Integer TC, Integer HDL, Integer LDL, Integer vldl, Double angiosclerosis,
			Double stroke, String recordDay) {
		this.TG = TG;
		this.TC = TC;
		this.HDL = HDL;
		this.LDL = LDL;
		this.vldl = vldl;
		this.angiosclerosis = angiosclerosis;
		this.stroke = stroke;
		this.recordDay = recordDay;
	}
	
	public Integer getTG() {
		return TG;
	}
	
	public void setTG(Integer TG) {
		this.TG = TG;
	}
	
	public Integer getTC() {
		return TC;
	}
	
	public void setTC(Integer TC) {
		this.TC = TC;
	}
	
	public Integer getHDL() {
		return HDL;
	}
	
	public void setHDL(Integer HDL) {
		this.HDL = HDL;
	}
	
	public Integer getLDL() {
		return LDL;
	}
	
	public void setLDL(Integer LDL) {
		this.LDL = LDL;
	}
	
	public Integer getVldl() {
		return vldl;
	}
	
	public void setVldl(Integer vldl) {
		this.vldl = vldl;
	}
	
	public Double getAngiosclerosis() {
		return angiosclerosis;
	}
	
	public void setAngiosclerosis(Double angiosclerosis) {
		this.angiosclerosis = angiosclerosis;
	}
	
	public Double getStroke() {
		return stroke;
	}
	
	public void setStroke(Double stroke) {
		this.stroke = stroke;
	}
	
	public String getRecordDay() {
		return recordDay;
	}
	
	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}
	
	@Override
	public String toString() {
		return "Hyperlipidemia [TG=" + TG + ", TC=" + TC + ", HDL=" + HDL + ", LDL=" + LDL + ", vldl=" + vldl
				+ ", angiosclerosis=" + angiosclerosis + ", stroke=" + stroke + ", recordDay=" + recordDay + "]";
	}
}
