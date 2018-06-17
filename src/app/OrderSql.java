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

import model.OrderDelivers;

public class OrderSql {

	public static int minDaysDeliveryMethod(String method) {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		int minDays = 0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT delivery_method, min(delivery_days) FROM order_delivers WHERE lower(delivery_method) = "
							+ "lower('" + method + "') " + "GROUP BY delivery_method");
			while (rs.next()) {
				minDays = rs.getInt(2);
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		return minDays;
	}

	public static int maxDaysDeliveryMethod(String method) {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		int maxDays = 0;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT delivery_method, max(delivery_days) FROM order_delivers WHERE lower(delivery_method) = "
							+ "lower('" + method + "') " + "GROUP BY delivery_method");
			while (rs.next()) {
				maxDays = rs.getInt(2);
			}
		} catch (SQLException e) {
			System.out.println("Messagse: " + e.getMessage());
		}

		return maxDays;
	}

	public static void insertOrderDelivers(OrderDelivers order) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format(
					"INSERT INTO order_delivers VALUES ({0,number,#},{1},{2},{3},{4},{5},{6,number,#})",
					order.getOrderNo(), order.getDeliveryMethod(), order.getReciever(), order.getStartDate(),
					order.getDeliveryDays(), order.getAddress(), order.getEmployeeId());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
	}

	public static List<OrderDelivers> selectOrderFromId(Integer orderId) {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<OrderDelivers> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			String sql = "SELECT order_no, delivery_method, start_date, delivery_days" + " FROM order_delivers "
					+ MessageFormat.format("WHERE order_no = {0,number,#}", orderId);
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				queryResults.add(createProjectionOrderDelivers(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(queryResults);
		return queryResults;
	}

	public static List<OrderDelivers> selectAllOrderDelivers() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<OrderDelivers> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM order_delivers");
			while (rs.next()) {
				queryResults.add(createOrderDelivers(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(queryResults);
		return queryResults;
	}

	private static OrderDelivers createProjectionOrderDelivers(ResultSet rs) throws SQLException {
		Integer orderNo = rs.getInt(1);
		String deliveryMethod = rs.getString("delivery_method");
		Date startDate = rs.getDate("start_date");
		Integer deliveryDays = rs.getInt("delivery_days");

		return new OrderDelivers(orderNo, deliveryMethod, null, startDate, deliveryDays, null, null);
	}

	private static OrderDelivers createOrderDelivers(ResultSet rs) throws SQLException {
		Integer orderNo = rs.getInt(1);
		String deliveryMethod = rs.getString("delivery_method");
		String reciever = rs.getString("receiver");
		Date startDate = rs.getDate("start_date");
		Integer deliveryDays = rs.getInt("delivery_days");
		String address = rs.getString("address");
		Integer employeeId = rs.getInt("employee_id");

		return new OrderDelivers(orderNo, deliveryMethod, reciever, startDate, deliveryDays, address, employeeId);
	}
}
