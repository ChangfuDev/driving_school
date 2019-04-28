package entity;

import java.io.Serializable;

public class UserCoach implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int coachId;
	private String coachName;
	private int coachAge;
	private String coachGender;
	private String coachBirthday;
	private String coachAddress;
	private String coachContact;
	private String coachIcard;
	private String coachWechat;
	private String beginTime;

	public UserCoach() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public UserCoach(int coachId, String coachName, int coachAge, String coachGender, String coachBirthday,
			String coachAddress, String coachContact, String coachIcard, String coachWechat, String beginTime) {
		super();
		this.coachId = coachId;
		this.coachName = coachName;
		this.coachAge = coachAge;
		this.coachGender = coachGender;
		this.coachBirthday = coachBirthday;
		this.coachAddress = coachAddress;
		this.coachContact = coachContact;
		this.coachIcard = coachIcard;
		this.coachWechat = coachWechat;
		this.beginTime = beginTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + coachId;
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
		UserCoach other = (UserCoach) obj;
		if (coachId != other.coachId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserCoach [coachId=" + coachId + ", coachName=" + coachName + ", coachAge=" + coachAge
				+ ", coachGender=" + coachGender + ", coachBirthday=" + coachBirthday + ", coachAddress=" + coachAddress
				+ ", coachContact=" + coachContact + ", coachIcard=" + coachIcard + ", coachWechat=" + coachWechat
				+ ", beginTime=" + beginTime + "]";
	}

	public int getCoachId() {
		return coachId;
	}

	public void setCoachId(int coachId) {
		this.coachId = coachId;
	}

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public int getCoachAge() {
		return coachAge;
	}

	public void setCoachAge(int coachAge) {
		this.coachAge = coachAge;
	}

	public String getCoachGender() {
		return coachGender;
	}

	public void setCoachGender(String coachGender) {
		this.coachGender = coachGender;
	}

	public String getCoachBirthday() {
		return coachBirthday;
	}

	public void setCoachBirthday(String coachBirthday) {
		this.coachBirthday = coachBirthday;
	}

	public String getCoachAddress() {
		return coachAddress;
	}

	public void setCoachAddress(String coachAddress) {
		this.coachAddress = coachAddress;
	}

	public String getCoachContact() {
		return coachContact;
	}

	public void setCoachContact(String coachContact) {
		this.coachContact = coachContact;
	}

	public String getCoachIcard() {
		return coachIcard;
	}

	public void setCoachIcard(String coachIcard) {
		this.coachIcard = coachIcard;
	}

	public String getCoachWechat() {
		return coachWechat;
	}

	public void setCoachWechat(String coachWechat) {
		this.coachWechat = coachWechat;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

}
