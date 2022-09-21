package com.hospitalmanagement.exception;

public class RecordNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public RecordNotFoundException() {
		super("Record not found");
	}

	public RecordNotFoundException(String message) {
		super(message);
	}
	
	

}
