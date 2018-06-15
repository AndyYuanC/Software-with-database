package model;

public class Contains {

	private String description;

	private Integer customerId;

	private Integer OrderNo;

	public Contains(String description, Integer customerId, Integer orderNo) {
		super();
		this.description = description;
		this.customerId = customerId;
		OrderNo = orderNo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getOrderNo() {
		return OrderNo;
	}

	public void setOrderNo(Integer orderNo) {
		OrderNo = orderNo;
	}
}
