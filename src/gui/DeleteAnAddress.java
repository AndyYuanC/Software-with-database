package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

import app.DeleteAddress;

public class DeleteAnAddress implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		int UnitNo;
		String userEnter = JOptionPane.showInputDialog(null, "Enter The Unit #");
		String StreetName = JOptionPane.showInputDialog(null, "Enter The Street Name");
		String city = JOptionPane.showInputDialog(null, "Enter The city");
		try {
			UnitNo = Integer.parseInt(userEnter);
		} catch (NumberFormatException ex) {
			JOptionPane.showMessageDialog(null, "Please enter a valid integer", "Error",
					JOptionPane.INFORMATION_MESSAGE);
			return;
		}
		if (DeleteAddress.DeleteSelectedAddress(UnitNo, StreetName, city) < 1) {
			JOptionPane.showMessageDialog(null, "Please enter a valid address", "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}else {
			JOptionPane.showMessageDialog(null, "Deleted Successfully, Address: " + UnitNo + " " + StreetName + " " + city);
		}
	}

}
