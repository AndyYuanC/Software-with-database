package app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;

import model.Address;

public class AddressSql {

	public static void insertAddress(Address address) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format("INSERT INTO address VALUES ({0},{1},{2},{3},{4}, {5})",
					address.getUnitNo(), address.getStreetName(), address.getCity(), address.getProvince(),
					address.getPostalCode(), address.getCountry());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			con.commit();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
			try {
				// undo the insert
				con.rollback();
			} catch (SQLException ex2) {
				System.out.println("Message: " + ex2.getMessage());
				System.exit(-1);
			}
		}

	}

}
