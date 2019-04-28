package service;

public interface IMessageService {
	void sendMail(String senderAddress, String recipientAddress,String senderAccount, String senderPassword,String subject,String content) throws Exception;
}
