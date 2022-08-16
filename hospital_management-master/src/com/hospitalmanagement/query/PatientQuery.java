package com.hospitalmanagement.query;

public interface PatientQuery {
	 static final String UPDATE_QUERY = "UPDATE patient SET name=?,date_of_birth=TO_DATE(?, 'yyyy/mm/dd'),gender=?,address=?,phone_number=? WHERE id=?";
	 static final String INSERT_QUERY = "INSERT INTO patient (id, name, date_of_birth, gender, address,phone_number ) VALUES (?, ?,TO_DATE(?, 'yyyy/mm/dd'),?, ?, ?);";
	 static final String DELETE_QUERY = "DELETE FROM patient WHERE id=?";
}
