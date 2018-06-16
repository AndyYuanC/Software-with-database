package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

import app.ParcelOwnsSql;

public class FindLightestParcel implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		Double lightestParcel = ParcelOwnsSql.findMinWeight();
		JOptionPane.showMessageDialog(null, "The lightest parcel weighs: " + lightestParcel + " kg", "Error",
				JOptionPane.INFORMATION_MESSAGE);

	}

}
