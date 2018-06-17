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

import model.Customer;

public class CustomerSql {

	public static void insertCustomer(Customer customer) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format("INSERT INTO customer VALUES ({0,number,#},{1},{2},{3},{4})",
					customer.getCustomerId(), customer.getName(), customer.getPhone(), customer.getGender(),
					customer.getBirthDate());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
	}

	public static void updateCustomerGender(Integer customerId, String newGender) throws SQLException {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		String sql = "UPDATE customer SET customer_gender = " + "'" + newGender + "' " + "WHERE customer_id = "
				+ customerId;
		ps = con.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	public static List<Customer> selectAllcustomer() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<Customer> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
			while (rs.next()) {
				queryResults.add(createCustomer(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		return queryResults;
	}

	public static List<Customer> selectCustomerWithAllAddress() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<Customer> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer c WHERE NOT EXISTS "
					+ "((SELECT a.unit_no, a.street_name, a.city FROM address a)" + " MINUS "
					+ "(SELECT l.unit_no, l.street_name, l.city " + "FROM lives l "
					+ " WHERE l.customer_id = c.customer_id))");
			while (rs.next()) {
				queryResults.add(createCustomer(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		return queryResults;
	}

	private static Customer createCustomer(ResultSet rs) throws SQLException {
		Integer customerId = rs.getInt(1);
		String name = rs.getString("customer_name");
		String phone = rs.getString("customer_phone");
		String gender = rs.getString("customer_gender");
		Date customer_birthdate = rs.getDate("customer_birthdate");

		return new Customer(customerId, name, phone, gender, customer_birthdate);
	}

}
