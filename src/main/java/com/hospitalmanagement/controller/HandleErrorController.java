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
		MAP_MESSAGE.put("401", "The request has not been applied because it lacks valid authentication credentials for the target resource");
		MAP_MESSAGE.put("403", "The server understood the request but refuses to authorize it");
		MAP_MESSAGE.put("404", "The origin server did not find a current representation for the target resource or is not willing to disclose that one exists");
		MAP_MESSAGE.put("405", "The method is not allowed for the requested URL");
		MAP_MESSAGE.put("500", "The server encountered an internal error or misconfiguration and was unable to complete your request");
		MAP_MESSAGE.put("502", "The server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fulfill the request");
		MAP_MESSAGE.put("503", "The server is currently unavailable (because it is overloaded or down for maintenance)");
		MAP_MESSAGE.put("504", "The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server specified by the URI or some other auxiliary server it needed to access in attempting to complete the request");
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