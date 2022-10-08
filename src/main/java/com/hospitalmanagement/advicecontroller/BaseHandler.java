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
import com.hospitalmanagement.response.BasicResponse;

@ControllerAdvice
public class BaseHandler {
	// Exception of service
	@ExceptionHandler(value = {IllegalArgumentException.class})
	public ResponseEntity<Object> invalidArgument(Exception e)
	{
		return new ResponseEntity<>(createBasicResponse(e), HttpStatus.BAD_REQUEST);
	}
	
	@ExceptionHandler(value= {RecordNotFoundException.class})
	public ResponseEntity<Object> notFound(Exception e)
	{
		return new ResponseEntity<>(createBasicResponse(e), HttpStatus.NO_CONTENT);
	}
	
	// Exception of Controller 
	@ExceptionHandler(value= {ModelNotVaildException.class})
	public ResponseEntity<Object> modelNotValid(ModelNotVaildException e)
	{
		return new ResponseEntity<>(e.getFieldErrors(), HttpStatus.BAD_REQUEST);
	}
	
	private BasicResponse createBasicResponse(Exception e)
	{
		String exceptionMessage = e.getMessage();
		String message = (exceptionMessage==null || exceptionMessage.isBlank()) ? "Invalid data" : exceptionMessage;
		return new BasicResponse(false, message);
	}
}
