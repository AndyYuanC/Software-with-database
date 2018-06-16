package app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ParcelOwnsSql {

	public static Double findMinWeight() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		double minparcel = 0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT min(weight) FROM parcel_owns");
			while (rs.next()) {
				minparcel = rs.getDouble(1);
			}

		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(minparcel);
		return minparcel;
	}

	public static Double findMaxWeight() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		double maxparcel = 0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT max(weight) FROM parcel_owns");
			while (rs.next()) {
				maxparcel = rs.getDouble(1);
			}

		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(maxparcel);
		return maxparcel;
	}

}
