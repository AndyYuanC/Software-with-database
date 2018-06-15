package model;

public class ParcelOwns {

	private Double weight;

	private Integer volume;

	private String description;

	private Integer customerId;

	public ParcelOwns(Double weight, Integer volume, String description, Integer customerId) {
		super();
		this.weight = weight;
		this.volume = volume;
		this.description = description;
		this.customerId = customerId;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
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

}
