package com.withearth.member.cafe.dao;

import java.util.List;

import com.withearth.member.tumbler.domain.Cafe;


public interface CafeDao {

  //큐알코드 저장
String insertQRcode(Cafe cafe);
}
