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

import app.OrderSql;
import model.OrderDelivers;

@SuppressWarnings("serial")
public class FindOrder extends JFrame implements ActionListener {

	private static final String[] COLUMN_NAMES = { "Order#", "Delivery Method", "Start Date", "Days to deliver" };

	@Override
	public void actionPerformed(ActionEvent e) {
		String userEnter = JOptionPane.showInputDialog(null, "Enter The Order #");
		int orderId;

		try {
			orderId = Integer.parseInt(userEnter);
		} catch (NumberFormatException ex) {
			JOptionPane.showMessageDialog(null, "Please enter a valid integer", "Error",
					JOptionPane.INFORMATION_MESSAGE);
			return;
		}

		List<OrderDelivers> orders = OrderSql.selectOrderFromId(orderId);

		setLayout(new FlowLayout());

		String[][] data = new String[orders.size()][4];

		if (orders.size() != 0) {
			for (int i = 0; i < orders.size(); i++) {
				data[i][0] = "" + orders.get(i).getOrderNo();
				data[i][1] = orders.get(i).getDeliveryMethod();
				data[i][2] = "" + orders.get(i).getStartDate();
				data[i][3] = "" + orders.get(i).getDeliveryDays();
			}
			JTable table = new JTable(data, COLUMN_NAMES);
			table.setPreferredScrollableViewportSize(new Dimension(1024, 768));
			table.setFillsViewportHeight(true);

			JScrollPane scrollPane = new JScrollPane(table);
			setVisible(true);
			setTitle("Find Order");
			setSize(new Dimension(1024, 768));
			setResizable(false);
			setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
			add(scrollPane);
		} else {
			JOptionPane.showMessageDialog(null, "Cannot find the Order with this Order#: " + orderId, "Error",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}
}
