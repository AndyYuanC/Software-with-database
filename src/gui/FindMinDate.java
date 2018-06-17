package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;

public class FindMinDate implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		int minDate = 0;
		String DeliveryMethod = "";
		boolean valid = false;
		
		while(!valid) {
				Object[] possibilities = {"Regular", "Express", "Priority"};
				DeliveryMethod = (String)JOptionPane.showInputDialog(null, "Choose one of the Delivery Method", "Find Minimum Date",JOptionPane.PLAIN_MESSAGE,null, possibilities,"Regular");
				if(DeliveryMethod != null&&(DeliveryMethod.equals("Express")||DeliveryMethod.equals("Regular")||DeliveryMethod.equals("Priority"))) {
					valid = true;
					JOptionPane.showMessageDialog(null, "The Min Date of the" + DeliveryMethod + " delivery method is: " + minDate + " day(s)", "Error",							JOptionPane.INFORMATION_MESSAGE);
			}else {
				JOptionPane.showMessageDialog(null, "Enter The Valid Delivery Method (Express, Regular or Priority):", "Error",
						JOptionPane.INFORMATION_MESSAGE);
			}
		}
	}

}
