package com.bluwud.model;

public class ProductModel{
	private int product_id;
	private String product_name;
	private String product_description;
	private float product_unitprice;
	private String image_path;
	
	private CategoryModel category_id;
	private SupplierModel supplier_id;
	
	public ProductModel(int product_id, String product_name, String product_description, float product_unitprice,
			String image_path, CategoryModel category_id, SupplierModel supplier_id) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_description = product_description;
		this.product_unitprice = product_unitprice;
		this.image_path = image_path;
		this.category_id = category_id;
		this.supplier_id = supplier_id;
	}
	

	public ProductModel(int product_id, String product_name, String product_description, float product_unitprice,
			CategoryModel category_id, SupplierModel supplier_id) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_description = product_description;
		this.product_unitprice = product_unitprice;
		this.category_id = category_id;
		this.supplier_id = supplier_id;
	}


	public ProductModel(int product_id) {
		super();
		this.product_id = product_id;
	}

	public ProductModel() {
		super();
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public float getProduct_unitprice() {
		return product_unitprice;
	}

	public void setProduct_unitprice(float product_unitprice) {
		this.product_unitprice = product_unitprice;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public CategoryModel getCategory_id() {
		return category_id;
	}

	public void setCategory_id(CategoryModel category_id) {
		this.category_id = category_id;
	}

	public SupplierModel getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(SupplierModel supplier_id) {
		this.supplier_id = supplier_id;
	}
	
	
	
}