package com.hospitalmanagement.exception;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

public class ModelNotVaildException extends Exception {

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

	public static ModelNotVaildException fromBindingResult(BindingResult bindingResult) {
		List<FieldError> errors = bindingResult.getFieldErrors();
		Map<String, String> fieldErrorsMap = new HashMap<>();
		for (FieldError fieldErrors : errors) {
			fieldErrorsMap.put(fieldErrors.getField(), fieldErrors.getDefaultMessage());
		}
		return new ModelNotVaildException(fieldErrorsMap);
	}

}
