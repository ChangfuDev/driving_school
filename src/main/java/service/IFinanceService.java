package service;

import java.util.List;

import entity.Finance;

public interface IFinanceService {
	List<Finance> getAllFinance();
	int deleteFinanceById(Integer finanId);
	int addNewFinance( String reimPerson, float finanAmount, String finanDescri,
			String finanDate);
	float getIncomeInPeriod(String startTime,String endTime);
	float getOutcomeInPeriod(String startTime,String endTime);
	float getProfitInPeriod(String startTime,String endTime);
	List<Finance> getIncomeFinance(String startTime,String endTime);
	List<Finance> getOutcomeFinance(String startTime,String endTime);
	List<Finance> getProfitFinance(String startTime,String endTime);
}
