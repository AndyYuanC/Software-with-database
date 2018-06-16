package app;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import model.ParcelOwns;

public class ParcelOwnsSql {

	public static Double findMinWeight() throws SQLException {
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
	
	public static Double findMaxWeight() throws SQLException {
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
	
	private static ParcelOwns createParcel(ResultSet rs) throws SQLException {
		Double weight = (double) rs.getInt(1);
		Integer volume = rs.getInt("volume");
		String description = rs.getString("description");
		Integer customer_id = rs.getInt("customer_id");

		return new ParcelOwns(weight, volume, description, customer_id);
	}
	
}
