package app;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

public class DeleteAddress {

	public static int DeleteSelectedAddress(Integer unitno, String streetname, String city) {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			String sql = "delete from address where UNIT_NO = " + MessageFormat.format("{0,number,#}", unitno)
					+ " AND STREET_NAME =" + "'" + streetname + "'" + " AND CITY =" + "'" + city + "'";
			System.out.print(sql);
			stmt.executeQuery(sql);

		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		return 0;
	}
}
