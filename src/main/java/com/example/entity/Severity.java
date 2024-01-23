package com.example.entity;

public enum Severity {
	no("-"),mild("+"),moderate("++"),severe("+++"),verySevere("++++");
	
	private String severity;

	public String getSeverity() {
		return severity;
	}

	private Severity(String severity) {
		this.severity = severity;
	}
	
}
