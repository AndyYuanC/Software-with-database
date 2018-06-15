package model;

public class Branch {

	private Integer branchId;

	private String address;

	private String phoneNo;

	public Branch(Integer branchId, String address, String phoneNumber) {
		super();
		this.branchId = branchId;
		this.address = address;
		this.phoneNo = phoneNumber;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNo;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNo = phoneNumber;
	}
}
