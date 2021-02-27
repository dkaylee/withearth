package com.withearth.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.withearth.member.domain.Member;

@Service
public class MailSenderService {

	@Autowired
	private JavaMailSender sender;
	
	public int send(Member member) {
		int result = 1;
		MimeMessage message = sender.createMimeMessage();
		
		try {
		
			//메일 제목
			message.setSubject("[WITHEARTH] 회원가입을 축하합니다.","utf-8");
			//메일 내용
			String html = "<h1> WITHEARTH의 회원이 되신 것을 축하드립니다.";
			html += "<h3> 인증을 위해 아래 링크를 클릭해주세요</h3>";
			html += "<a href=\"http://localhost:8080/member/member/verify?id="+member.getIdx()+"&code="+member.getCode()+"\">인증하기</a>";
			
			//message에 내용 적용
			message.setText(html,"utf-8","html");
			//from 설정
			message.setFrom(new InternetAddress("gangajizzang@gmail.com"));
			//to 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(member.getId(),member.getName()+" 고객님", "utf-8"));
			
			sender.send(message);
		} catch (MessagingException e) {
			result = 0;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
