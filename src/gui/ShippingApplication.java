package gui;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.sql.Connection;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import app.DbConnection;

public class ShippingApplication extends JFrame{

	private Connection con;
	
	private final int width = 1024;
	
	private final int height = 768;

	public ShippingApplication() {
		con = DbConnection.getInstance().getConnection();
		setTitle("UBC Delivery");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		JPanel mainPanel = createMainPanel();
		add(mainPanel);
		setSize(new Dimension(width,height));
		setResizable(false);
		DbConnection.closeConnection();
	}
	

	private JPanel createMainPanel() {
		JPanel mainPanel = new JPanel(new GridLayout(6, 0, 100, 70));
		
		JLabel customer = new JLabel("Customer");
		customer.setFont(new Font("Serif", Font.BOLD,50));
		JLabel l1 = new JLabel("");
		JLabel l2 = new JLabel("");
		JLabel employee = new JLabel("Employee");
		JLabel l3 = new JLabel("");
		JLabel l4 = new JLabel("");
		JLabel l5 = new JLabel("");
		employee.setFont(new Font("Serif", Font.BOLD,50));
		JButton query1 = new JButton("Find Order");
		JButton query2 = new JButton("Find Delivery Man");
		JButton query3 = new JButton("Delete An Address");
		JButton query4 = new JButton("Update Your Gender");
		JButton query5 = new JButton("query");
		JButton query6 = new JButton("Lightest Parcel");
		JButton query7 = new JButton("Heviest Parcel");
		JButton query8 = new JButton("Find Min Date For Specific Delivery Method");
		JButton query9 = new JButton("Find Max Date For Specific Delivery Method");
		JButton query10 = new JButton("Find Customer With All Addresses");
		query1.addActionListener(new FindOrder());
		query2.addActionListener(new FindDeliveryMan());
		mainPanel.add(customer);
		mainPanel.add(l1);
		mainPanel.add(l2);
		mainPanel.add(query1);
		mainPanel.add(query2);
		mainPanel.add(query3);
		mainPanel.add(query4);
		mainPanel.add(query5);
		mainPanel.add(l3);
		mainPanel.add(employee);
		mainPanel.add(l4);
		mainPanel.add(l5);
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
