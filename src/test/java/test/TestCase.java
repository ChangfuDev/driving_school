package test;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.DigestUtils;

import com.sun.mail.smtp.DigestMD5;

import service.impl.CarReservationService;
import service.impl.FinanceService;
import service.impl.LearnerService;

public class TestCase {

	service.IFinanceService service;
	@Test
	public void Test() {
		/*ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml");
		service=ctx.getBean("financeService",FinanceService.class);
		//service.impl.FieldService service=new FieldService();
		//List<Integer> list=service.getFieldsStatus();
		//System.out.println(list);
		//int n=mapper.getField1Status();
		//System.out.println(n);
		Object n=service.getProfitInPeriod("2017-02-15", "2017-02-22");
		System.out.println(n);
		ctx.close();*/
		String salt="ja016";
		String pwd="123456";
		String md5Pwd=DigestUtils.md5DigestAsHex((pwd+salt).getBytes());
		System.out.println(md5Pwd);
	}
}
