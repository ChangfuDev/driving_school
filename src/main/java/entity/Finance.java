package entity;

import java.io.Serializable;

public class Finance implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int finanId;
	private String reimPerson;
	private float finanAmount;
	private String finanDescri;
	private String finanDate;

	public Finance() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public Finance(int finanId, String reimPerson, float finanAmount, String finanDescri,
			String finanDate) {
		super();
		this.finanId = finanId;
		this.reimPerson = reimPerson;
		this.finanAmount = finanAmount;
		this.finanDescri = finanDescri;
		this.finanDate = finanDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + finanId;
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
		Finance other = (Finance) obj;
		if (finanId != other.finanId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Finance [finanId=" + finanId + ", reimPerson=" + reimPerson + ", finanAmount=" + finanAmount + ", finanDescri=" + finanDescri + ", finanDate=" + finanDate + "]";
	}

	public int getFinanId() {
		return finanId;
	}

	public void setFinanId(int finanId) {
		this.finanId = finanId;
	}

	public String getReimPerson() {
		return reimPerson;
	}

	public void setReimPerson(String reimPerson) {
		this.reimPerson = reimPerson;
	}

	public float getFinanAmount() {
		return finanAmount;
	}

	public void setFinanAmount(float finanAmount) {
		this.finanAmount = finanAmount;
	}

	public String getFinanDescri() {
		return finanDescri;
	}

	public void setFinanDescri(String finanDescri) {
		this.finanDescri = finanDescri;
	}

	public String getFinanDate() {
		return finanDate;
	}

	public void setFinanDate(String finanDate) {
		this.finanDate = finanDate;
	}

}
