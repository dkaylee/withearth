package com.withearth.member.community.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.ListVO;

@Service
public class BoardService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	//페이지
	public List<ListVO> boardList(){
		dao = template.getMapper(MemberDAO.class);
		return dao.printList();
	}
	
	//총 게시글 개수 확인
	public int getBoardListCnt() {
		dao = template.getMapper(MemberDAO.class);
		return dao.getBoardListCnt();
	}
	
	//게시물 조회
	public ListVO detailView(int idx) {
		dao = template.getMapper(MemberDAO.class);
		return dao.getDetailedView(idx);
	}
	
	//게시물 수정
	public void modify(ListVO vo) {
		dao = template.getMapper(MemberDAO.class);
		dao.modify(vo);
	}
	
	//게시물 삭제
	public void delete(int idx) {
		dao = template.getMapper(MemberDAO.class);
		dao.deleteList(idx);
	}
	
	//게시물 목록+ 페이징
	public List<ListVO> listPage(int displayPost, int postNum) {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		dao= template.getMapper(MemberDAO.class);
		return dao.listPage(displayPost, postNum);
	}
	
}
