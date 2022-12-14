package com.hospitalmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Illness;
import com.hospitalmanagement.service.IllnessService;

@Controller
@RequestMapping("/illness")
public class IllnessController {
    @Autowired
    private IllnessService illnessService;

    @GetMapping(value = { "/list", "/", "" })
    public ModelAndView list(
            @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(defaultValue = "name") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
            // @RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue =
            // "") String qPhoneNumber
            , Authentication authentication) {
        ModelAndView modelAndView = new ModelAndView("illness/list-illness");
        Sort sort = asc ? Sort.by(Sort.Order.asc(orderBy)) : Sort.by(Sort.Order.desc(orderBy));
        Page<Illness> pageTest = illnessService.findAll(page - 1, size, sort);

        modelAndView.addObject("illnessList", pageTest.getContent());
        modelAndView.addObject("illnessListSize", pageTest.getSize());
        modelAndView.addObject("currentPage", pageTest.getNumber() + 1);
        modelAndView.addObject("totalPage", pageTest.getTotalPages());

        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        modelAndView.addAllObjects(userPrincipal.getRolesMap());

        return modelAndView;
    }

    @GetMapping({ "/create" })
    public String create() {
        return "illness/create-illness";
    }

    @GetMapping({ "/update/{id}" })
    public ModelAndView update(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("illness/update-illness");
        Illness illness = illnessService.findById(id);
        modelAndView.addObject("illness", illness);
        return modelAndView;
    }
}
