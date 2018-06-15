package model;

import java.util.Date;

public class EmployeeWorks {

	private Integer employeeId;

	private String employeeName;

	private Date birthDate;

	private String gender;

	private String sin;

	private String address;

	private Integer branchId;

	public EmployeeWorks(Integer employeeId, String employeeName, Date birthDate, String gender, String sin,
			String address, Integer branchId) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.sin = sin;
		this.address = address;
		this.branchId = branchId;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSin() {
		return sin;
	}

	public void setSin(String sin) {
		this.sin = sin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

}
