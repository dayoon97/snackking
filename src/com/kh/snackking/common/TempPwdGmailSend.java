package com.kh.snackking.common;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class TempPwdGmailSend {
	
	private static String TempPwd() {
		 String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		 
		 String temPwd = uuid.substring(0,10);
		 
		 return temPwd;
	}
	
	public static void gmailSend(String email) {
		
		String user = "snackking07@gmail.com";
		String password = "snackking123!@#";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
		
		try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            // 수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            // 제목
            message.setSubject("[SNACKKING] 임시 비밀번호입니다.");

            // 내용
            message.setText("임시 비밀번호 입니다. \n " + TempPwd());

            // 이메일 보내기
            Transport.send(message); ////전송
            System.out.println("이메일 전송 성공");
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
		
		
	}
	
}
