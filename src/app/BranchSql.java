package app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import model.Branch;

public class BranchSql {

	public static void insertBranch(Branch branch) {
		Connection con = DbConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			String sql = MessageFormat.format("INSERT INTO branch VALUES ({0,number,#},{1},{2})", branch.getBranchId(),
					branch.getAddress(), branch.getPhoneNumber());
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}
	}

	public static List<Branch> selectAllBranch() {
		Connection con = DbConnection.getInstance().getConnection();
		Statement stmt;
		List<Branch> queryResults = new ArrayList<>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM branch");
			while (rs.next()) {
				queryResults.add(createBranch(rs));
			}
		} catch (SQLException e) {
			System.out.println("Message: " + e.getMessage());
		}

		System.out.println(queryResults);
		return queryResults;
	}

	private static Branch createBranch(ResultSet rs) throws SQLException {
		Integer branchId = rs.getInt(1);
		String address = rs.getString("address");
		String phoneNumber = rs.getString("phone_no");

		return new Branch(branchId, address, phoneNumber);
	}

}
