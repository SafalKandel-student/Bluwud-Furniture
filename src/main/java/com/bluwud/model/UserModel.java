package com.bluwud.model;

    public class UserModel  {
    private int user_id;
	private String user_name;
	private String user_contact;
	private String user_address;
	private String user_email;
	private String user_password;
	private String user_role;
	
	
	public UserModel() {
	}


	public UserModel(int user_id, String user_name, String user_contact, String user_address, String user_email,
			String user_password, String user_role) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_contact = user_contact;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_role = user_role;
	}
	


	public UserModel(int user_id) {
		super();
		this.user_id = user_id;
	}


	public UserModel(String user_name, String user_contact, String user_address, String user_email,
			String user_password) {;
		this.user_name = user_name;
		this.user_contact = user_contact;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_password = user_password;
	}


	public UserModel(String user_name, String user_password) {
		this.user_name = user_name;
		this.user_password = user_password;
	}


	public UserModel(int user_id, String user_name, String user_contact, String user_address, String user_email) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_contact = user_contact;
		this.user_address = user_address;
		this.user_email = user_email;
	}
	


	public UserModel(int user_id, String user_name, String user_contact, String user_address, String user_email,
			String user_password) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_contact = user_contact;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_password = user_password;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_contact() {
		return user_contact;
	}


	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getUser_role() {
		return user_role;
	}


	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	

 }