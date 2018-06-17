package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import app.CustomerSql;

public class UpdateGender implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		int CustomerID;
		String userEnter = JOptionPane.showInputDialog(null,"Enter The CustomerID");
		String Gender = JOptionPane.showInputDialog(null,"Enter The Gender");
		try {
			CustomerID = Integer.parseInt(userEnter);
		} catch (NumberFormatException ex) {
			JOptionPane.showMessageDialog(null, "Please enter a valid integer", "Error",
				JOptionPane.INFORMATION_MESSAGE);
			return;
		}
		
		try {
			CustomerSql.updateCustomerGender(CustomerID, Gender);
			JOptionPane.showMessageDialog(null, "Customer: " + CustomerID + " has been changed to new gender: " + Gender, "Error",
					JOptionPane.INFORMATION_MESSAGE);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			JOptionPane.showMessageDialog(null, "Cannot find the Customer: " + CustomerID, "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}

}
