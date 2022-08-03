import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.hospitalmanagement.util.DBConnection;

public class Main {
	public static void main(String[] args) {
		try {
			Connection conn = DBConnection.getConnection();
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
	}
}
