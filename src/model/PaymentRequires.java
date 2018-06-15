package model;

import java.util.Date;

public class PaymentRequires {

	private Integer recieptNo;

	private Double price;

	private Date paymentDate;

	private Integer orderNo;

	public PaymentRequires(Integer recieptNo, Double price, Date paymentDate, Integer orderNo) {
		super();
		this.recieptNo = recieptNo;
		this.price = price;
		this.paymentDate = paymentDate;
		this.orderNo = orderNo;
	}

	public Integer getRecieptNo() {
		return recieptNo;
	}

	public void setRecieptNo(Integer recieptNo) {
		this.recieptNo = recieptNo;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}
