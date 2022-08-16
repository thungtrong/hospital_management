package com.hospitalmanagement.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBConnection {
	private static Connection conn = null;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		if (conn == null) {			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			ResourceBundle rb = ResourceBundle.getBundle("oracle");
			String url = rb.getString("db.url");
			String username = rb.getString("db.username");
			String password = rb.getString("db.password");
			System.out.println(url);
			System.out.println(username);
			conn = DriverManager.getConnection(url, username, password);
		}
		return conn;
	}
}
