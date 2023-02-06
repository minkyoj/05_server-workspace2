package com.kh.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemplate {
	// 싱클톤 패턴 적용하여 jdbc 템플릿 작성 ( 한번 생성하고 계속 꺼내쓰는 방식!! )
	
	// 1. Connection 객체 생성한 후 해당 Connection 객체를 반환해주는 getConnection 메소드
	public static Connection getConnection() {
		
		Connection conn = null;
		
		// ojdbc6.jar
		// WEB-INF 안에 lib 폴더에 복붙하기!!
		
		// jdbc driver 등록
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속하고자 하는 db의 url, 계정명, 비번 제시해서 Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SERVER", "SERVER");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	
	// 2_1. Connection 객체 전달받아서 commit 시켜주는 commit 메소드
	// 2_1. Connection 객체 전달받아서 rollback 시켜주는 rollback 메소드
	
	// 3_1. Connection 객체 전달받아서 반납시켜주는 close 메소드
	
	// 3_2. Statement 객체 전달받아서 반납시켜주는 close 메소드
	
	// 3_3. ResultSet 객체 전달받아서 반납시켜주는 close 메소드
}
