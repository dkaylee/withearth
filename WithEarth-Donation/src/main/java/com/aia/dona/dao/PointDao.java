package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.Point;

public interface PointDao {
    // 텀블러 포인트 저장 메서드
	int addTumPoint(Point point);
    // 도보인 포인트 저장 메서드
	int addCoursePoint(Point point);
	// 회원의 포인트 적립 내역을 구하는 메서드
	List<Point> selectPointList(int idx);
	// 회원의 포인트 합계를 구하는 메서드
    int selectPointSum(int idx);
    // 회원의 포인트를 업데이트 하는 메서드
	int insertUsingPoint(Point point);
}
