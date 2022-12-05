package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import member.MemberVO;

public class AdminDAO {
	
//	싱글톤을 이용한 DB 연결 객체 연결하기
	
	GetConn getConn=GetConn.getInstance();
	
	private Connection conn=getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private String sql="";
	
	MemberVO vo=null;
	
//	회원 등급 변경 처리

	public void setLevelCheck(int idx, int level) {
		try {
			sql="update member set level=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
//	회원 삭제 처리

	public void adUserDelete(int idx) {
		try {
			sql="delete from member where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public int getTotMemRecCnt() {
		int totRecCnt=0;
		
		try {
			sql="select count(*) as cnt from member";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
//			totRecCnt=rs.getInt(1);
			totRecCnt=rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		 
		return totRecCnt;
	}

	public ArrayList<MemberVO> getMemList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos=new ArrayList<>();

		try {
			sql="select * from member order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo=new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
//	삭제 대기 회원 전체 크기 가져오기

	public int getTotMemDelRecCnt() {
		int totRecCnt=0;
		
		try {
			sql="select count(*) as cnt from member where userDel='OK'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
//			totRecCnt=rs.getInt(1);
			totRecCnt=rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		 
		return totRecCnt;
	}
	
//	페이지처리 사이즈 별로 자료 가져오기

	public ArrayList<MemberVO> getMemDelList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos=new ArrayList<>();

		try {
			sql="select * from member where userDel='OK' order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo=new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vos.add(vo);
				
				
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
//	관리자 페이지에서 개별 검색 처리 과정

	public ArrayList<MemberVO> getMemberSearch(String mid) {
		
		ArrayList<MemberVO> vos=new ArrayList<>();
		
		try {
			sql="select * from member where mid like ? ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+mid+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new MemberVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
}
