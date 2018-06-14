package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	private static DbConnection instance;

	private static Connection con;

	private DbConnection() {
		registerOracleDriver();
		String connectURL = "jdbc:oracle:thin:@localhost:1522:ug";

		try {
			con = DriverManager.getConnection(connectURL, "ora_y2k0b", "a47078150");
			instance = this;
			System.out.println("\nConnected to Oracle!");
		} catch (SQLException ex) {
			System.out.println("Message: " + ex.getMessage());
		}
	}

	private void registerOracleDriver() {
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		} catch (SQLException ex) {
			System.out.println("Message: " + ex.getMessage());
			System.exit(-1);
		}
	}

	public static DbConnection getInstance() {
		if (instance == null) {
			return new DbConnection();
		}
		return instance;
	}

	public static void closeConnection() {
		if (instance == null) {
			return;
		}
		try {
			getInstance().getConnection().close();
			System.out.println("Closing DB connection");
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
	}

	public Connection getConnection() {
		return con;
	}

}
