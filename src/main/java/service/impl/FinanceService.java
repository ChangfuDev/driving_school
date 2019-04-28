package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Finance;
import mapper.FinanceMapper;
import service.IFinanceService;

@Service
public class FinanceService implements IFinanceService {

	@Resource
	FinanceMapper financeMapper;
	
	
	@Override
	public List<Finance> getAllFinance() {
		List<Finance> list=financeMapper.getAllFinance();
		return list;
	}


	@Override
	public int deleteFinanceById(Integer finanId) {
		int n=financeMapper.deleteFinanceById(finanId);
		return n;
	}


	@Override
	public int addNewFinance(String reimPerson, float finanAmount,
			String finanDescri, String finanDate) {
		Finance finance=new Finance(0, reimPerson, finanAmount, finanDescri, finanDate);
		int n=financeMapper.addNewFinance(finance);
		return n;
	}


	@Override
	public float getIncomeInPeriod(String startTime, String endTime) {
		float n=financeMapper.getIncomeInPeriod(startTime, endTime);
		return n;
	}


	@Override
	public float getOutcomeInPeriod(String startTime, String endTime) {
		float n=financeMapper.getOutcomeInPeriod(startTime, endTime);
		return n;
	}


	@Override
	public float getProfitInPeriod(String startTime, String endTime) {
		float n=financeMapper.getProfitInPeriod(startTime, endTime);
		return n;
	}


	@Override
	public List<Finance> getIncomeFinance(String startTime, String endTime) {
		List<Finance> list=financeMapper.getIncomeFinance(startTime, endTime);
		return list;
	}


	@Override
	public List<Finance> getOutcomeFinance(String startTime, String endTime) {
		List<Finance> list=financeMapper.getOutcomeFinance(startTime, endTime);
		return list;
	}


	@Override
	public List<Finance> getProfitFinance(String startTime, String endTime) {
		List<Finance> list=financeMapper.getProfitFinance(startTime, endTime);
		return list;
	}

}
