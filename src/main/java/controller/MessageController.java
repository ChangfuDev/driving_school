package controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IMessageService;

@RequestMapping("/message")
@Controller
public class MessageController {

	@Resource
	IMessageService messageService;
	
	@RequestMapping("/sendMail.do")
	@ResponseBody
	public Result sendMail(String senderAddress, String recipientAddress,String senderAccount, String senderPassword,String subject,String content) {
		try {
			subject=new String(subject.getBytes("ISO-8859-1"), "utf-8");
			content=new String(content.getBytes("ISO-8859-1"), "utf-8");
			System.out.println(content);
			messageService.sendMail(senderAddress, recipientAddress, senderAccount, senderPassword, subject, content);
			return new Result(1,"·¢ËÍ³É¹¦!",null);
		}catch(Exception e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
}
