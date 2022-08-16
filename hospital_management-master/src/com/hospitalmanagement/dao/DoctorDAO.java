package com.hospitalmanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.query.DoctorQuery;

public class DoctorDAO implements DAO<Doctor, Long>, DoctorQuery{
	private final Connection conn;

	
	private static SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy/mm/dd"); 
	
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
		d.setDepartmentId(rs.getInt(7));
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
		st.setLong(1, id);
		ResultSet rs = st.executeQuery();
		if (rs.next())
			return this.mappingDoctor(rs);
		return null;
	}

	@Override
	public Doctor update(Doctor model) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement st = conn.prepareStatement(UPDATE_QUERY);
		st.setString(1, model.getName());
		st.setString(2, model.getGender().toString());
		st.setString(3, model.getPhoneNumber());
		st.setString(4, model.getAddress());
		st.setString(5, dateFormater.format(model.getDateOfBirth()));
		st.setInt(6, model.getDepartmentId());
		st.setLong(7, model.getId());
		if (st.executeUpdate() > 0)
		{
			return model;
		}
		return null;
	}

	@Override
	public Doctor insert(Doctor model) throws SQLException {
		PreparedStatement st = conn.prepareStatement(INSERT_QUERY);
		st.setString(1, model.getName());
		st.setString(2, model.getGender().toString());
		st.setString(3, model.getPhoneNumber());
		st.setString(4, model.getAddress());
		st.setString(5, dateFormater.format(model.getDateOfBirth()));
		st.setInt(6, model.getDepartmentId());
		if (st.executeUpdate() > 0)
		{
			return model;
		}
		return null;
	}
	
	
	@Override
	public Doctor save(Doctor model) throws SQLException {
		if (model.getId() != null)
		{
			return this.insert(model);
		} else
		{			
			return this.update(model);
		}
	}

	@Override
	public int delete(Doctor model) throws SQLException {
		PreparedStatement st = conn.prepareStatement(DELETE_QUERY);
		st.setLong(1, model.getId());
		
		return st.executeUpdate();
	}

	
	
}
