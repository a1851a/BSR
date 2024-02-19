package com.example.entity;

import java.util.Date;

public class Sediment {
	private Integer RBC;//尿紅血球
	private Integer WBC;//尿白血球
	private Integer epithelium;//上皮細胞
	private String crystal;//結晶體
	private String cast;//尿圓柱體
	private String bacteria;//細菌
	private String other;//其他
	private String recordDay;
	
	public Sediment() {

	}

	public Sediment(Integer RBC, Integer WBC, Integer epithelium, String crystal, String cast, String bacteria,
			String other, String recordDay) {
		this.RBC = RBC;
		this.WBC = WBC;
		this.epithelium = epithelium;
		this.crystal = crystal;
		this.cast = cast;
		this.bacteria = bacteria;
		this.other = other;
		this.recordDay = recordDay;
	}

	public Integer getRBC() {
		return RBC;
	}

	public void setRBC(Integer RBC) {
		this.RBC = RBC;
	}

	public Integer getWBC() {
		return WBC;
	}

	public void setWBC(Integer WBC) {
		this.WBC = WBC;
	}

	public Integer getEpithelium() {
		return epithelium;
	}

	public void setEpithelium(Integer epithelium) {
		this.epithelium = epithelium;
	}

	public String getCrystal() {
		return crystal;
	}

	public void setCrystal(String crystal) {
		this.crystal = crystal;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getBacteria() {
		return bacteria;
	}

	public void setBacteria(String bacteria) {
		this.bacteria = bacteria;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getRecordDay() {
		return recordDay;
	}

	public void setRecordDay(String recordDay) {
		this.recordDay = recordDay;
	}

	@Override
	public String toString() {
		return "Sediment [RBC=" + RBC + ", WBC=" + WBC + ", epithelium=" + epithelium + ", crystal=" + crystal
				+ ", cast=" + cast + ", bacteria=" + bacteria + ", other=" + other + ", recordDay=" + recordDay + "]";
	}
	
}
