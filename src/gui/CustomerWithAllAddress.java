package gui;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;

import app.CustomerSql;
import model.Customer;

public class CustomerWithAllAddress extends JFrame implements ActionListener {

	private static final String[] COLUMN_NAMES = { "Customer ID", "Name", "Phone", "Gender","Birthday"};
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		List<Customer> customers = CustomerSql.selectCustomerWithAllAddress();
		
		setLayout(new FlowLayout());
		
		if(!customers.isEmpty()) {
			String[][] data = new String[customers.size()][5];
			for(int i = 0; i < customers.size(); i++) {
				data[i][0] = ""+customers.get(i).getCustomerId();
				data[i][1] = customers.get(i).getName();
				data[i][2] = customers.get(i).getPhone();
				data[i][3] = customers.get(i).getGender();
				data[i][4] = ""+customers.get(i).getBirthDate();
			}
			JTable table = new JTable(data, COLUMN_NAMES);
			table.setPreferredScrollableViewportSize(new Dimension(1024, 768));
			table.setFillsViewportHeight(true);

			JScrollPane scrollPane = new JScrollPane(table);
			setVisible(true);
			setTitle("Find Order");
			setSize(new Dimension(1024, 768));
			setResizable(false);
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			add(scrollPane);
		}else {
			JOptionPane.showMessageDialog(null, "There is no customer with all addresses", "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}

}
