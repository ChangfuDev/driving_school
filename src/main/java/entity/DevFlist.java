package entity;

import java.io.Serializable;

public class DevFlist implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int flistId;
	private String flistName;
	private int devId;
	private float price;
	private int count;
	private int inOrOut;
	private String pS;
	private String flistTime;
	private String supplier;

	public DevFlist() {
		super();
		// TODO 自动生成的构造函数存根
	}



	public String getFlistName() {
		return flistName;
	}



	public void setFlistName(String flistName) {
		this.flistName = flistName;
	}



	public DevFlist(int flistId, String flistName, int devId, float price,
			int count, int inOrOut, String pS, String flistTime,
			String supplier) {
		super();
		this.flistId = flistId;
		this.flistName = flistName;
		this.devId = devId;
		this.price = price;
		this.count = count;
		this.inOrOut = inOrOut;
		this.pS = pS;
		this.flistTime = flistTime;
		this.supplier = supplier;
	}



	@Override
	public String toString() {
		return "DevFlist [flistId=" + flistId + ", devId=" + devId + ", price="
				+ price + ", count=" + count + ", inOrOut=" + inOrOut + ", pS="
				+ pS + ", flistTime=" + flistTime + ", supplier=" + supplier
				+ "]";
	}

	public int getFlistId() {
		return flistId;
	}

	public void setFlistId(int flistId) {
		this.flistId = flistId;
	}

	public int getDevId() {
		return devId;
	}

	public void setDevId(int devId) {
		this.devId = devId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getInOrOut() {
		return inOrOut;
	}

	public void setInOrOut(int inOrOut) {
		this.inOrOut = inOrOut;
	}

	public String getpS() {
		return pS;
	}

	public void setpS(String pS) {
		this.pS = pS;
	}

	public String getFlistTime() {
		return flistTime;
	}

	public void setFlistTime(String flistTime) {
		this.flistTime = flistTime;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + flistId;
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
		DevFlist other = (DevFlist) obj;
		if (flistId != other.flistId)
			return false;
		return true;
	}
	

}