package com.hospitalmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Test;
@Repository
public interface TestRepository extends JpaRepository<Test, Integer>{
	List<Test> findByTestNameContainingIgnoreCase(String testName);
}
