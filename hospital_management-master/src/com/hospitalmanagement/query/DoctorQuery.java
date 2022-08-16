package com.hospitalmanagement.query;

public interface DoctorQuery {
	  public static String UPDATE_QUERY = "UPDATE doctor SET name=?,gender=?,phone_number=?,address=?,date_of_birth=TO_DATE(?, 'yyyy/mm/dd'),department_id=? WHERE id=?";
	  public static String INSERT_QUERY = "INSERT INTO doctor (id, name, gender, phone_number, address, date_of_birth, department_id) VALUES (?, ?, ?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'), ?);";
	  public static String DELETE_QUERY = "DELETE FROM doctor WHERE id=?";
}
