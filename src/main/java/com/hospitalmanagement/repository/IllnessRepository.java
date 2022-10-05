package com.hospitalmanagement.repository;

import com.hospitalmanagement.model.Illness;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

@Repository
public interface IllnessRepository extends JpaRepository<Illness, Integer> {

	List<Illness> findAllByNameContainingIgnoreCase(String name);
}
