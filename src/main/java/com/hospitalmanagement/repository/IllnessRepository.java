package com.hospitalmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.Illness;

@Repository
public interface IllnessRepository extends JpaRepository<Illness, Integer> {

	List<Illness> findAllByNameContainingIgnoreCase(String name);
}
