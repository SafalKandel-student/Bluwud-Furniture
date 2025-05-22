package com.bluwud.model;

public class SupplierModel {
    private int supplier_id;
    private String supplier_name;
    private String supplier_contact;
    private String supplier_email;
    
    
	public SupplierModel(int supplier_id) {
		super();
		this.supplier_id = supplier_id;
	}


	public SupplierModel() {
		super();
	}


	public SupplierModel(int supplier_id, String supplier_name, String supplier_contact, String supplier_email) {
		this.supplier_id = supplier_id;
		this.supplier_name = supplier_name;
		this.supplier_contact = supplier_contact;
		this.supplier_email = supplier_email;
	}
	
	
	public SupplierModel(int supplier_id, String supplier_name) {
		super();
		this.supplier_id = supplier_id;
		this.supplier_name = supplier_name;
	}


	public int getSupplier_id() {
		return supplier_id;
	}
	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getSupplier_contact() {
		return supplier_contact;
	}
	public void setSupplier_contact(String supplier_contact) {
		this.supplier_contact = supplier_contact;
	}
	public String getSupplier_email() {
		return supplier_email;
	}
	public void setSupplier_email(String supplier_email) {
		this.supplier_email = supplier_email;
	}
    
    
}
