package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JOptionPane;

import app.EmployeeSql;
import model.EmployeeWorks;

public class FindDeliveryMan implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		String userEnter = JOptionPane.showInputDialog(null, "Enter The Order #");

		int orderId;
		try {
			orderId = Integer.parseInt(userEnter);
		} catch (NumberFormatException ex) {
			JOptionPane.showMessageDialog(null, "Please enter a valid integer", "Delivery Man",
					JOptionPane.INFORMATION_MESSAGE);
			return;
		}

		List<EmployeeWorks> employees = EmployeeSql.selectEmployeeNameFromOrderId(orderId);

		if (employees.size() != 0) {
			JOptionPane.showMessageDialog(null,
					"The Delivery Man for order#: " + orderId + " is " + employees.get(0).getEmployeeName(), "Error",
					JOptionPane.INFORMATION_MESSAGE);
		} else {
			JOptionPane.showMessageDialog(null, "Cannot find the Delivery Man with this Order#: " + orderId, "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}

}
