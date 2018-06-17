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

import app.AddressSql;
import model.Address;

@SuppressWarnings("serial")
public class PrintAllAddress extends JFrame implements ActionListener {

	private static final String[] COLUMN_NAMES = { "Unit_No", "Street_Name", "City", "Province", "Postal_Code",
			"Country" };

	@Override
	public void actionPerformed(ActionEvent e) {
		List<Address> address = AddressSql.selectAllAddress();

		setLayout(new FlowLayout());

		if (!address.isEmpty()) {
			String[][] data = new String[address.size()][6];
			for (int i = 0; i < address.size(); i++) {
				data[i][0] = "" + address.get(i).getUnitNo();
				data[i][1] = address.get(i).getStreetName();
				data[i][2] = address.get(i).getCity();
				data[i][3] = address.get(i).getProvince();
				data[i][4] = "" + address.get(i).getPostalCode();
				data[i][5] = address.get(i).getCountry();
			}
			JTable table = new JTable(data, COLUMN_NAMES);
			table.setPreferredScrollableViewportSize(new Dimension(1024, 768));
			table.setFillsViewportHeight(true);

			JScrollPane scrollPane = new JScrollPane(table);
			setVisible(true);
			setTitle("All Address in our system");
			setSize(new Dimension(1044, 768));
			setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
			add(scrollPane);
		} else {
			JOptionPane.showMessageDialog(null, "There is no address in our system", "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}

}
