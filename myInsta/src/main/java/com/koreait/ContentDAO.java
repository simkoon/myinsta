package com.koreait;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import insta.db.DBConn;
import insta.db.SqlMapConfig;

public class ContentDAO {
	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	SqlMapConfig smc = new SqlMapConfig();
	SqlSessionFactory sessionf = smc.getSqlMapInstance();
	SqlSession sqlsession;

	public ContentDAO() {
		sqlsession = sessionf.openSession(true);
		System.out.println("mybatis setting success!");
	}

	public List<Content> getContents(int start, int useridx) {
		sqlsession = sessionf.openSession(true);
		HashMap<String, Integer> dataMap = new HashMap<String, Integer>();
		dataMap.put("useridx", useridx);
		dataMap.put("start", start);
		List<Content> conList = sqlsession.selectList("Content.selectContent", dataMap);
		System.out.println(conList);
		sqlsession.close();
		return conList;
	}

	public int getCntLikes(int contentidx) {
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
		sqlsession = sessionf.openSession(true);
		List<CommentDTO> comList = sqlsession.selectList("Content.selectComment", mcidx);
		sqlsession.close();
		return comList;
	}

	public int setComment(int co_useridx, int co_mcidx, String co_text) {
		sqlsession = sessionf.openSession(true);
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("co_useridx", String.valueOf(co_useridx));
		dataMap.put("co_mcidx", String.valueOf(co_mcidx));
		dataMap.put("co_text", co_text);
		sqlsession.insert("Content.insertComment", dataMap);
		sqlsession.close();
		return Integer.parseInt(String.valueOf(dataMap.get("id")));
	}

	public List<SearchDTO> getSearchList(int start, String tag) {
		sqlsession = sessionf.openSession(true);
		StringBuilder tagSB = new StringBuilder();
		tagSB.append("%#").append(tag).append(",%");
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("start", start);
		dataMap.put("tag", tagSB.toString());
		
		System.out.println("dao에 start들어옴 " + start);
		List<SearchDTO> schList = sqlsession.selectList("Content.selectSearch", dataMap);
		System.out.println(" 리스트 받아옴 " + schList);
		sqlsession.close();
		return schList;
	}

}
