package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IAdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Resource
	IAdminService adminService;
	
	@RequestMapping("/login.do")
	@ResponseBody
	public Result login(String adminId,String adminPwd,HttpSession session) {
		try {
			if(adminService.login(adminId, adminPwd)==Boolean.TRUE) {
				session.setAttribute("admin", adminId);
				return new Result(1,"",null);
			}else {
				return new Result(0,"µÇÂ½Ê§°Ü,ÃÜÂë´íÎó",null);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/register.do")
	@ResponseBody
	public Result register(String adminId,String adminPwd) {
		try {
			adminService.register(adminId, adminPwd);
			return new Result(1,"×¢²á³É¹¦",null);
		}catch(Exception e) {
			return new Result(e);
		}
	}
	
	@RequestMapping("/quit.do")
	@ResponseBody
	public Result quit(HttpSession session) {
		session.setAttribute("admin", null);
		return new Result(1,"",null);
	}
}
