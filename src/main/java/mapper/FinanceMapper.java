package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Finance;

public interface FinanceMapper {
	List<Finance> getAllFinance();
	int deleteFinanceById(Integer finanId);
	int addNewFinance(Finance finance);
	float getIncomeInPeriod(@Param("startTime") String startTime,@Param("endTime") String endTime);
	float getOutcomeInPeriod(@Param("startTime") String startTime,@Param("endTime") String endTime);
	float getProfitInPeriod(@Param("startTime") String startTime,@Param("endTime") String endTime);
	List<Finance> getIncomeFinance(@Param("startTime") String startTime,@Param("endTime") String endTime);
	List<Finance> getOutcomeFinance(@Param("startTime") String startTime,@Param("endTime") String endTime);
	List<Finance> getProfitFinance(@Param("startTime") String startTime,@Param("endTime") String endTime);
}
