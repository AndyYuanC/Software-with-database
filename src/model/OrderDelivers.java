package model;

import java.util.Date;

public class OrderDelivers {

	private Integer orderNo;

	private String deliveryMethod;

	private String reciever;

	private Date startDate;

	private Date dueDate;

	private String address;

	private Integer employeeId;

	public OrderDelivers(Integer orderNo, String deliveryMethod, String reciever, Date startDate, Date dueDate,
			String address, Integer employeeId) {
		super();
		this.orderNo = orderNo;
		this.deliveryMethod = deliveryMethod;
		this.reciever = reciever;
		this.startDate = startDate;
		this.dueDate = dueDate;
		this.address = address;
		this.employeeId = employeeId;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public String getDeliveryMethod() {
		return deliveryMethod;
	}

	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

}
