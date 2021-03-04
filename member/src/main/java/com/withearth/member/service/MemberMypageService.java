package com.withearth.member.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.EditMyInfo;
import com.withearth.member.domain.Member;

@Service
public class MemberMypageService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template; //SqlSession을 구현하고 코드에서 SqlSession를 대체하는 역할
	
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
	public int editInfo(EditMyInfo myinfo, HttpServletRequest request) {
		System.out.println("처음에 데이터가 잘 들어왔나?"+myinfo);
		Member member = new Member();
		
		int result = 0;
		File newFile = null;
		String newFileName = null;
		
		//사진 처리
		//웹 경로
		String uploadPath = "/fileupload/member";
		//실제 경로
		String saveDirPath = request.getSession().getServletContext().getRealPath(uploadPath);
		
		//Photo가 있거나 비어있지 않으면??
		if(myinfo.getCgphoto()!= null && !myinfo.getCgphoto().isEmpty()) {

			newFileName = myinfo.getId() + System.currentTimeMillis();	
			newFile = new File(saveDirPath, newFileName);		
			System.out.println("사진을 수정했나?"+newFileName);

			//파일 저장
			try {
				myinfo.getCgphoto().transferTo(newFile);
			} catch (IOException e) {
				e.printStackTrace();
			}	
			/*왜 삭제?
			 * //저장된 파일을 삭제 if(newFile != null && newFile.exists()) { newFile.delete(); }
			 */
			//쓰지않는 파일 정리
			new File(saveDirPath,myinfo.getOldphoto()).delete(); 			
		}

		//암호화
		if(myinfo.getCgpw() != null && !myinfo.getCgpw().isEmpty()) {
			String beforepw = myinfo.getCgpw();
			String afterpw = cryptPasswordEncoder.encode(beforepw);
			myinfo.setCgpw(afterpw);
		}
		String dename=null;
		//수정할 데이터를 보낸다.
		if(myinfo.getCgname()!= null && !myinfo.getCgname().isEmpty()) {
		dename=myinfo.getCgname();
		try {
			dename=URLDecoder.decode(dename, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		}
		myinfo.setCgname(dename);
		
		member = myinfo.toMember();
		//파일 이름 member로 보내기
		if(newFileName !=null) {
		member.setPhoto(newFileName);
		}
		
		//db입력
		dao = template.getMapper(MemberDAO.class);
		System.out.println("db보내기 바로 직전 myinfo"+myinfo);
		System.out.println("db보내기 바로 직전 member"+member);
		//사진변경
		if(myinfo.getCgphoto()!= null && !myinfo.getCgphoto().isEmpty()) {
		result = dao.updatePhoto(member);
		}
		//별명변경
		if(myinfo.getCgname()!= null && !myinfo.getCgname().isEmpty()) {
		result = dao.updateName(member);
		}
		
		//비번변경
		if(myinfo.getCgpw()!= null && !myinfo.getCgpw().isEmpty()) {
		result = dao.updatePw(member);		
		}
		
		return result;
		
		
	}
		
	
	
	
}