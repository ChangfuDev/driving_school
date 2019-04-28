package entity;

import java.io.Serializable;

public class UseCar implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int useId;
	private int carId;
	private int coachId;
	private String useTime;
	private String coachName;

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public UseCar(int useId, int carId, int coachId, String useTime,
			String coachName) {
		super();
		this.useId = useId;
		this.carId = carId;
		this.coachId = coachId;
		this.useTime = useTime;
		this.coachName = coachName;
	}

	public UseCar() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public UseCar(int useId, int carId, int coachId, String useTime) {
		super();
		this.useId = useId;
		this.carId = carId;
		this.coachId = coachId;
		this.useTime = useTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + useId;
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
		UseCar other = (UseCar) obj;
		if (useId != other.useId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UseCar [useId=" + useId + ", carId=" + carId + ", coachId="
				+ coachId + ", useTime=" + useTime + ", coachName=" + coachName
				+ "]";
	}

	public int getUseId() {
		return useId;
	}

	public void setUseId(int useId) {
		this.useId = useId;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public int getCoachId() {
		return coachId;
	}

	public void setCoachId(int coachId) {
		this.coachId = coachId;
	}

	public String getUseTime() {
		return useTime;
	}

	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

}
