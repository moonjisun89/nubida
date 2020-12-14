package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PlaceDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ArrayList<String> suggestion_result= new ArrayList<String>();
	ArrayList<String> course_result= new ArrayList<String>();
	ArrayList<String> mlocate_result= new ArrayList<String>();
	String [] locate_result = new String [6];
	int cnt = 0;
	String p_num="";
	
	
	
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
	
	
	public ArrayList<String> main_locate() {
		try {
			conn(); 
			String sql = "select p_name,imgurl,pageurl,tag from place where pick>800 order by pick desc";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				mlocate_result.add(rs.getString(1));//장소이름
				mlocate_result.add(rs.getString(2));//이미지url
				mlocate_result.add(rs.getString(3));//페이지url
				mlocate_result.add(rs.getString(4));//태그
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mlocate_result;
	}
	
	public String[] locate(int p_num) {
		try {
			conn();
			String sql = "select p_name,imgurl,pageurl,tag,coordinate_x,coordinate_y from place where p_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, p_num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				locate_result[0]=(rs.getString(1));//장소이름
				locate_result[1]=(rs.getString(2));//이미지url
				locate_result[2]=(rs.getString(3));//페이지url
				locate_result[3]=(rs.getString(4));//태그
				locate_result[4]=(rs.getString(5));//x좌표
				locate_result[5]=(rs.getString(6));//y좌표
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return locate_result;
	}
	
	public ArrayList<String> course(String email) {
		try {
			conn();
			String sql = "select course from member where m_email=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();

			if (rs.next()) {
				course_result.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return course_result;
	}
	
	public ArrayList<String> suggestion(String email) {
		try {
			conn();
			String sql = "select suggestion from member where m_email=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				suggestion_result.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return suggestion_result;
	}
	public void period_update(String email, String period) {
		try {
			conn();
			String sql = "update member set period=? where m_email=?";			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, period);
			psmt.setString(2, email);
			cnt = psmt.executeUpdate();
			if(cnt>0) {
				System.out.println(cnt);
			}else {
				System.out.println("업데이트실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public void course_reset(String email) {
		try {
			conn();
			String sql = "update member set course='400-' where m_email=?";			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			cnt = psmt.executeUpdate();
			if(cnt>0) {
				System.out.println(cnt);
			}else {
				System.out.println("코스초기화실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public void course_update(String email, String p_num) {
		try {
			conn();
			
			String sql = "update member set course=course||? where m_email=?";
			p_num = p_num+"-";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, p_num);
			psmt.setString(2, email);
			cnt = psmt.executeUpdate();
			if(cnt>0) {
				System.out.println(cnt);
			}else {
				System.out.println("코스업데이트실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public String get_p_num(String p_name) {
		try {
			conn();
			String sql = "select p_num from place where p_name=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, p_name);
			rs = psmt.executeQuery();
			if (rs.next()) {
				p_num=Integer.toString(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return p_num;
	}
}
