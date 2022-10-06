package com.hospitalmanagement.controller;

import com.hospitalmanagement.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class DashboardController {
    @Autowired
    DepartmentRepository departmentRepository;
    @Autowired
    DoctorRepository doctorRepository;
    @Autowired
    PatientRepository patientRepository;
    @Autowired
    MedicineRepository medicineRepository;
    @Autowired
    IllnessRepository illnessRepository;
    @Autowired
    HealthRecordRepository healthRecordRepository;
    @Autowired
    TestRepository testRepository;
    @Autowired
    AdmissionFormRepository admissionFormRepository;
    @Autowired
    AccountRepository accountRepository;
    @RequestMapping(value = {"","/","index"}, method= RequestMethod.GET )
    public ModelAndView getDashboard() {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("departments", departmentRepository.count());
        modelAndView.addObject("doctors", doctorRepository.count());
        modelAndView.addObject("patients", patientRepository.count());
        modelAndView.addObject("medicines", medicineRepository.count());
        modelAndView.addObject("illnesses", illnessRepository.count());
        modelAndView.addObject("healthRecords", healthRecordRepository.count());
        modelAndView.addObject("tests", testRepository.count());
        modelAndView.addObject("admissionForms", admissionFormRepository.count());
        modelAndView.addObject("accounts", accountRepository.count());
        return modelAndView;
    }
}
