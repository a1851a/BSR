package com.example.entity;

public enum YesOrNo {
	Yes("有"),No("無");
	
	private String YesOrNo;

	public String getYesOrNo() {
		return YesOrNo;
	}

	private YesOrNo(String yesOrNo) {
		YesOrNo = yesOrNo;
	}
	
}
