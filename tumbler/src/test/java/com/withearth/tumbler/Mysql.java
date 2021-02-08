package com.withearth.tumbler;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;


@Log4j
public class Mysql {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/withearth";
	private static final String USER = "withearth";
	private static final String PW = "aia";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection conn = DriverManager.getConnection(URL, USER, PW)){
			
			log.info(conn);
			System.out.println("!!!! Connection : " + conn);
			System.out.println(conn); // 콘솔창에서 연결정보를 출력하여 확인한다.
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}


