package com.withearth.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.TemporaryPw;

@Service
public class FindPwService {
	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private BCryptPasswordEncoder cryptPasswordEncoder; 

	public int changepw(TemporaryPw tempw){
		int result=0;
		//비번 찾기 이메일 발송
		MimeMessage message = sender.createMimeMessage();
		
		try {
			//메일 제목
			message.setSubject("[WITHEARTH] 임시 비밀번호가 발급되었습니다.","utf-8");
			//메일 내용
			String html = "<h1>WITHEARTH의 임시 비밀번호가 발급되었습니다.</h1>";
			html += "<h3>임시 비밀번호로 로그인 후, 회원정보 수정을 통해 비밀번호를 변경해주세요.</h3>";
			html += "<h3>임시비밀번호:"+tempw.getTpw()+"</h3>";
			
			//message에 내용 적용
			message.setText(html,"utf-8","html");
			//from 설정
			message.setFrom(new InternetAddress("gangajizzang@gmail.com"));
			//to 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(tempw.getId(),"WITHEARTH 회원님","utf-8"));
			
			sender.send(message);
		} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		
		//임시 비밀번호 지정		
		
		dao = template.getMapper(MemberDAO.class);
		
		//여기서 암호화
		String beforepw = tempw.getTpw();
		String afterpw = cryptPasswordEncoder.encode(beforepw);
		tempw.setTpw(afterpw);
		result = dao.updateMembertemporaryPW(tempw);
		return result;
	}
}
