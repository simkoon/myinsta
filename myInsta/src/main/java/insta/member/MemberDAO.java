package insta.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import insta.member.MemberDTO;

import insta.db.DBConn;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	MemberDTO member;
	
	public int join(MemberDTO member) {
		String sql ="INSERT INTO tb_member(m_userid,m_password,m_username,m_email) VALUES (?,PASSWORD(?),?,?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println(member.getM_userid());
			pstmt.setString(1, member.getM_userid());
			pstmt.setString(2, member.getM_password());
			pstmt.setString(3, member.getM_username());
			pstmt.setString(4, member.getM_email());
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 0;
	}
	
	public int idCheck(String id, String email) {
		String sql ="SELECT m_idx FROM tb_member WHERE m_userid=?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}
			
		sql ="SELECT m_idx FROM tb_member WHERE m_email=?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}
	
	public MemberDTO login(MemberDTO member) {
		String sql = "SELECT m_idx , m_userid FROM tb_member WHERE (m_userid=? OR m_email=?) "
				+ "AND m_password=PASSWORD(?)";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_userid());
			pstmt.setString(2, member.getM_userid());
			pstmt.setString(3, member.getM_password());
			rs = pstmt.executeQuery();
			if(rs.next()){
				member.setM_idx(Integer.parseInt(rs.getString("m_idx")));
				member.setM_userid(rs.getString("m_userid"));
				return member;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return null;
	}
	
	public int emailCheck(String m_email) {
		String sql = "SELECT m_email FROM tb_member WHERE m_email=? ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}
	
	public int idCheck(String m_userid) {
		String sql = "SELECT m_userid FROM tb_member WHERE m_userid=? ";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}
	
	public String findPw(String id) {
		String sql = "SELECT m_email FROM tb_member WHERE (m_userid=? OR m_email=?) ";

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String email = rs.getString("m_email");
				return email;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return null;
	}
	
	public int changePw(String email, String password) {
		String sql = "UPDATE  tb_member SET m_password=PASSWORD(?) WHERE m_email=? ";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException sqle){
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return 1;
	}
}
