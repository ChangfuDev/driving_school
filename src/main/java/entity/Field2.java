package entity;

import java.io.Serializable;

public class Field2 implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fieldId;
	private int fieldStatus;
	private int coachId;
	private String startTime;
	private String finishTime;

	public Field2() {
		super();
	}

	public Field2(String fieldId, int fieldStatus, int coachId, String startTime, String finishTime) {
		super();
		this.fieldId = fieldId;
		this.fieldStatus = fieldStatus;
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
		Field2 other = (Field2) obj;
		if (fieldId == null) {
			if (other.fieldId != null)
				return false;
		} else if (!fieldId.equals(other.fieldId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Field2 [fieldId=" + fieldId + ", fieldStatus=" + fieldStatus + ", coachId=" + coachId + ", startTime="
				+ startTime + ", finishTime=" + finishTime + "]";
	}

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public int getFieldStatus() {
		return fieldStatus;
	}

	public void setFieldStatus(int fieldStatus) {
		this.fieldStatus = fieldStatus;
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
