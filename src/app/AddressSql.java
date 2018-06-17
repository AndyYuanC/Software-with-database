package app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import model.Address;

public class AddressSql {

	public static void insertAddress(Address address) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format("INSERT INTO address VALUES ({0,number,#},{1},{2},{3},{4}, {5})",
					address.getUnitNo(), address.getStreetName(), address.getCity(), address.getProvince(),
					address.getPostalCode(), address.getCountry());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
	}

	public static List<Address> selectAllAddress() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<Address> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM address");
			while (rs.next()) {
				queryResults.add(createAddress(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		return queryResults;
	}

	private static Address createAddress(ResultSet rs) throws SQLException {
		Integer unitNo = rs.getInt(1);
		String streetName = rs.getString("street_name");
		String city = rs.getString("city");
		String province = rs.getString("province");
		String postalCode = rs.getString("postal_code");
		String country = rs.getString("country");

		return new Address(unitNo, streetName, city, province, postalCode, country);
	}

}
