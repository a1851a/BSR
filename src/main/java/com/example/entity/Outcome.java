package com.example.entity;

public class Outcome {
	private String userId;
	private String disease;
	private String suggestion;
	private String record_day;
	
	public Outcome() {
		
	}
	
	public Outcome(String userId, String disease, String suggestion, String record_day) {
		this.userId = userId;
		this.disease = disease;
		this.suggestion = suggestion;
		this.record_day = record_day;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	public String getRecordDay() {
		return record_day;
	}

	public void setRecordDay(String record_day) {
		this.record_day = record_day;
	}

	@Override
	public String toString() {
		return "Outcome [userId=" + userId + ", disease=" + disease + ", suggestion=" + suggestion + ", recordDay="
				+ record_day + "]";
	}

}
