package com.hospitalmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
    @Query("from Account where doctor.id=:doctorId")
    Account findByDoctorId(@Param("doctorId") Long id);
}
