import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;

import com.hospitalmanagement.dao.DoctorDAO;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.util.HibernateUtil;

public class Main {
	public static void main(String[] args) {
		try {
			SessionFactory sf = HibernateUtil.getSessionFactory();
	}catch (Exception e) {
		// TODO: handle exception
	}
}
}