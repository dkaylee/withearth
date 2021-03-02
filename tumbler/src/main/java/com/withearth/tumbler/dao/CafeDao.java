package com.withearth.tumbler.dao;

import java.util.List;

import com.withearth.tumbler.domain.Cafe;

public interface CafeDao {




  //카페리스트
  List<Cafe> selectCafeList();

  //위도 경도  리스트 
  List<Cafe> selectLaglng();

  //큐알코드 저장
  String insertQRcode(Cafe cafe);
  //큐알코드 카페인덱스 주소
  int QRcodeNum();
}
