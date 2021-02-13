package com.withearth.tumbler.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.TumblerDao;
import com.withearth.tumbler.domain.Tumbler;

import lombok.extern.log4j.Log4j;

@Service
@Log4j	
public class TumListService {
	
	private TumblerDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	

			public List<Tumbler> getTumList(int idx){	
				
				List<Tumbler> list = null;
				
				dao = template.getMapper(TumblerDao.class);
				
				list =  dao.selelctTumList(idx);
				log.info(list);
				
				return list;
			}

		}
	


