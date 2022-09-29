package com.hospitalmanagement.repository;

import com.hospitalmanagement.model.Illness;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IllnessRepository extends JpaRepository<Illness, Integer> {

}
