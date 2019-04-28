package entity;

import java.io.Serializable;

public class DevStore implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer devId;
	private String devName;
	private int count;
	private float price;
	public DevStore(Integer devId, String devName, int count, float price) {
		super();
		this.devId = devId;
		this.devName = devName;
		this.count = count;
		this.price = price;
	}
	public DevStore() {
		super();
		// TODO 自动生成的构造函数存根
	}
	@Override
	public String toString() {
		return "DevStore [devId=" + devId + ", devName=" + devName + ", count="
				+ count + ", price=" + price + "]";
	}
	public Integer getDevId() {
		return devId;
	}
	public void setDevId(Integer devId) {
		this.devId = devId;
	}
	public String getDevName() {
		return devName;
	}
	public void setDevName(String devName) {
		this.devName = devName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
}
