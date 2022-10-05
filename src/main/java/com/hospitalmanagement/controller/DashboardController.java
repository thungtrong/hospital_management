package com.hospitalmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {
    public ModelAndView index()
    {
        return new ModelAndView("/all");
    }
}
