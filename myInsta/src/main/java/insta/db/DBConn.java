package insta.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			String url = "jdbc:mariadb://127.0.0.1:3306/insta";
			String user = "root";
			String pw = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);	
		}catch(ClassNotFoundException cnfe){
			System.out.println("드라이버 로딩 실패");
			System.out.println(cnfe);
		}catch(SQLException sqle){
			System.out.println("DB 접속 오류");
			System.out.println(sqle);
		}catch(Exception e){
			System.out.println("알 수 없는 오류");
			System.out.println(e);
		}
		return conn;
	}
}
