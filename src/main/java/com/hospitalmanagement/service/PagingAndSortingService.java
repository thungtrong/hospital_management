package com.hospitalmanagement.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

public interface PagingAndSortingService<T, ID> extends CrudService<T, ID>{
	Iterable<T> findAll(Sort sort);
	
	Page<T> findAll(int page, int size, Sort sort);
}
