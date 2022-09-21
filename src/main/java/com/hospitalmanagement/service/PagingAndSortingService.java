package com.hospitalmanagement.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

public interface PagingAndSortingService<T, ID> extends CrudService<T, ID>{
	/**
	 * Get all entries sorted by {@code sort}
	 * @param sort
	 * @return 
	 */
	Iterable<T> findAll(Sort sort);
	
	/**
	 * Get {@code size} entries in page number {@code page}
	 * These entries are sorted by {@code sort} 
	 * @param page
	 * @param size
	 * @param sort
	 * @return
	 */
	Page<T> findAll(int page, int size, Sort sort);
}
