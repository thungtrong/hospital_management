package com.hospitalmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Medicine;

@Repository
public interface MedicineRepository extends JpaRepository<Medicine, Integer> {

	List<Medicine> findAllByNameContainingIgnoreCase(String name);

}
