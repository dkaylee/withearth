package com.withearth.tumbler.dao;

import java.util.List;

import com.withearth.tumbler.domain.Cafe;

public interface CafeDao {

	Object template = null;

	//카페 전체 리스트
	List<Cafe> selectAllCafeList();

}
