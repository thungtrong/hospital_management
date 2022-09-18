package com.hospitalmanagement.service;

import java.util.List;

public interface CrudService<T, ID> {
	/**
	 * This method use to insert new entity into database
	 * 
	 * @param entity. must not be null.
	 * @return the saved {@literal entity}; will never be {@literal null}.
	 * @throws IllegalArgumentException in case the given {@literal entity} is {@literal null}.
	 */
	public T insert(T entity);
	
	/**
	 * This method use to update entity. <br>
	 * 
	 * @param entity. must not be null.
	 * @return the saved {@literal entity}; will never be {@literal null}.
	 * @throws IllegalArgumentException in case the given {@literal entity} is {@literal null}.
	 */
	public T update(T entity);
	
	/**
	 * This method use to get all entities of type in a table.
	 * @return all entities
	 */
	public List<T> findAll(); 
	
	/**
	 * This method use to find {@literal entity} has id equal to {@code id}
	 * @param id must not be null.
	 * @return the {@literal entity}; will be {@literal null} if don't have any instance.
	 * @throws IllegalArgumentException in case the given entity is {@literal null}.
	 */
	public T findById(ID id);
	
	/**
	 * This method use to 
	 * @param entity
	 * @return
	 */
	// public T delete(T entity);
	
	/**
	 * This method use to delete the entity.
	 * @param id must not be null
	 * @return true if delete completely, otherwise false.
	 * @throws IllegalArgumentException in case the given entity is {@literal null}.
	 */
	public boolean deleteById(ID id);
	
	public boolean existsById(ID id);
}
