package com.koreait;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import insta.db.DBConn;
import insta.db.SqlMapConfig;

public class ContentDAO {
	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public ContentDAO() {
		sqlsession = sessionf.openSession(true);
		System.out.println("mybatis setting success!");
	}

	public List<Content> getContents(int start) {
		List<Content> conList = new ArrayList<Content>();
		String sql;
		PreparedStatement pstmt;
		ResultSet rs;
		Connection conn;
		Content con;
		try {
			System.out.println("자바 스타트:" + start);
			conn = DBConn.getConnection();
			sql = "SELECT mc_idx, m_userid, mc_content,mc_taggedid,mc_taggedname,"
					+ "mc_regdate, mc_location, mc_imageurl" + " FROM tb_mycontent JOIN tb_member on mc_useridx=m_idx"
					+ " ORDER BY tb_mycontent.mc_regdate LIMIT ?, 5;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				con = new Content();
				con.setMc_idx(rs.getInt("mc_idx"));
				con.setMc_useridx(rs.getString("m_userid"));
				con.setMc_content(rs.getString("mc_content"));
				con.setMc_taggedid(rs.getString("mc_taggedid"));
				con.setMc_taggedname(rs.getString("mc_taggedname"));
				con.setMc_regdate(rs.getString("mc_regdate"));
				con.setMc_location("mc_location");
				con.setMc_imageurl(rs.getString("mc_imageurl"));
				con.setCntLikes(getCntLisks(con.getMc_idx()));
				conList.add(con);
				System.out.println(con);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conList;
	}

	public int getCntLisks(int contentidx) {
		String sql;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT count(l_idx) FROM tb_like WHERE l_mcidx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public boolean getLikeById(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt;
		Connection conn;
		ResultSet rs = null;
		boolean isOk = false;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT l_idx FROM tb_like WHERE l_mcidx=? AND l_useridx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			pstmt.setInt(2, useridx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isOk = true;
			}
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isOk;
	}

	public int editLike(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt;
		int result = -1;
		Connection conn;

		try {
			boolean isOk = getLikeById(contentidx, useridx);
			if (!isOk) {
				conn = DBConn.getConnection();
				sql = "INSERT INTO tb_like (l_mcidx, l_useridx) VALUES (?,?);";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
				System.out.println(result);
			} else {
				conn = DBConn.getConnection();
				sql = "DELETE FROM tb_like WHERE l_mcidx=? AND l_useridx=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result=" + result);
		return result;
	}

	public boolean getSaveById(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt;
		Connection conn;
		ResultSet rs = null;
		boolean isOk = false;
		try {
			conn = DBConn.getConnection();

			sql = "SELECT s_idx FROM tb_save WHERE s_mcidx=? AND s_useridx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentidx);
			pstmt.setInt(2, useridx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isOk = true;
			}
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isOk;
	}

	public int editSave(int contentidx, int useridx) {
		String sql;
		PreparedStatement pstmt;
		int result = -1;
		Connection conn;

		try {
			boolean isOk = getSaveById(contentidx, useridx);
			if (!isOk) {
				conn = DBConn.getConnection();
				sql = "INSERT INTO tb_save (s_mcidx, s_useridx) VALUES (?,?);";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
				System.out.println(result);
			} else {
				conn = DBConn.getConnection();
				sql = "DELETE FROM tb_save WHERE s_mcidx=? AND s_useridx=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentidx);
				pstmt.setInt(2, useridx);
				result = pstmt.executeUpdate();
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result=" + result);
		return result;
	}

	public List<CommentDTO> getComment(int mcidx) {
		List<CommentDTO> comList = sqlsession.selectList("Content.selectComment",mcidx);
		System.out.println(comList);
		return comList;
	}

}
