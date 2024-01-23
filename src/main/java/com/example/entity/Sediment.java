package com.example.entity;

import java.util.Date;

public class Sediment {
	private Integer RBC;//尿紅血球
	private Integer WBC;//尿白血球
	private Integer epithelium;//上皮細胞
	private YesOrNo crystal;//結晶體
	private YesOrNo cast;//尿圓柱體
	private YesOrNo bacteria;//細菌
	private YesOrNo other;//其他
	private Date recordDay;
	
	public Sediment() {

	}

	public Sediment(Integer RBC, Integer WBC, Integer epithelium, YesOrNo crystal, YesOrNo cast, YesOrNo bacteria,
			YesOrNo other, Date recordDay) {
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

	public YesOrNo getCrystal() {
		return crystal;
	}

	public void setCrystal(YesOrNo crystal) {
		this.crystal = crystal;
	}

	public YesOrNo getCast() {
		return cast;
	}

	public void setCast(YesOrNo cast) {
		this.cast = cast;
	}

	public YesOrNo getBacteria() {
		return bacteria;
	}

	public void setBacteria(YesOrNo bacteria) {
		this.bacteria = bacteria;
	}

	public YesOrNo getOther() {
		return other;
	}

	public void setOther(YesOrNo other) {
		this.other = other;
	}

	public Date getRecordDay() {
		return recordDay;
	}

	public void setRecordDay(Date recordDay) {
		this.recordDay = recordDay;
	}

	@Override
	public String toString() {
		return "Sediment [RBC=" + RBC + ", WBC=" + WBC + ", epithelium=" + epithelium + ", crystal=" + crystal
				+ ", cast=" + cast + ", bacteria=" + bacteria + ", other=" + other + ", recordDay=" + recordDay + "]";
	}
	
}
