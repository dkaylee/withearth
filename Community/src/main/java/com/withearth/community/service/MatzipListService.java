package com.withearth.community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatListView;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.domain.SearchParam;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MatzipListService {

	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public MatListView getListView(SearchParam param){
	
		MatListView matlist = null;
		
		try {
		
		dao = template.getMapper(MatDao.class);
		
		System.out.println("pageNum: " + param.getP());
		
		int cntPerPage = 5;
		
		int startRow = (param.getP() -1) * cntPerPage;
		int endRow = startRow + cntPerPage - 1;
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		listMap.put("index", startRow);
		listMap.put("count", cntPerPage);
		listMap.put("searchParam", param);
		
		System.out.println("show ListMap= "+listMap);
		
		int totalMatzipCount = dao.selectSearchMatzipCount(listMap);
		System.out.println("matzipTotalCount : "+totalMatzipCount);
		
		List<MatzipVo> matzipList = dao.selectMatList(listMap);
		System.out.println("matziplist>>>" + matzipList);
		
		matlist = new MatListView(param.getP(), totalMatzipCount, cntPerPage, matzipList, startRow, endRow);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return matlist;
	
	}
	
	public List<MatzipVo> getListView(){
		
		List<MatzipVo> list = null;
		
		try {
		dao = template.getMapper(MatDao.class);
		
		list = dao.selectAllMatList();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
		
	
	
	
	
}
