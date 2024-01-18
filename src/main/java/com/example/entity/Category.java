package com.example.entity;

public enum Category {
	scientificKnowledge("科研新知"),FoodAndDrugSafety("食藥安全"),
	mentalHealth("心理健康"),healthMyths("健康迷思"),
	TraditionalChineseMedicineConditioning("中醫調理");
	
	private String category;

	private Category(String category) {
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

}
