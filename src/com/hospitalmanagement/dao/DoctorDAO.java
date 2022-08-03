package com.hospitalmanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.hospitalmanagement.model.Doctor;

public class DoctorDAO implements DAO<Doctor, Long>{
	private final Connection conn;
	
	public DoctorDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	private Doctor mappingDoctor(ResultSet rs) throws SQLException
	{
		Doctor d = new Doctor();
		d.setId(rs.getLong(1));
		d.setName(rs.getString(2));
		d.setGender(rs.getString(3).charAt(0));
		d.setPhoneNumber(rs.getString(4));
		d.setAddress(rs.getString(5));
		d.setDateOfBirth(rs.getDate(6));
		
		return d;
	}

	@Override
	public List<Doctor> findAll() throws SQLException {
		// TODO Auto-generated method stub
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT id, name, gender, phone_number, address, date_of_birth, department_id FROM doctor");
		List<Doctor> doctors = new ArrayList<>();
		while (rs.next())
		{
			doctors.add(this.mappingDoctor(rs));
		}
		return doctors;
	}

	@Override
	public Doctor findById(Long id) throws SQLException {
		PreparedStatement st = conn.prepareStatement("SELECT id, name, gender, phone_number, address, date_of_birth, department_id FROM doctor WHERE id=?");
		ResultSet rs = st.executeQuery();
		if (rs.next())
			return this.mappingDoctor(rs);
		return null;
	}

	@Override
	public Doctor update(Doctor model) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Doctor save(Doctor model) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Doctor model) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
