package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IFieldService;

@Controller
@RequestMapping("/fields")
public class FieldsController {

	@Resource
	IFieldService fieldService;

	@RequestMapping("/getFieldsStatus.do")
	@ResponseBody
	public List<Integer> getFieldsStatus() {
		List<Integer> list;
		list = fieldService.getFieldsStatus();
		return list;
	}

	@RequestMapping("/getFieldDetail.do")
	@ResponseBody
	public Result getFieldDetail(String whichField) {
		if (whichField.trim().equals("1")) {
			return new Result(fieldService.getField1Detail());
		}
		if (whichField.trim().equals("2")) {
			return new Result(fieldService.getField2Detail());
		}
		if (whichField.trim().equals("3")) {
			return new Result(fieldService.getField3Detail());
		}
		if (whichField.trim().equals("4")) {
			return new Result(fieldService.getField4Detail());
		}
		return new Result("≤È’“ ß∞‹");
	}

	@RequestMapping("/changeField1.do")
	@ResponseBody
	public Result changeField1(String fieldId, int fieldStatus, int coachId,
			String startTime, String finishTime) {
		try {
			int n = fieldService.changeField1(fieldId, fieldStatus, coachId,
					startTime, finishTime);
			return new Result(n + "");

		} catch (Exception e) {
			return new Result(e);
		}
	}
	@RequestMapping("/changeField2.do")
	@ResponseBody
	public Result changeField2(String fieldId, int fieldStatus, int coachId,
			String startTime, String finishTime) {
		try {
			int n = fieldService.changeField2(fieldId, fieldStatus, coachId,
					startTime, finishTime);
			return new Result(n + "");

		} catch (Exception e) {
			return new Result(e);
		}
	}
	@RequestMapping("/changeField3.do")
	@ResponseBody
	public Result changeField3(String fieldId, int fieldStatus, int coachId,
			String startTime, String finishTime) {
		try {
			int n = fieldService.changeField3(fieldId, fieldStatus, coachId,
					startTime, finishTime);
			return new Result(n + "");

		} catch (Exception e) {
			return new Result(e);
		}
	}
	@RequestMapping("/changeField4.do")
	@ResponseBody
	public Result changeField4(String fieldId, int fieldStatus, int coachId,
			String startTime, String finishTime) {
		try {
			int n = fieldService.changeField4(fieldId, fieldStatus, coachId,
					startTime, finishTime);
			return new Result(n + "");

		} catch (Exception e) {
			return new Result(e);
		}
	}
	
	@RequestMapping("/addField3.do")
	@ResponseBody
	public Result addField3(String fieldStatus, int coachId, String startTime, String finishTime) {
		try {
			fieldStatus = new String(fieldStatus.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int n=fieldService.addField3(fieldStatus, coachId, startTime, finishTime);
		return new Result(n+"");
	}
	
	@RequestMapping("/deleteField3.do")
	@ResponseBody
	public Result deleteField3(Integer fieldId) {
		int n=fieldService.deleteField3(fieldId);
		if(n==1)
			return new Result();
		return new Result(new Exception("…æ≥˝ ß∞‹"));
	}
	
	@RequestMapping("/getAllFieldId.do")
	@ResponseBody
	public Result getAllFieldId() {
		return new Result(1,"",fieldService.getAllFieldId());
	}
}
