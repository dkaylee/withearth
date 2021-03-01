package com.withearth.tumbler.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.withearth.tumbler.dao.TumblerDao;
import com.withearth.tumbler.domain.Tumbler;
import com.withearth.tumbler.domain.TumpointView;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TumListService {

	private TumblerDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public TumpointView getTumListView(int page) {

		TumpointView listView = null;

		try {
			// 구현체 생성
			dao = template.getMapper(TumblerDao.class);
			System.out.println("pagenumber:" + page);

			int cntPerPage = 15;

			int startRow = (page - 1) * cntPerPage;
			int endRow = startRow + cntPerPage - 1;
			
		    Map<String, Object> listMap = new HashMap<String, Object>();
			listMap.put("index", startRow);
			listMap.put("count", cntPerPage);
			
			
			int totalTpointCount = dao.selectTotalCount(listMap);
			System.out.println("tumlistTotalcount:" + totalTpointCount);
			
			
			List<Tumbler> tumlist = dao.selectTumpointList(listMap);
			System.out.println("텀블러리스트!!!!!!!!!!!" + tumlist);

			listView = new TumpointView(page, totalTpointCount, cntPerPage, tumlist, startRow, endRow);

			System.out.println("listView!!"+listView);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listView;
	}

	public List<Tumbler> getTumList(int idx){	
		
		List<Tumbler> list = null;
		
		dao = template.getMapper(TumblerDao.class);
		
		list =  dao.selelctTumList(idx);
		log.info(list);
		
		//list =  dao.selelctTumList(idx);
		//log.info(list);
		return list;
		//return dao.selelctTumList(idx);
	}

}
