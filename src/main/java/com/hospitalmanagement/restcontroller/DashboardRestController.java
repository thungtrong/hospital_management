package com.hospitalmanagement.restcontroller;

import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class DashboardRestController {
    @Autowired
    DepartmentService departmentService;
    @Autowired
    DoctorService doctorService;
    @Autowired
    PatientService patientService;
    @Autowired
    MedicineService medicineService;
    @Autowired
    IllnessService illnessService;
    @Autowired
    HealthRecordService healthRecordService;
    @Autowired
    TestService testService;
    @Autowired
    AdmissionFormService admissionFormService;
    @RequestMapping(path="/all", method= RequestMethod.GET)
    public ModelAndView getDashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");
        modelAndView.addObject("departments", departmentService.findAll().size());
//        modelAndView.addObject("doctors", doctorService.findAll().size());
//        modelAndView.addObject("patients", patientService.findAll().size());
//        modelAndView.addObject("medicines", medicineService.findAll().size());
//        modelAndView.addObject("illnesses", illnessService.findAll().size());
//        modelAndView.addObject("healthRecords", healthRecordService.findAll().size());
//        modelAndView.addObject("tests", testService.findAll().size());
//        modelAndView.addObject("admissionForms", admissionFormService.findAll().size());
        return modelAndView;
    }

}
