package com.project.wsch.vo;

import java.util.List;

public class NCPSearchTrendVO {
	private String startDate;
	private String endDate;
	private String timeUnit;
	private String gender;
	private String age[];
	
	private String groupName;
	private List<String> keyword;
	
	public NCPSearchTrendVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTimeUnit() {
		return timeUnit;
	}
	public void setTimeUnit(String timeUnit) {
		this.timeUnit = timeUnit;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getAge() {
		return age;
	}
	public void setAge(String[] age) {
		this.age = age;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public List<String> getKeyword() {
		return keyword;
	}
	public void setKeyword(List<String> keyword) {
		this.keyword = keyword;
	}
	
	
}
