import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.hospitalmanagement.dao.DoctorDAO;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.util.DBConnection;

public class Main {
	public static void main(String[] args) {
		try {
			Connection conn = DBConnection.getConnection();
			DoctorDAO doctorDao = new DoctorDAO(conn);
			List<Doctor> d = doctorDao.findAll();
			System.out.println(d);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
	}
}
