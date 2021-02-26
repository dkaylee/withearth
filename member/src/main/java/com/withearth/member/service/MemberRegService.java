package com.withearth.member.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withearth.member.Util.AES256Util;
import com.withearth.member.Util.Sha256;
import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;
import com.withearth.member.domain.MemberRegRequest;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class MemberRegService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template; //SqlSession을 구현하고 코드에서 SqlSession를 대체하는 역할

	@Autowired
	private MailSenderService mailSenderService;
	
	/*
	@Autowired
	private Sha256 sha256;
	
	@Autowired
	private AES256Util aes256Util;
	*/
	@Autowired
	private BCryptPasswordEncoder cryptPasswordEncoder; 
	
	
	
	
	
	
	//파일 업로드와 db저장
	//트랜젝션이랑 한번에 수행되어야하는 연산들은 모두 에러 없이 끝나야 하며, 
	//만약 중간에 에러가 발생 한다면 에러 발생 이전 시점까지 작업되었던 내용은 모두 원상복구 되어야 한다.
	//동시에 여러 데이터를 관리하는 경우,
	//하나의 실패로 다른 데이터 영역까지 영향을 주면 안되므로 모든 데이터가 성공적으로 업데이트가 되어야 
	//commit 처리를 하고 하나라도 실패를 하면 rollback
	
	//HttpServletRequest에는 정보가 담겨져 있다
	
	@Transactional
	public int memberReg(MemberRegRequest regRequest, HttpServletRequest request) {
		
		int result = 0; //???
		File newFile = null;
		String newFileName = null;
		
		//userPhoto가 있거나 비어있지 않으면????
		if(regRequest.getUserPhoto()!= null && !regRequest.getUserPhoto().isEmpty()) {
			//웹 경로
			String uploadPath = "/fileupload/member";
			//실제 경로
				//session=서버에 저장되어있는 정보
				//request에서 session 정보를 받아와서, 
				//이 코드 자체가 실제 경로를 가져옴
			String saveDirPath = request.getSession().getServletContext().getRealPath(uploadPath);
	
			
			//새로운 파일 이름
			//아이디 + 현재시간이 파일이름이 됨
			newFileName = regRequest.getUserid() +System.currentTimeMillis();
			
			//실제경로에 newFileName이라는 이름으로 파일이 하나 생김
			newFile = new File(saveDirPath,newFileName);
			
			//파일 저장
			
			try {
				//regRequest.getUserPhoto().transferTo(newFile);
				FileOutputStream thumnail = new FileOutputStream(new File(saveDirPath, "s_"+newFileName));
				
				// 썸네일 저장 100X100
				Thumbnailator.createThumbnail(
						regRequest.getUserPhoto().getInputStream(), 
						thumnail, 
						50, 50);
				
				thumnail.close();
				
				
				
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			
		}//if끝
		
		//데이터 저장
		//암호화부터 
		String beforepw = regRequest.getUserpw();
		String afterpw = cryptPasswordEncoder.encode(beforepw);
		regRequest.setUserpw(afterpw);
		
		Member member = regRequest.toMember();
	
		if(newFileName !=null) {
			member.setPhoto(newFileName); //새롭게 만든 파일 이름을 member에 photo이름으로 들여보냄
		}
		
		//db입력?
		//Mapper를 사용하면 SqlSession을 직접 사용하는 형태보다 안전하게 된다
		dao = template.getMapper(MemberDAO.class); //여기서 이해가 안감.
		result = dao.insertMember(member);
		
		/*
		 * //메일 발송 int mailsendCnt = mailSenderService.send(member);
		 * System.out.println("메일 발송 처리 횟수:" + mailsendCnt);
		 */
		
		return result;
		
		
		//암호화
		
		
		
		
		
		
		
	}
		
	
	
	
}