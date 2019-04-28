package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.Enroll;
import entity.UserCoach;
import entity.UserLearner;
import service.ICoachService;
import service.IExcelService;
import service.ILearnerService;
import service.ex.NoCoachFoundException;
import service.ex.NoLearnerFoundException;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Resource
	ICoachService coachService;
	
	@Resource
	ILearnerService learnerService;
	
	@RequestMapping(value="/getCoaches.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Result getCoaches(){
		List<UserCoach> list=coachService.getCoaches();
		return new Result(list);
	}
	
	@RequestMapping(value="/getLearners.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Result getLearners(){
		List<UserLearner> list=learnerService.getLearners();
		if(list.isEmpty()) {
			return new Result(0,"没有学员",null);
		}else {
			return new Result(list);
		}
	}
	
	@RequestMapping("/getLearnerById.do")
	@ResponseBody
	public Result getLearnerById(String learnerId) {
		try {
			UserLearner userLearner=learnerService.getLearnerById(learnerId);
			return new Result(1,"",userLearner);
		}catch(NoLearnerFoundException e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/updateLearner.do")
	@ResponseBody
	public Result updateLearner(Integer learnerId, Integer learnStatus, String learnerName, Integer learnerAge, String learnerGender,
			String learnerBirthday, String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress, Integer presentSubject, String claimType,
			String beginDate, String finishDate) {
		try {
			learnerName=new String(learnerName.getBytes("ISO-8859-1"), "utf-8");
			learnerGender=new String(learnerGender.getBytes("ISO-8859-1"), "utf-8");
			learnerAddress=new String(learnerAddress.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(finishDate.equals(""))
			finishDate=null;
		System.out.println(learnerId+ learnStatus+ learnerName+ learnerAge+ learnerGender+ learnerBirthday+ learnerContact+ learnerEmail+ learnerIcard+ learnerWechat+ learnerQq+ learnerAddress+ presentSubject+ claimType+ beginDate+ finishDate);
		int n=learnerService.updateLearner(learnerId, learnStatus, learnerName, learnerAge, learnerGender, learnerBirthday, learnerContact, learnerEmail, learnerIcard, learnerWechat, learnerQq, learnerAddress, presentSubject, claimType, beginDate, finishDate);
		if(n==0) {
			return new Result(0,"更新失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
	
	@RequestMapping("/insertLearner.do")
	@ResponseBody
	public Result insertLeaner(Integer learnerId, Integer learnStatus, String learnerName, Integer learnerAge, String learnerGender,
			String learnerBirthday, String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress, Integer presentSubject, String claimType,
			String beginDate, String finishDate) {
		try {
			learnerName=new String(learnerName.getBytes("ISO-8859-1"), "utf-8");
			learnerGender=new String(learnerGender.getBytes("ISO-8859-1"), "utf-8");
			learnerAddress=new String(learnerAddress.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(finishDate.equals(""))
			finishDate=null;
		int n=learnerService.insertLearner(learnerId, learnStatus, learnerName, learnerAge, learnerGender, learnerBirthday, learnerContact, learnerEmail, learnerIcard, learnerWechat, learnerQq, learnerAddress, presentSubject, claimType, beginDate, finishDate);
		if(n==0) {
			return new Result(0,"更新失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
	
	@RequestMapping("/getCoachById.do")
	@ResponseBody
	public Result getCoachById(Integer coachId) {
		UserCoach userCoach;
		try {
			userCoach=coachService.getCoachById(coachId);
			return new Result(1,"",userCoach);
		}catch(NoCoachFoundException e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/insertCoach.do")
	@ResponseBody
	public Result insertCoach(Integer coachId, String coachName, Integer coachAge, String coachGender, String coachBirthday,String coachAddress, String coachContact, String coachIcard, String coachWechat, String beginTime) {
		try {
			coachName=new String(coachName.getBytes("ISO-8859-1"), "utf-8");
			coachGender=new String(coachGender.getBytes("ISO-8859-1"), "utf-8");
			coachAddress=new String(coachAddress.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int n=coachService.insertCoach(coachId, coachName, coachAge, coachGender, coachBirthday, coachAddress, coachContact, coachIcard, coachWechat, beginTime);
		if(n==0) {
			return new Result(0,"保存失败",null);
		}else {
			return new Result(1,"保存成功",null);
		}
	}
	
	@RequestMapping("/updateCoach.do")
	@ResponseBody
	public Result updateCoach(Integer coachId, String coachName, Integer coachAge, String coachGender, String coachBirthday,String coachAddress, String coachContact, String coachIcard, String coachWechat, String beginTime) {
		try {
			coachName=new String(coachName.getBytes("ISO-8859-1"), "utf-8");
			coachGender=new String(coachGender.getBytes("ISO-8859-1"), "utf-8");
			coachAddress=new String(coachAddress.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int n=coachService.updateCoach(coachId, coachName, coachAge, coachGender, coachBirthday, coachAddress, coachContact, coachIcard, coachWechat, beginTime);
		if(n==0) {
			return new Result(0,"保存失败",null);
		}else {
			return new Result(1,"保存成功",null);
		}
	}
	
	@Resource
	 IExcelService excelService;
	
	@RequestMapping("/uploadExcel.do")
	public ModelAndView DoExcel(@RequestParam(value="file_excel") MultipartFile file,HttpServletRequest request) {
		String readResult =null;
		try {
			readResult = excelService.readExcelFile(file);
			System.out.println("canshu :"+readResult);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("upload falure");
		}
		return new ModelAndView("redirect:/enroll.jsp");
	}
	
	@RequestMapping("/getAllEnroll.do")
	@ResponseBody
	public Result getAllEnroll() {
		List<Enroll> list=learnerService.getAllEnroll();
		return new Result(list);
	}
}
