package model;

import java.util.Date;

public class OrderDelivers {

	private Integer orderNo;

	private String deliveryMethod;

	private String reciever;

	private Date startDate;

	private Integer deliveryDays;

	private String address;

	private Integer employeeId;

	public OrderDelivers(Integer orderNo, String deliveryMethod, String reciever, Date startDate, Integer deliveryDays,
			String address, Integer employeeId) {
		super();
		this.orderNo = orderNo;
		this.deliveryMethod = deliveryMethod;
		this.reciever = reciever;
		this.startDate = startDate;
		this.deliveryDays = deliveryDays;
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

	public Integer getDeliveryDays() {
		return deliveryDays;
	}

	public void setDeliveryDays(Integer deliveryDays) {
		this.deliveryDays = deliveryDays;
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
