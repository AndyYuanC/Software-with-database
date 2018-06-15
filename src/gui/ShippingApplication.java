package gui;

import java.awt.GridLayout;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import app.DbConnection;

public class ShippingApplication {

	private JFrame mainFrame;

	private Connection con;

	public ShippingApplication() {
		con = DbConnection.getInstance().getConnection();
		mainFrame = new JFrame("UBCD Shipping Company");
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		mainFrame.setVisible(true);
		JPanel mainPanel = createMainPanel();
		mainFrame.add(mainPanel);

		DbConnection.closeConnection();
	}

	private JPanel createMainPanel() {
		JPanel mainPanel = new JPanel(new GridLayout(2, 0));
		JButton query1 = new JButton("query1");
		JButton query2 = new JButton("query2");
		JButton query3 = new JButton("query3");
		JButton query4 = new JButton("query4");
		JButton query5 = new JButton("query5");
		JButton query6 = new JButton("query6");
		JButton query7 = new JButton("query7");
		JButton query8 = new JButton("query8");
		JButton query9 = new JButton("query9");
		JButton query10 = new JButton("query10");
		mainPanel.add(query1);
		mainPanel.add(query2);
		mainPanel.add(query3);
		mainPanel.add(query4);
		mainPanel.add(query5);
		mainPanel.add(query6);
		mainPanel.add(query7);
		mainPanel.add(query8);
		mainPanel.add(query9);
		mainPanel.add(query10);

		return mainPanel;
	}

	public static void main(String args[]) {
		new ShippingApplication();
	}
}
