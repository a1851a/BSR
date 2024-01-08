package com.example.exception;

public class AccountException extends Exception {

	public AccountException() {
		super();
	}

	public AccountException(String message) {
		super(message);
	}

	public AccountException(Throwable cause) {
		super(cause);
	}

	public AccountException(String message, Throwable cause) {
		super(message, cause);
	}

}
