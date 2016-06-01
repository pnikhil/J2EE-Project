package com.mfrp.dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class DAO implements DBCredentials {

	public static Connection con = null;

	public static Connection getConnection() {

		try {
			if (con == null || con.isClosed()) {

				Driver myd = new com.mysql.jdbc.Driver();
				DriverManager.registerDriver(myd);
				con = DriverManager.getConnection(db_url, db_username, db_password);

				Enumeration<Driver> drivers = DriverManager.getDrivers();
				while (drivers.hasMoreElements()) {
					Driver driver = drivers.nextElement();
					DriverManager.deregisterDriver(driver);

				}
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception in DAO : " + e);
		}
		return con;
	}

	public static void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.err.println("SQL Exception in DAO closeConnection : " + e);
			}
		}
	}
}
