package com.hospitalmanagement.controller;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Department;
import com.hospitalmanagement.service.DepartmentService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.service.TestService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @GetMapping(value={"/list", "/", ""})
    public ModelAndView list(
            @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc,
            Authentication authentication
     )
    {
        ModelAndView modelAndView = new ModelAndView("department/list-department");
        Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
        Page<Department> pageDepartment = departmentService.findAll(page-1, size, sort);

        modelAndView.addObject("departmentList", pageDepartment.getContent());
        modelAndView.addObject("departmentListSize", pageDepartment.getSize());
        modelAndView.addObject("currentPage", pageDepartment.getNumber()+1);
        modelAndView.addObject("totalPage", pageDepartment.getTotalPages());
        
        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        modelAndView.addAllObjects(userPrincipal.getRolesMap());
        return modelAndView;
    }

    @GetMapping({"/create"})
    public String create()
    {
        return "department/create-department";
    }

    @GetMapping({"/update/{id}"})
    public ModelAndView update(@PathVariable Integer id)
    {
        ModelAndView modelAndView = new ModelAndView("department/update-department");
        Department department = departmentService.findById(id);
        modelAndView.addObject("department", department);
        return modelAndView;
    }

}
