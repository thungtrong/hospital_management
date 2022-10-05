package com.hospitalmanagement.repository;


import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.PrescriptionDetail;

@Repository
public interface PrescriptionDetailRepository extends JpaRepository<PrescriptionDetail, Long> {
	@Transactional
	@Modifying
	@Query("DELETE FROM PrescriptionDetail p WHERE p.healthRecord.id IS NULL")
	int deleteByHealthRecordNull();
}

