package entity;

import java.io.Serializable;

public class Field3 implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fieldId;
	private String fieldSection;
	private int coachId;
	private String startTime;
	private String finishTime;

	public Field3() {
		super();
	}

	public Field3(String fieldId, String fieldSection, int coachId, String startTime, String finishTime) {
		super();
		this.fieldId = fieldId;
		this.fieldSection = fieldSection;
		this.coachId = coachId;
		this.startTime = startTime;
		this.finishTime = finishTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fieldId == null) ? 0 : fieldId.hashCode());
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
		Field3 other = (Field3) obj;
		if (fieldId == null) {
			if (other.fieldId != null)
				return false;
		} else if (!fieldId.equals(other.fieldId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Field3 [fieldId=" + fieldId + ", fieldSection=" + fieldSection + ", coachId=" + coachId + ", startTime="
				+ startTime + ", finishTime=" + finishTime + "]";
	}

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public String getFieldSection() {
		return fieldSection;
	}

	public void setFieldSection(String fieldSection) {
		this.fieldSection = fieldSection;
	}

	public int getCoachId() {
		return coachId;
	}

	public void setCoachId(int coachId) {
		this.coachId = coachId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

}
