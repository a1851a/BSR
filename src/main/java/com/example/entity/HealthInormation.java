package com.example.entity;

//定義健康資訊資料(POJO)
public class HealthInormation {
	private Integer healthInformationId;		//健康資訊Id
	private Category healthInformationCategory;	//健康資訊類別
	private String healthInformationTitle;   	//健康資訊標題
	private String healthInformationContext; 	//健康資訊內容
	private String healthInformationUrl;		//健康資訊網址
	private String healthInformationPictureUrl;	//健康資訊照片網址
	
	private static Integer count = 0;			//計算Id	
	
	public HealthInormation() {
		
	}

	public HealthInormation(Category healthInformationCategory,
			String healthInformationTitle, String healthInformationContext, String healthInformationUrl,
			String healthInformationPictureUrl) {
		this.healthInformationId = ++count;
		this.healthInformationCategory = healthInformationCategory;
		this.healthInformationTitle = healthInformationTitle;
		this.healthInformationContext = healthInformationContext;
		this.healthInformationUrl = healthInformationUrl;
		this.healthInformationPictureUrl = healthInformationPictureUrl;
	}

	public Integer getHealthInformationId() {
		return healthInformationId;
	}

	public void setHealthInformationId(Integer healthInformationId) {
		this.healthInformationId = healthInformationId;
	}

	public String getHealthInformationCategory() {
		return healthInformationCategory.getCategory();
	}

	public void setHealthInformationCategory(Category healthInformationCategory) {
		this.healthInformationCategory = healthInformationCategory;
	}

	public String getHealthInformationTitle() {
		return healthInformationTitle;
	}

	public void setHealthInformationTitle(String healthInformationTitle) {
		this.healthInformationTitle = healthInformationTitle;
	}

	public String getHealthInformationContext() {
		return healthInformationContext;
	}

	public void setHealthInformationContext(String healthInformationContext) {
		this.healthInformationContext = healthInformationContext;
	}

	public String getHealthInformationUrl() {
		return healthInformationUrl;
	}

	public void setHealthInformationUrl(String healthInformationUrl) {
		this.healthInformationUrl = healthInformationUrl;
	}

	public String getHealthInformationPictureUrl() {
		return healthInformationPictureUrl;
	}

	public void setHealthInformationPictureUrl(String healthInformationPictureUrl) {
		this.healthInformationPictureUrl = healthInformationPictureUrl;
	}

	@Override
	public String toString() {
		return "healthInformationId:" + healthInformationId + 
				"\nhealthInformationCategory:"+ healthInformationCategory + 
				"\nhealthInformationTitle:" + healthInformationTitle + 
				"\nhealthInformationContext:" + healthInformationContext + 
				"\nhealthInformationUrl:"+ healthInformationUrl + 
				"\nhealthInformationPictureUrl:" + healthInformationPictureUrl 
				+ "\n";
	}
	
}
