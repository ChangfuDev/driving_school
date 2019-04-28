package entity;

import java.io.Serializable;

public class CarReservation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int reserId;
	private int learnerId;
	private int coachId;
	private int reserSub;
	private String reserDate;
	private String reserContact;
	private String reserEmail;
	private String coachName;
	private String learnerName;
	private String reserField;
	private int isChecked;
	public int getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(int isChecked) {
		this.isChecked = isChecked;
	}
	public CarReservation(int reserId, int learnerId, int coachId, int reserSub,
			String reserDate, String reserContact, String reserEmail,
			String coachName, String learnerName, String reserField,
			int isChecked) {
		super();
		this.reserId = reserId;
		this.learnerId = learnerId;
		this.coachId = coachId;
		this.reserSub = reserSub;
		this.reserDate = reserDate;
		this.reserContact = reserContact;
		this.reserEmail = reserEmail;
		this.coachName = coachName;
		this.learnerName = learnerName;
		this.reserField = reserField;
		this.isChecked = isChecked;
	}
	public CarReservation() {
		super();
		// TODO 自动生成的构造函数存根
	}

	@Override
	public String toString() {
		return "CarReservation [reserId=" + reserId + ", learnerId=" + learnerId
				+ ", coachId=" + coachId + ", reserSub=" + reserSub
				+ ", reserDate=" + reserDate + ", reserContact=" + reserContact
				+ ", reserEmail=" + reserEmail + ", coachName=" + coachName
				+ ", learnerName=" + learnerName + ", reserField=" + reserField
				+ ", isChecked=" + isChecked + "]";
	}
	public int getReserId() {
		return reserId;
	}
	public void setReserId(int reserId) {
		this.reserId = reserId;
	}
	public int getLearnerId() {
		return learnerId;
	}
	public void setLearnerId(int learnerId) {
		this.learnerId = learnerId;
	}
	public int getCoachId() {
		return coachId;
	}
	public void setCoachId(int coachId) {
		this.coachId = coachId;
	}
	public int getReserSub() {
		return reserSub;
	}
	public void setReserSub(int reserSub) {
		this.reserSub = reserSub;
	}
	public String getReserDate() {
		return reserDate;
	}
	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}
	public String getReserContact() {
		return reserContact;
	}
	public void setReserContact(String reserContact) {
		this.reserContact = reserContact;
	}
	public String getReserEmail() {
		return reserEmail;
	}
	public void setReserEmail(String reserEmail) {
		this.reserEmail = reserEmail;
	}
	public String getCoachName() {
		return coachName;
	}
	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	public String getLearnerName() {
		return learnerName;
	}
	public void setLearnerName(String learnerName) {
		this.learnerName = learnerName;
	}
	public String getReserField() {
		return reserField;
	}
	public void setReserField(String reserField) {
		this.reserField = reserField;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
