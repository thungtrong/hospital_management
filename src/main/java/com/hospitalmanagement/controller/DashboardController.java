package com.hospitalmanagement.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.repository.AccountRepository;
import com.hospitalmanagement.repository.AdmissionFormRepository;
import com.hospitalmanagement.repository.DepartmentRepository;
import com.hospitalmanagement.repository.DoctorRepository;
import com.hospitalmanagement.repository.HealthRecordRepository;
import com.hospitalmanagement.repository.IllnessRepository;
import com.hospitalmanagement.repository.MedicineRepository;
import com.hospitalmanagement.repository.PatientRepository;
import com.hospitalmanagement.repository.TestRepository;

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

    @RequestMapping(value = { "", "/", "index" }, method = RequestMethod.GET)
    public ModelAndView getDashboard(Authentication authentication) {
        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();

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

        Map<String, Boolean> rolesMap = userPrincipal.getRolesMap();
        modelAndView.addAllObjects(rolesMap);

        Doctor doctor = userPrincipal.getAccount().getDoctor();
        String doctorName = doctor != null ? doctor.getName() : "Admin";
        modelAndView.addObject("name", doctorName);
        return modelAndView;
    }
}
