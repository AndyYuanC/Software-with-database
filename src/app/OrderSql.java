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

	public static void insertOrderDelivers(OrderDelivers order) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format(
					"INSERT INTO order_delivers VALUES ({0,number,#},{1},{2},{3},{4},{5},{6})", order.getOrderNo(),
					order.getDeliveryMethod(), order.getReciever(), order.getStartDate(), order.getDeliveryDays(),
					order.getAddress(), order.getEmployeeId());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
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
