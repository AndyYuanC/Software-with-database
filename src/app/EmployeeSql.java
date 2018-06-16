package app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import model.EmployeeWorks;

public class EmployeeSql {

	public static List<EmployeeWorks> selectEmployeeNameFromOrderId(Integer orderId) {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<EmployeeWorks> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			String sql = "SELECT employee_name" + " FROM order_delivers o, employee_works e " + MessageFormat
					.format("WHERE o.order_no = {0,number,#} AND o.employee_id = e.employee_id", orderId);
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString("employee_name");
				queryResults.add(new EmployeeWorks(null, name, null, null, null, null, null));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(queryResults);
		return queryResults;
	}

}
