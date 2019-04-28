package entity;

import java.io.Serializable;

public class Enroll implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer enId;
	private String enName;
	private String enIcard;
	private String enSub;
	private String enDate;
	public Enroll() {
		super();
		// TODO 自动生成的构造函数存根
	}
	public Enroll(String enName, String enIcard, String enSub,
			String enDate) {
		super();
		this.enId = 0;
		this.enName = enName;
		this.enIcard = enIcard;
		this.enSub = enSub;
		this.enDate = enDate;
	}
	@Override
	public String toString() {
		return "Enroll [enId=" + enId + ", enName=" + enName + ", enIcard="
				+ enIcard + ", enSub=" + enSub + ", enDate=" + enDate + "]";
	}
	public Integer getEnId() {
		return enId;
	}
	public void setEnId(Integer enId) {
		this.enId = enId;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getEnIcard() {
		return enIcard;
	}
	public void setEnIcard(String enIcard) {
		this.enIcard = enIcard;
	}
	public String getEnSub() {
		return enSub;
	}
	public void setEnSub(String enSub) {
		this.enSub = enSub;
	}
	public String getEnDate() {
		return enDate;
	}
	public void setEnDate(String enDate) {
		this.enDate = enDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((enId == null) ? 0 : enId.hashCode());
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
		Enroll other = (Enroll) obj;
		if (enId == null) {
			if (other.enId != null)
				return false;
		} else if (!enId.equals(other.enId))
			return false;
		return true;
	}
	
}
