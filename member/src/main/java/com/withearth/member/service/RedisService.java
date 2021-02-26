package com.withearth.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import com.withearth.member.domain.LoginInfo;

@Service
public class RedisService {
	//private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	//private String TAG = this.getClass().getName();

	@Autowired
	private RedisTemplate<String, Object> redisTemplate; //key / object타입 redis는 list,map구조를 그대로 저장할수 있다.

	/**
	 * Redis 에 사용자 정보를 등록한다.
	 * 
	 * @param LoginInfo
	 */

	public void setUserInformation(LoginInfo loginInfo, HttpSession session ) { //로그인 하게 되면 redis에 저장하게 됨.

		//logger.debug("> setUserInformation", TAG);

		
		redisTemplate.setKeySerializer(new StringRedisSerializer()); //키값
		redisTemplate.setValueSerializer(new StringRedisSerializer()); //밸류값
		
		String key = session.getId(); //sessionid

		Map<String, Object> mapMemberInfo = new HashMap<String, Object>();
		mapMemberInfo.put("memberId", loginInfo.getId());
		mapMemberInfo.put("memberName", loginInfo.getName());
		mapMemberInfo.put("memberPhoto", loginInfo.getPhoto());
		redisTemplate.opsForHash().putAll(key, mapMemberInfo);
		//login info를 map형태로 저장
	}

	/**
	 * Redis 에서 사용자 정보를 가져온다.
	 * @param loginInfo
	 * @return
	 */

	public LoginInfo getUserInformation(String sessionId) {	//이코드는 각각의 어플리케이션에 있어야해!!!!!

		//logger.debug("> getUserInformation", TAG);

		String key = sessionId;

		LoginInfo result = new LoginInfo(
				(String) redisTemplate.opsForHash().get(key, "memberId"), 
				(String) redisTemplate.opsForHash().get(key, "memberName"), 
				(String) redisTemplate.opsForHash().get(key, "memberPhoto"));

		//logger.debug("> userId       : {}", result.getId(), TAG);
		//logger.debug("> userPassword : {}", result.getName(), TAG);
		//logger.debug("> phoneNumber  : {}", result.getPhoto(), TAG);

		return result;

	}
}
