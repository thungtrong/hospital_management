package com.hospitalmanagement.response;

import java.io.Serializable;

public class BasicResponse implements Serializable{
	private Boolean status;
	private String message;
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public BasicResponse() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BasicResponse(Boolean status, String message) {
		super();
		this.status = status;
		this.message = message;
	}
	
	public void success(String message) {
		this.status = true;
		this.message = message;
	}

	public void failure(String message) {
		this.status = false;
		this.message = message;
	}
}
