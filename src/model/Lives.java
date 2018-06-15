package model;

public class Lives {

	private Integer unitNo;

	private String streetName;

	private String city;

	private String customerId;

	public Lives(Integer unitNo, String streetName, String city, String customerId) {
		super();
		this.unitNo = unitNo;
		this.streetName = streetName;
		this.city = city;
		this.customerId = customerId;
	}

	public Integer getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(Integer unitNo) {
		this.unitNo = unitNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

}
