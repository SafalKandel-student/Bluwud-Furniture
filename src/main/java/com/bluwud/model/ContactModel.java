package com.bluwud.model;

public class ContactModel {
	
	private int contact_form_id;
	private String full_name;
	private String email;
	private String message;
	
	private UserModel user_id;

	public ContactModel(int contact_form_id, String full_name, String email, String message, UserModel user_id) {
		super();
		this.contact_form_id = contact_form_id;
		this.full_name = full_name;
		this.email = email;
		this.message = message;
		this.user_id = user_id;
	}

	public ContactModel() {
		super();
	}

	public int getContact_form_id() {
		return contact_form_id;
	}

	public void setContact_form_id(int contact_form_id) {
		this.contact_form_id = contact_form_id;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
	}
	
	

}