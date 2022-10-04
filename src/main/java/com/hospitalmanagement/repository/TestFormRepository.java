package com.hospitalmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.TestForm;

@Repository
public interface TestFormRepository extends JpaRepository<TestForm, Long> {

}
