package com.aia.dona.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.aia.dona.domain.LoginInfo;

@Service
public class RedisService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	private String TAG = this.getClass().getName();

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	/**
	 * Redis 에서 사용자 정보를 가져온다.
	 * @param loginInfo
	 * @return
	 */


	public LoginInfo getUserInformation(String sessionId) {

		logger.debug("> getUserInformation", TAG);

		String key = sessionId;

		LoginInfo result = new LoginInfo(
				(String) redisTemplate.opsForHash().get(key, "memberId"), 
				(String) redisTemplate.opsForHash().get(key, "memberName"), 
				(String) redisTemplate.opsForHash().get(key, "memberPhoto"));	
		
		logger.debug("> userId       : {}", result.getId(), TAG);
		logger.debug("> userPassword : {}", result.getName(), TAG);
		logger.debug("> phoneNumber  : {}", result.getPhoto(), TAG);

		return result;
	}

}
