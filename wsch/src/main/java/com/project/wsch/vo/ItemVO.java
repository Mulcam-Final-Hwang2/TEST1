package com.project.wsch.vo;

public class ItemVO {
	private String imgurl;
	private String name;
	private String type;
	private String alcohol;
	private String capacity;
	private String materials;
	private String company;
	private String description;
	private int no;
	
	public ItemVO() {
		// TODO Auto-generated constructor stub
	}

	public ItemVO(String imgurl, String name, String type, String alcohol, String capacity, String materials,
			String company, String description, int no) {
		super();
		this.imgurl = imgurl;
		this.name = name;
		this.type = type;
		this.alcohol = alcohol;
		this.capacity = capacity;
		this.materials = materials;
		this.company = company;
		this.description = description;
		this.no = no;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAlcohol() {
		return alcohol;
	}

	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getMaterials() {
		return materials;
	}

	public void setMaterials(String materials) {
		this.materials = materials;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	
}

/*
 *  "URL": [],
    "상품명": [],
    "주종": [],
    "도수": [],
    "용량": [],
    "가격": [],
    "원재료": [],
    "제조사": [],
    "대표자명": [],
    "주소": [],
    "연락처": [],
    "온라인스토어": []
 * */