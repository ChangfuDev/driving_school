package entity;

import java.io.Serializable;

public class Device implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int devId;
	private String devName;
	private int devPrice;

	public Device() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public Device(int devId, String devName, int devPrice) {
		super();
		this.devId = devId;
		this.devName = devName;
		this.devPrice = devPrice;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + devId;
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
		Device other = (Device) obj;
		if (devId != other.devId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Device [devId=" + devId + ", devName=" + devName + ", devPrice=" + devPrice + "]";
	}

	public int getDevId() {
		return devId;
	}

	public void setDevId(int devId) {
		this.devId = devId;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public int getDevPrice() {
		return devPrice;
	}

	public void setDevPrice(int devPrice) {
		this.devPrice = devPrice;
	}

}
