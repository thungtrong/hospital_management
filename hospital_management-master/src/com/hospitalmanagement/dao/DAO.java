package com.hospitalmanagement.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAO<T, ID> {
	List<T> findAll() throws SQLException;
	
	T findById(ID id) throws SQLException;
	
	T update(T model) throws SQLException;
	
	T insert(T model) throws SQLException;
	
	T save(T model) throws SQLException;
	
	int delete(T model) throws SQLException;
}
