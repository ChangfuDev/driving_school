package entity;

import java.io.Serializable;

public class Admin implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5723575265370284591L;
	private String adminId;
	private String adminPwd;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String adminId, String adminPwd) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	@Override
	public String toString() {
		return "admin [adminId=" + adminId + ", adminPwd=" + adminPwd + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adminId == null) ? 0 : adminId.hashCode());
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
		Admin other = (Admin) obj;
		if (adminId == null) {
			if (other.adminId != null)
				return false;
		} else if (!adminId.equals(other.adminId))
			return false;
		return true;
	}
	
}
