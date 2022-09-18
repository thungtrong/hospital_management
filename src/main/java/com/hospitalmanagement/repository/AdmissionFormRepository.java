package com.hospitalmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.AdmissionForm;

@Repository
public interface AdmissionFormRepository extends JpaRepository<AdmissionForm, Long> {

}
