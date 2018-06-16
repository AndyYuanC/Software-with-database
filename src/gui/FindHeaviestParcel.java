package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

import app.ParcelOwnsSql;

public class FindHeaviestParcel implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		Double heaviestParcel = ParcelOwnsSql.findMaxWeight();
		JOptionPane.showMessageDialog(null, "The heaviest parcel weighs: " + heaviestParcel + " kg", "Error",
				JOptionPane.INFORMATION_MESSAGE);
	}

}
