package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ArrayList<QuestDTO> list = null;
	ArrayList<QuestDTO> list2 = null;
	

	public void conn() {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@phil87.cfxt9kqdcbog.ap-northeast-2.rds.amazonaws.com:1521:orcl";
			String db_id = "phil87";
			String db_pw = "phil1234!";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<QuestDTO> select(String kinds) {

		list = new ArrayList<>();

		try {
			conn();

			String sql = "select * from quest where q_kinds=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, kinds);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int q_num = rs.getInt(1);
				String q_kinds = rs.getString(2);
				String q_content = rs.getString(3);
				String q_point = rs.getString(4);

				QuestDTO dto = new QuestDTO(q_num, q_kinds, q_content, q_point);
				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<QuestDTO> selectAll() {
		
		list2 = new ArrayList<>();
		
		try {
			conn();
			
			String sql = "select * from quest";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String q_content = rs.getString(3);
				String q_point = rs.getString(4);
				
				QuestDTO dto = new QuestDTO(q_content, q_point);
				list2.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list2;
		
		
	}

	public int create(QuestDTO dto) {

		try {
			conn();

			String sql = "insert into quest(q_num, q_kinds, q_content, q_point) values(seq.nextval,?,?,?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getQ_kinds());
			psmt.setString(2, dto.getQ_content());
			psmt.setString(3, dto.getQ_point());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int delete(String num) {

		try {
			conn();

			String sql = "delete from quest where q_num=?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, num);

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	
	public int deleteOne(String content) {
		
		
		try {
			conn();
			
			String sql = "delete from quest where q_content=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, content);
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}

}
