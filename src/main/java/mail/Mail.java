package mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	String senderAddress;
    String recipientAddress;
    String senderAccount;
    String senderPassword;
    String subject;
    String content;
    
	public Mail(String senderAddress, String recipientAddress,
			String senderAccount, String senderPassword) {
		super();
		this.senderAddress = senderAddress;
		this.recipientAddress = recipientAddress;
		this.senderAccount = senderAccount;
		this.senderPassword = senderPassword;
	}

	public void sendEmail(String subj,String cont) throws MessagingException {
		this.subject=subj;
		this.content=cont;
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.163.com");
        Session session = Session.getInstance(props);
        session.setDebug(true);
        Message msg = getMimeMessage(session);
        //4、根据session对象获取邮件传输对象Transport
        Transport transport = session.getTransport();
        transport.connect(senderAccount, senderPassword);
        transport.sendMessage(msg,msg.getAllRecipients());
         
        //transport.sendMessage(msg, new Address[]{new InternetAddress("xxx@qq.com")});
         
        transport.close();
	}

	private MimeMessage getMimeMessage(Session session) throws AddressException, MessagingException {
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(senderAddress));
        /**
         * MimeMessage.RecipientType.TO:发送
         * MimeMessage.RecipientType.CC：抄送
         * MimeMessage.RecipientType.BCC：密送
         */
        msg.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(recipientAddress));
        msg.setSubject(subject,"UTF-8");
        msg.setContent(content, "text/html;charset=UTF-8");
        msg.setSentDate(new Date());
         
        return msg;
	}
}
