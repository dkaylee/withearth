package com.withearth.member.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.community.service.BoardService;
import com.withearth.member.domain.ListVO;
import com.withearth.member.domain.Paging;

@Controller
@RequestMapping("/board/*")
public class ReadController {

		@Autowired
		private BoardService boardS;
		
		//게시물 목록
		/*
		@GetMapping(value="/list")
		public String boardList(ListVO listVO, Model model
					) {	
			
			//전체 게시글 개수
			//int listCnt = boardS.getBoardListCnt();
		
			List<ListVO> list = boardS.boardList();
			model.addAttribute("list",list);	
			System.out.println(list);
		return "myboard";
		}
	*/	
		//게시물 조회
		@GetMapping(value="/view")
		public String writeView(@RequestParam("bno") int idx, Model model) {
			ListVO vo = boardS.detailView(idx);
			model.addAttribute("view", vo);
			return "community/detail";
		}
		
		//게시물 수정
		@GetMapping(value="/modify")
		public String editView(@RequestParam("bno") int idx, Model model) {
			ListVO vo = boardS.detailView(idx);
			model.addAttribute("editview", vo);
			return "community/edit";
		}
		//게시물 수정
		@PostMapping(value="/modify")
		public String postEditView(ListVO vo) {
			boardS.modify(vo);
			System.out.println(vo.getIdx());
			return "redirect:/board/view?bno="+vo.getIdx();
		}
		//게시물 삭제
		@GetMapping(value="/delete")
		public String deleteList(@RequestParam("bno")int idx){
			boardS.delete(idx);
			return "redirect:/board/list";
		}
		
		//게시물 목록+페이지
		@GetMapping(value="/listPage")
		public String boardList(ListVO listVO, Model model, @RequestParam("num") int num
					) {	
			/*
			//전체 게시글 개수
			int count = boardS.getBoardListCnt();
		
			//한페이지에 출력할 게시물 갯수
			int postNum =10;
			//하단 페이지 번호 ([게시물 총 갯수 / 한페이지에 출력할 개수]의 올림)
			int pageNum = (int)Math.ceil((double)count/postNum);
			//출력할 게시물 (idx부터 10개)
			int displayPost = (num-1)*postNum;
			
			//한번에 표시할 페이징 번호의 갯수
			int pageNum_cnt = 10;
			
			//표시되는 페이지 번호 중 마지막 번호
			int endPageNum = (int) (Math.ceil((double)num / (double)pageNum_cnt)*pageNum_cnt);
			
			//표시되는 페이지 번호 중 첫번째 번호
			int startPageNum = endPageNum - (pageNum_cnt -1);
			
			//마지막 페이지 다시 계산 (1~13의 경우 14~20까지도 출력됨)
			int endPageNum_tmp = (int)(Math.ceil((double)count/(double)pageNum_cnt));
			
			if(endPageNum>endPageNum_tmp) {
				endPageNum = endPageNum_tmp;
			}
			
			//이전 다음
			//1페이지가 아닌이상 prev가 출력
			boolean prev = startPageNum ==1 ? false : true;
			//다음페이지가 존재하면 true로 next 출력
			boolean next = endPageNum * pageNum_cnt >= count ? false : true;
			*/
			Paging page = new Paging();
			page.setNum(num);
			page.setCount(boardS.getBoardListCnt());
			
			List<ListVO> list = boardS.listPage(page.getDisplayPost(), page.getPostNum());
			model.addAttribute("list",list);	
			
			model.addAttribute("page",page);
			
			/*
			model.addAttribute("pageNum", page.getPageNum());
			
			//시작 및 끝 번호
			model.addAttribute("startPageNum", page.getStartPageNum());
			model.addAttribute("endPageNum", page.getEndPageNum());
			
			//이전 및 다음
			model.addAttribute("prev", page.isPrev());
			model.addAttribute("next", page.isNext());
			*/
			//현재페이지가 눈에 띄게
			model.addAttribute("select",num);
			
		return "community/community";
		}
		
		
}

