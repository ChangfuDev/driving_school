package service;

import service.ex.AdminHasExistedException;
import service.ex.RegisterAdminFailureException;
import service.ex.ThisAdminNotExistException;

public interface IAdminService {
	Boolean login(String adminId,String adminPwd) throws ThisAdminNotExistException;
	void register(String adminId,String adminPwd) throws AdminHasExistedException,RegisterAdminFailureException;
}
