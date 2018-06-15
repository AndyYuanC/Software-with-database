package gui;

import java.sql.Connection;

import javax.swing.JFrame;

import app.AddressSql;
import app.DbConnection;
import model.Address;

public class ShippingApplication {

	private JFrame mainFrame;

	private Connection con;

	public ShippingApplication() {
		con = DbConnection.getInstance().getConnection();
		mainFrame = new JFrame("UBCD Shipping Company");
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mainFrame.setVisible(true);

		DbConnection.closeConnection();

	}

	public static void main(String args[]) {
		Address test = new Address(123, "123", "1234", "1234", "1234", null);
		AddressSql.insertAddress(test);
		new ShippingApplication();
	}
}
