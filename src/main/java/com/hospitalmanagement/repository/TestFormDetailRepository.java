package com.hospitalmanagement.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hospitalmanagement.model.TestFormDetail;

@Repository
public interface TestFormDetailRepository extends CrudRepository<TestFormDetail, Long> {
	@Transactional
	@Modifying
	@Query("DELETE FROM TestFormDetail tfd WHERE tfd.id IN :ids")
	void deleteAllDetailsById(@Param("ids") List<Long> ids);
}
