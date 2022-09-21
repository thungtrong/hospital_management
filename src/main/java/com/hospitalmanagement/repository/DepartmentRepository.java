package com.hospitalmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Department;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Integer>{

}
