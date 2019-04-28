package entity;

import java.io.Serializable;

public class UserLearner implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int learnerId;
	private int learnStatus;
	private String learnerName;
	private int learnerAge;
	private String learnerGender;
	private String learnerBirthday;
	private String learnerContact;
	private String learnerEmail;
	private String learnerIcard;
	private String learnerWechat;
	private String learnerQq;
	private String learnerAddress;
	private int presentSubject;
	private String claimType;
	private String beginDate;
	private String finishDate;

	public UserLearner() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public UserLearner(int learnerId, int learnStatus, String learnerName, int learnerAge, String learnerGender,
			String learnerBirthday, String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress, int presentSubject, String claimType,
			String beginDate, String finishDate) {
		super();
		this.learnerId = learnerId;
		this.learnStatus = learnStatus;
		this.learnerName = learnerName;
		this.learnerAge = learnerAge;
		this.learnerGender = learnerGender;
		this.learnerBirthday = learnerBirthday;
		this.learnerContact = learnerContact;
		this.learnerEmail = learnerEmail;
		this.learnerIcard = learnerIcard;
		this.learnerWechat = learnerWechat;
		this.learnerQq = learnerQq;
		this.learnerAddress = learnerAddress;
		this.presentSubject = presentSubject;
		this.claimType = claimType;
		this.beginDate = beginDate;
		this.finishDate = finishDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + learnerId;
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
		UserLearner other = (UserLearner) obj;
		if (learnerId != other.learnerId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserLearner [learnerId=" + learnerId + ", learnStatus=" + learnStatus + ", learnerName=" + learnerName
				+ ", learnerAge=" + learnerAge + ", learnerGender=" + learnerGender + ", learnerBirthday="
				+ learnerBirthday + ", learnerContact=" + learnerContact + ", learnerEmail=" + learnerEmail
				+ ", learnerIcard=" + learnerIcard + ", learnerWechat=" + learnerWechat + ", learnerQq=" + learnerQq
				+ ", learnerAddress=" + learnerAddress + ", presentSubject=" + presentSubject + ", claimType="
				+ claimType + ", beginDate=" + beginDate + ", finishDate=" + finishDate + "]";
	}

	public int getLearnerId() {
		return learnerId;
	}

	public void setLearnerId(int learnerId) {
		this.learnerId = learnerId;
	}

	public int getLearnStatus() {
		return learnStatus;
	}

	public void setLearnStatus(int learnStatus) {
		this.learnStatus = learnStatus;
	}

	public String getLearnerName() {
		return learnerName;
	}

	public void setLearnerName(String learnerName) {
		this.learnerName = learnerName;
	}

	public int getLearnerAge() {
		return learnerAge;
	}

	public void setLearnerAge(int learnerAge) {
		this.learnerAge = learnerAge;
	}

	public String getLearnerGender() {
		return learnerGender;
	}

	public void setLearnerGender(String learnerGender) {
		this.learnerGender = learnerGender;
	}

	public String getLearnerBirthday() {
		return learnerBirthday;
	}

	public void setLearnerBirthday(String learnerBirthday) {
		this.learnerBirthday = learnerBirthday;
	}

	public String getLearnerContact() {
		return learnerContact;
	}

	public void setLearnerContact(String learnerContact) {
		this.learnerContact = learnerContact;
	}

	public String getLearnerEmail() {
		return learnerEmail;
	}

	public void setLearnerEmail(String learnerEmail) {
		this.learnerEmail = learnerEmail;
	}

	public String getLearnerIcard() {
		return learnerIcard;
	}

	public void setLearnerIcard(String learnerIcard) {
		this.learnerIcard = learnerIcard;
	}

	public String getLearnerWechat() {
		return learnerWechat;
	}

	public void setLearnerWechat(String learnerWechat) {
		this.learnerWechat = learnerWechat;
	}

	public String getLearnerQq() {
		return learnerQq;
	}

	public void setLearnerQq(String learnerQq) {
		this.learnerQq = learnerQq;
	}

	public String getLearnerAddress() {
		return learnerAddress;
	}

	public void setLearnerAddress(String learnerAddress) {
		this.learnerAddress = learnerAddress;
	}

	public int getPresentSubject() {
		return presentSubject;
	}

	public void setPresentSubject(int presentSubject) {
		this.presentSubject = presentSubject;
	}

	public String getClaimType() {
		return claimType;
	}

	public void setClaimType(String claimType) {
		this.claimType = claimType;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

}
