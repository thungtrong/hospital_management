package com.hospitalmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Doctor;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
	List<Doctor> findAllByNameContainingIgnoreCase(String name);
}
