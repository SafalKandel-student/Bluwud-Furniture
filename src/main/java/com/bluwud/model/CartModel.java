package com.bluwud.model;


public class CartModel {
    private int cart_id;
    private UserModel user_id;
    private ProductModel product_id;
    private int cart_quantity; 

    public CartModel() {}

	public CartModel(int cart_id, UserModel user_id, ProductModel product_id,  int cart_quantity) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.cart_quantity = cart_quantity;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
	}

	public ProductModel getProduct_id() {
		return product_id;
	}

	public void setProduct_id(ProductModel product_id) {
		this.product_id = product_id;
	}


	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

   
}
