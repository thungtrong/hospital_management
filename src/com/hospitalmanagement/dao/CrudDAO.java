package com.hospitalmanagement.dao;

import java.util.List;

public interface CrudDAO<T, ID> {
	/**
	 * This method is used to list all instance which were in table
	 * @return List<T> model
	 */
	List<T> findAll();
	/**
	 * This method is used to find instance having id in table  
	 * @param id
	 * @return List<T>. 
	 */
	T findById(ID id);
	/**
	 * This method used to update instance having id in table.
	 * @param model
	 * @return T. Number of affected row
	 */
	int update(T model);
	/**
	 * This method is used to insert instance into table. 
	 * @param model
	 * @return ID. If failure, return 0. 
	 */
	ID insert(T model);
	/**
	 * This method is used to delete instance in table
	 * @param model
	 * @return ID. id of model have been inserted
	 */
	int delete(T model);
}
