package controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IFinanceService;

@RequestMapping("/finance")
@Controller
public class FinanceController {

	@Resource
	IFinanceService financeService;
	
	@RequestMapping("/getAllFinance.do")
	@ResponseBody
	public Result getAllFinance() {
		return new Result(financeService.getAllFinance());
	}
	
	@RequestMapping("deleteFinanceById.do")
	@ResponseBody
	public Result deleteFinanceById(Integer finanId) {
		int n=financeService.deleteFinanceById(finanId);
		if(n==0) {
			return new Result(0,"删除失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
	
	
	@RequestMapping("/addNewFinance.do")
	@ResponseBody
	public Result addNewFinance( String reimPerson, float finanAmount, String finanDescri,
			String finanDate) {
		try {
			reimPerson = new String(reimPerson.getBytes("ISO-8859-1"), "utf-8");
			finanDescri = new String(finanDescri.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		int n=financeService.addNewFinance(reimPerson, finanAmount, finanDescri, finanDate);
		if(n==0) {
			return new Result(0,"添加失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
	
	@RequestMapping("/getIncomeInPeriod.do")
	@ResponseBody
	public Result getIncomeInPeriod(String startTime,String endTime) {
		float n=financeService.getIncomeInPeriod(startTime, endTime);
		return new Result(n);
	}
	
	@RequestMapping("/getOutcomeInPeriod.do")
	@ResponseBody
	public Result getOutcomeInPeriod(String startTime,String endTime) {
		float n=financeService.getOutcomeInPeriod(startTime, endTime);
		return new Result(n);
	}
	
	@RequestMapping("/getProfitInPeriod.do")
	@ResponseBody
	public Result getProfitInPeriod(String startTime,String endTime) {
		float n=financeService.getProfitInPeriod(startTime, endTime);
		return new Result(n);
	}
	
	@RequestMapping("/getIncomeFinance.do")
	@ResponseBody
	public Result getIncomeFinance(String startTime,String endTime) {
		return new Result(financeService.getIncomeFinance(startTime,endTime));
	}
	
	@RequestMapping("/getOutcomeFinance.do")
	@ResponseBody
	public Result getOutcomeFinance(String startTime,String endTime) {
		return new Result(financeService.getOutcomeFinance(startTime,endTime));
	}
	
	@RequestMapping("/getProfitFinance.do")
	@ResponseBody
	public Result getProfitFinance(String startTime,String endTime) {
		return new Result(financeService.getProfitFinance(startTime,endTime));
	}
}
