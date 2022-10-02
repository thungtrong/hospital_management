package com.hospitalmanagement.advicecontroller;
/**
 * Handle basic java error
 * @author Admin
 *
 */

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hospitalmanagement.exception.ModelNotVaildException;
import com.hospitalmanagement.exception.RecordNotFoundException;

@ControllerAdvice
public class BaseHandler {
	@ExceptionHandler(value = {IllegalArgumentException.class})
	public ResponseEntity<Object> invalidArgument()
	{
		return new ResponseEntity<>("Invalid data", HttpStatus.BAD_REQUEST);
	}
	
	@ExceptionHandler(value= {RecordNotFoundException.class})
	public ResponseEntity<Object> notFound(Exception e)
	{
		String message = e.getMessage();
		return new ResponseEntity<>(message, HttpStatus.NO_CONTENT);
	}
	
	@ExceptionHandler(value= {ModelNotVaildException.class})
	public ResponseEntity<Object> modelNotValid(ModelNotVaildException e)
	{
		return new ResponseEntity<>(e.getFieldErrors(), HttpStatus.BAD_REQUEST);
	}
}
