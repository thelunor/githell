package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;


/*
DB작업
CRUD 작업을 하기위한 함수를 생성하는 곳

memo table 에 데이터 에 대해서
전제조회 : select id, email ,content from memo
조건조회 : select id, email ,content from memo where id=?
수정 : update memo set email=? , content=? where id=?
삭제 : delete from memo where id=?
삽입 : insert into memo(id,email,content) values(?,?,?)

default 5개
필요하시면 함수는 추가 .....^^
*/
public class memodao {
	/*
	Connection conn = null;
	public memodao() {
		conn = Singleton_Helper.getConnection("oracle");
	}
	*/
	
	public memodao(){
		
	}
	
	//1건의 데이터 read (where 조건으로 사용되는 컬럼은 반드시 unique , primary key)
	public memo getMemoListById(String id) {
		/*
		  select id, email ,content from memo where id=?
		  memo m = new memo();
		  m.setId(rs.getInt(1)) ...
		  return m
		*/
		return null;
	}
	
	//전체 데이터 read (where 조건절이 없어요)
	public ArrayList<memo> getMemoList() throws SQLException{
		Connection conn = ConnectionHelper.getConnection("oracle"); //tool에서 connection 객체를 쓰는것
		PreparedStatement pstmt = null;
		String sql="select id, email , content from memo";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<memo> memolist = new ArrayList<>();
		while(rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			memolist.add(m);
		}
		DB_Close.close(rs);//닫기
		DB_Close.close(pstmt);//닫기
		conn.close();//반환하기 
		
		return memolist;
	}
	
	//Insert
	//Parameter (id,ename,cotent)
	//권장: public int insertMemo(memo m){} >> FrameWork 자동화..
	public int insertMemo(String id, String email , String content) {
		Connection conn = null;
		int resultrow=0;
		PreparedStatement pstmt = null;
		
		try {
				conn = ConnectionHelper.getConnection("oracle"); //추가 
				String sql = "insert into memo(id,email,content) values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				pstmt.setString(3, content);
				
				resultrow = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("Insert : " + e.getMessage());
		}finally {
			DB_Close.close(pstmt);//닫기
			try {
				conn.close(); //반환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultrow;
	}
	
	//Update
	public int updateMemo(memo m) {
		//update memo set email=? , content=? where id=?
		//m.getId()
		return 0;
	}
	
	//Delete
	public int deleteMemo(String id) {
		//delete from memo where id=?
		return 0;
	}

	//추가함수 (ID 존재 유무 판단 함수)
	public String isCheckById(String id) {
		
		Connection conn = null;
		String ismemoid= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = ConnectionHelper.getConnection("oracle");	
			
				String sql = "select id from memo where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					//do {
						//String id = rs.getString("id")
						ismemoid = "false";
						
					//}while(rs.next());
				}else {
						ismemoid = "true";
				}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(rs);//닫기
			DB_Close.close(pstmt);//닫기
			try {
				conn.close();//반환하기 
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		//System.out.println("ismemoid : " + ismemoid);
		return ismemoid;
	}
}







