package com.hospitalmanagement.exception;

import java.io.Serializable;
import java.util.Map;

import org.springframework.validation.BindingResult;

public class ModelNotVaildException extends Exception implements Serializable {
	Map<String, String> fieldErrors;

	public ModelNotVaildException() {

	}

	public ModelNotVaildException(Map<String, String> fieldErrors) {
		super();
		this.fieldErrors = fieldErrors;
	}

	public Map<String, String> getFieldErrors() {
		return fieldErrors;
	}

	public void setFieldErrors(Map<String, String> fieldErrors) {
		this.fieldErrors = fieldErrors;
	}

}
