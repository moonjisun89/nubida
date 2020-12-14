package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	MemberDTO info = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = null;
	String exp= "";

	HttpServletRequest request;
	HttpSession session;
	
	
	public MemberDAO(HttpServletRequest request, HttpSession session) {
		this.request=request;
		this.session=session;
	}
	
	
	
	public MemberDAO() {
		super();
	}
	
	
	
	public void conn() { /* JDBC 연결 */
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
	
	

	public void close() { /* JDBC 연결끊기 */
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
	
	

	public int join(MemberDTO dto) {/* 회원가입 */

		try {
			conn();
			// 일반회원일 때
			if (dto.getRank().equals("0")) {
				String sql = "insert into member(m_num, m_name, m_email, m_pw, m_tel, ranks, age, gender) values(seq.nextval,?,?,?,?,?,?,?)";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getM_name());
				psmt.setString(2, dto.getM_email());
				psmt.setString(3, dto.getM_pw());
				psmt.setString(4, dto.getM_tel());
				psmt.setString(5, dto.getRank());
				psmt.setString(6, dto.getAge());
				psmt.setString(7, dto.getGender());

				// 사업자회원일 때
			} else if (dto.getRank().equals("1")) {

				String sql = "insert into member(m_num, m_name, m_email, m_pw, m_tel, ranks, age, gender, store, type) values(seq.nextval,?,?,?,?,?,?,?,?,?)";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getM_name());
				psmt.setString(2, dto.getM_email());
				psmt.setString(3, dto.getM_pw());
				psmt.setString(4, dto.getM_tel());
				psmt.setString(5, dto.getRank());
				psmt.setString(6, dto.getAge());
				psmt.setString(7, dto.getGender());
				psmt.setString(8, dto.getStore()); // 사업자회원 - 상호명
				psmt.setString(9, dto.getType()); // 사업자회원 - 업종
			}

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
	
	public MemberDTO check(MemberDTO dto) { /* 이메일 중복체크 */
		
		try {
			conn();
			String sql = "select * from member where m_email=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				info = new MemberDTO();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return info;
	}
	public String expcheck(String email) { /* 이메일 중복체크 */
		
		try {
			conn();
			String sql = "select experience from member where m_email=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				exp = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return exp;
	}
	
	
	
	public int update(MemberDTO dto) {

		try {
			conn();
			String sql = "update member set m_pw=?, m_tel=?, ranks=?, age=?, gender=?, store=?, type=? where m_email=?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_pw());
			psmt.setString(2, dto.getM_tel());
			psmt.setString(3, dto.getRank());
			psmt.setString(4, dto.getAge());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getStore());
			psmt.setString(7, dto.getType());
			psmt.setString(8, dto.getM_email());
			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	
	
	public int delete(MemberDTO dto) { /* 회원탈퇴 */

		try {
			conn();
			String sql = "delete from member where m_email=? and m_pw=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			psmt.setString(2, dto.getM_pw());
			

			cnt = psmt.executeUpdate();
			System.out.println(cnt);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	
	public MemberDTO login(MemberDTO dto) { /* 로그인 */

	      try {
	         conn();
	         String sql = "select * from member where m_email=? and m_pw=?";

	         psmt = conn.prepareStatement(sql);

	         psmt.setString(1, dto.getM_email());
	         psmt.setString(2, dto.getM_pw());
	         rs = psmt.executeQuery();

	         if (rs.next()) {
	            String m_name = rs.getString(2);
	            String m_email = rs.getString(3);
	            String m_pw = rs.getString(4);
	            String rank = rs.getString(6);
	            String type = rs.getString(10);
	            String experience = rs.getString(12);
	            
	            info = new MemberDTO(m_name, m_email, m_pw, rank, type, experience);
	            System.out.println(m_name);
	            System.out.println(m_email);
	            System.out.println(rank);
	            System.out.println(type);
	            System.out.println(experience);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }

	      return info;
	}
	
	public int putpoint1(String email) {
		
		try {
			conn();
			
			String sql= "update member set experience=experience+10 where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int putpoint2(String email) {
		
		try {
			conn();
			
			String sql= "update member set experience=experience+10 where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	/* 여행지 월드컵 16개 메소드 */
	
	public int typeMountain(MemberDTO dto) {  /* 여행지월드컵 - 산 */
		try {
	        conn();
			String sql = "update member set mountain='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeBeach(MemberDTO dto) {  /* 여행지월드컵 - 바다 */

		try {
	        conn();
			String sql = "update member set beach='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeTown(MemberDTO dto) {  /* 여행지월드컵 - 번화가 */

		try {
	        conn();
			String sql = "update member set town='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeExotic(MemberDTO dto) {  /* 여행지월드컵 - 이색적인 */

		try {
	        conn();
			String sql = "update member set exotic='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeHealing(MemberDTO dto) {  /* 여행지월드컵 - 힐링 */

		try {
	        conn();
			String sql = "update member set healing='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeActivity(MemberDTO dto) {  /* 여행지월드컵 - 활동 */

		try {
	        conn();
			String sql = "update member set activity='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeHotspot(MemberDTO dto) {  /* 여행지월드컵 - 핫스팟 */

		try {
	        conn();
			String sql = "update member set beach='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeBeverage(MemberDTO dto) {  /* 여행지월드컵 - 카페 */

		try {
	        conn();
			String sql = "update member set beverage='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeFood(MemberDTO dto) {  /* 여행지월드컵 - 맛집 */

		try {
	        conn();
			String sql = "update member set food='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeHistory(MemberDTO dto) {  /* 여행지월드컵 - 역사 */

		try {
	        conn();
			String sql = "update member set history='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeWalkbicycle(MemberDTO dto) {  /* 여행지월드컵 - 산책 */

		try {
	        conn();
			String sql = "update member set walkbicycle='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeDrivebike(MemberDTO dto) {  /* 여행지월드컵 - 드라이브 */

		try {
	        conn();
			String sql = "update member set drivebike='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typePlay(MemberDTO dto) {  /* 여행지월드컵 - 체험 */

		try {
	        conn();
			String sql = "update member set play='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeShopping(MemberDTO dto) {  /* 여행지월드컵 - 쇼핑 */

		try {
	        conn();
			String sql = "update member set shopping='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typePet(MemberDTO dto) {  /* 여행지월드컵 - 반려동물 */

		try {
	        conn();
			String sql = "update member set pet='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int typeFestival(MemberDTO dto) {  /* 여행지월드컵 - 축제 */

		try {
	        conn();
			String sql = "update member set festival='20' where m_email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getM_email());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
