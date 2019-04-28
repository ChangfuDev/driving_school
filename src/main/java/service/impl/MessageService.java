package service.impl;

import org.springframework.stereotype.Service;

import mail.Mail;
import service.IMessageService;

@Service
public class MessageService implements IMessageService {

	@Override
	public void sendMail(String senderAddress, String recipientAddress,
			String senderAccount, String senderPassword, String subject,
			String content) throws Exception {
		Mail mail=new Mail(senderAddress, recipientAddress, senderAccount, senderPassword);
		mail.sendEmail(subject, content);
	}

}
