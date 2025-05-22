package com.bluwud.util;

import java.util.regex.Pattern;

public class ValidationUtil {

	public boolean isNullOrEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}

	public boolean isAlphabetic(String value) {
		return !isNullOrEmpty(value) && value.matches("^[a-zA-Z]+$"); //
	}

	public boolean isAlphanumericStartingWithLetter(String value) {
		return !isNullOrEmpty(value) && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
	}

	public boolean isValidEmail(String email) {
		String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		return !isNullOrEmpty(email) && Pattern.matches(emailRegex, email);
	}

	public boolean isValidPhoneNumber(String number) {
		return !isNullOrEmpty(number) && number.matches("^98\\d{8}$");
	}

	public boolean isValidPassword(String password) {
		String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
		return !isNullOrEmpty(password) && password.matches(passwordRegex);
	}

	public boolean doPasswordsMatch(String password, String retypePassword) {
		return !isNullOrEmpty(password) && !isNullOrEmpty(retypePassword) && password.equals(retypePassword);
	}
	 public static boolean isNulOrEmpty(String value) {
	        return value == null || value.trim().isEmpty();
	    }
	 public static boolean isAlphanuericStartingWithLetter(String value) {
	        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
	    }
	 public static boolean isValiPhoneNumber(String number) {
	        return number != null && number.matches("^98\\d{8}$");
	    }
	 public static boolean isValiEmail(String email) {
	        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
	        return email != null && Pattern.matches(emailRegex, email);
	    }

}