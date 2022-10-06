package com.hospitalmanagement.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HandleErrorController implements ErrorController {
	private static final Map<String, String> MAP_MESSAGE;
	static {
		MAP_MESSAGE = new HashMap<>();
		MAP_MESSAGE.put("400", "The server cannot or will not process the request due to something that is perceived to be a client error");
		MAP_MESSAGE.put("401", "You do not have permission to access");
		MAP_MESSAGE.put("403", "You do not have permission to access");
		MAP_MESSAGE.put("404", "The page you're looking for was not found.");
		MAP_MESSAGE.put("500", "Something went wrong!");
	}
	@RequestMapping("/error")
	public ModelAndView handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		
		ModelAndView model = new ModelAndView();		
		model.setViewName("error-page");
		model.addObject("message", "Something went wrong!");
		if (status != null) {
			String statusCode = status.toString();
			String message = MAP_MESSAGE.get(statusCode);
			model.addObject("statusCode", statusCode);
			model.addObject("message", message);
		}
		return model;
	}

	public String getErrorPath() {
		return "/error";
	}
}