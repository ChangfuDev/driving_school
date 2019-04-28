package entity;

import java.io.Serializable;

public class RepairOrder implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int repId;
	private int carId;
	private String repName;
	private String repLocation;
	private String repTime;
	private int devId;

	public RepairOrder(int repId, int carId, String repName, String repLocation,
			String repTime, int devId) {
		super();
		this.repId = repId;
		this.carId = carId;
		this.repName = repName;
		this.repLocation = repLocation;
		this.repTime = repTime;
		this.devId = devId;
	}

	public RepairOrder() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public RepairOrder(int repId, int carId, String repName, String repLocation, String repTime) {
		super();
		this.repId = repId;
		this.carId = carId;
		this.repName = repName;
		this.repLocation = repLocation;
		this.repTime = repTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + repId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RepairOrder other = (RepairOrder) obj;
		if (repId != other.repId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RepairOrder [repId=" + repId + ", carId=" + carId + ", repName=" + repName + ", repLocation="
				+ repLocation + ", repTime=" + repTime + "]";
	}

	public int getRepId() {
		return repId;
	}

	public void setRepId(int repId) {
		this.repId = repId;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

	public String getRepLocation() {
		return repLocation;
	}

	public void setRepLocation(String repLocation) {
		this.repLocation = repLocation;
	}

	public String getRepTime() {
		return repTime;
	}

	public void setRepTime(String repTime) {
		this.repTime = repTime;
	}

	public int getDevId() {
		return devId;
	}

	public void setDevId(int devId) {
		this.devId = devId;
	}

}
