package gui;

import java.sql.Connection;

import javax.swing.JFrame;

import app.DbConnection;

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
		new ShippingApplication();
	}
}
