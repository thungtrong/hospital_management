package com.hospitalmanagement.repository;

import com.hospitalmanagement.model.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicineRepository  extends JpaRepository<Medicine, Integer> {

}
