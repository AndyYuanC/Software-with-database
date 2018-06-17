package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

import app.OrderSql;

public class FindMaxDate implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		String DeliveryMethod = "";
		boolean valid = false;

		while (!valid) {
			Object[] possibilities = { "Standard", "Express", "Priority" };
			DeliveryMethod = (String) JOptionPane.showInputDialog(null, "Choose one of the Delivery Method",
					"Find Maximum Date", JOptionPane.PLAIN_MESSAGE, null, possibilities, "Standard");
			if (DeliveryMethod != null && (DeliveryMethod.equals("Express") || DeliveryMethod.equals("Standard")
					|| DeliveryMethod.equals("Priority"))) {
				valid = true;
				JOptionPane.showMessageDialog(null,
						"The Maximum Date of the " + DeliveryMethod + " delivery method is: "
								+ OrderSql.maxDaysDeliveryMethod(DeliveryMethod) + " day(s)",
						"Maximum Date", JOptionPane.INFORMATION_MESSAGE);
			} else {
				JOptionPane.showMessageDialog(null, "Enter The Valid Delivery Method (Express, Regular or Priority):",
						"Error", JOptionPane.INFORMATION_MESSAGE);
			}
		}
	}
}
