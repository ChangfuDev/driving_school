package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import entity.Admin;
import mapper.AdminMapper;
import service.IAdminService;
import service.ex.AdminHasExistedException;
import service.ex.RegisterAdminFailureException;
import service.ex.ThisAdminNotExistException;

@Service
public class AdminService implements IAdminService {

	@Resource
	AdminMapper adminMapper;
	
	@Override
	public Boolean login(String adminId, String adminPwd) throws ThisAdminNotExistException {
		Admin admin=null;
		admin=adminMapper.getAdminById(adminId);
		if(admin!=null) {
			String salt="ja016";
			String pwd=DigestUtils.md5DigestAsHex((adminPwd+salt).getBytes());
			if(pwd.equals(admin.getAdminPwd())){
				return Boolean.TRUE;
			}else {
				return Boolean.FALSE;
			}
		}else {
			throw new ThisAdminNotExistException("不存在该管理员用户");
		}
	}

	@Override
	public void register(String adminId, String adminPwd)
			throws AdminHasExistedException, RegisterAdminFailureException {
		String salt="ja016";
		adminPwd=DigestUtils.md5DigestAsHex((adminPwd+salt).getBytes());
		Admin admin=new Admin(adminId, adminPwd);
		Admin admin2=adminMapper.getAdminById(adminId);
		if(admin==admin2) {
			throw new AdminHasExistedException("该用户已经存在");
		}
		int n=adminMapper.insertAdmin(admin);
		if(n==0) {
			throw new RegisterAdminFailureException("注册失败");
		}
		return ;
	}
	
}
