package kr.or.bit.dao;
/*
	DB 작업
	CRUD 작업을 위한 함수를 생성하는 클래스
	
	memo table의 데이터에 대해
		전체 조회: select id, email, content from memo;
		조건 조회: select id, email, content from memo where id=?
		수정: update memo set email=?, content=? where id=?
		삭제: delete from memo where id=?
		삽입: insert into memo(id, email, content) values(?, ?, ?)
		
	default 5개
	필요하다면 함수는 추가해서 사용...
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.Singleton_Helper;

public class memodao {
	Connection conn = null;
	
	public memodao() {
		conn = Singleton_Helper.getConnection("oracle");
	}
	
	// 1건의 데이터 read(where 조건으로 사용되는 column은 반드시 unique, primary key)
	public memo getMemoListById(String id) {
		/*
			select id, email, content from memo where id=?
			memo m = new memo();
			m.setId(rs.getInt(1)) ...
			return m
		 */
		return null;
	}
	
	// 전체 데이터 read(where 조건절 없음)
	// public List<memo>
	public ArrayList<memo> getMemoList() throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select id, email, content from memo";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<memo> memolist = new ArrayList<memo>();
		
		while (rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);
		}
		
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		
		return memolist;
	}
	
	// Insert
	// parameter(id, email, content)
	// 권장하는 방법: public int insertMemo(memo m){} >> Framework 자동화...
	public int insertMemo(String id,String email, String content) {
		int resultrow = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into memo(id, email, content) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, content);
			
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Insert: " + e.getMessage());
		} finally {
			Singleton_Helper.close(pstmt);
		}
		return resultrow;
	}
	
	// Update
	public int updateMemo(memo m) {
		// update memo set email=?, content=? where id=?
		// m.getId()
		return 0;
	}
	
	// Delete
	public int deleteMemo(String id) {
		// delete from memo where id=?
		return 0;
	}
	
	// 추가함수(ID 존재 유무 판단)
	public String isCheckById(String id) {
		// id가 존재하면: false
		// id가 존재하지 않으면: true
		String result = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select id from memo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = "false";
			} else {
				result = "true";
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			Singleton_Helper.close(rs);
			Singleton_Helper.close(pstmt);
		}
		
		return result;
	}
	
}
