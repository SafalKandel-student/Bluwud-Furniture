package com.bluwud.model;

public class CategoryModel {
	private int category_id;
	private String category_type;
	

	public CategoryModel() {
		super();
	}

	public CategoryModel(int category_id) {
		super();
		this.category_id = category_id;
	}

	public CategoryModel(int category_id, String category_type) {
		this.category_id = category_id;
		this.category_type = category_type;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getCategory_type() {
		return category_type;
	}

	public void setCategory_type(String category_type) {
		this.category_type = category_type;
	}

}