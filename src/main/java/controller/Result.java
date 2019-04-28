package controller;

import java.io.Serializable;

public class Result implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final int SUCCESS=1;
	private static final int ERROR=0;
	private int state=SUCCESS;
	private String message="OK";
	private Object data =null;
	public Result() {
	}
	public Result(String successMessage) {
		state=SUCCESS;
		message=successMessage;
	}
	public Result(Object obj) {
		this(SUCCESS,null,obj);
	}
	public Result(Throwable e) {
		state=ERROR;
		message=e.getMessage();
	}
	public Result(int state, String message, Object data) {
		this.state = state;
		this.message = message;
		this.data = data;
	}
	@Override
	public String toString() {
		return "Result [state=" + state + ", message=" + message + ", data=" + data + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + state;
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
		Result other = (Result) obj;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (state != other.state)
			return false;
		return true;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
