package com.hospitalmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long>{
	List<Patient> findAllByNameContainingIgnoreCaseAndPhoneNumberContaining(String name, String phoneNumber);
}
