package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	
//	싱글톤을 이용한 DB 연결 객체 연결하기
	
	GetConn getConn=GetConn.getInstance();
	
	private Connection conn=getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private String sql="";
	
	MemberVO vo=null;
	
//	아이디 체크 (조건을 만족하면 모든 자료를 VO에 담아서 넘겨준다.)

	public MemberVO getLoginCheck(String mid) {
		vo=new MemberVO();
		
		try {
			sql="select * from member where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
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
				
			}
			else {
				vo=null;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
//	회원 오늘 처음 방문시 방문 카운트 0으로 초기화 처리

	public void setTodayCntUpdate(String mid) {
		try {
			sql="update member set todayCnt=1 where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
//	오늘 재방문이라면 '총 방문수', '오늘 방문수', '포인트' 누적 처리

	public void setMemTotalUpdate(String mid, int nowTodayPoint) {
		try {
			sql="update member set visitCnt=visitCnt+1, todayCnt=todayCnt+1, point=?, lastDate=now() where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nowTodayPoint);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public int getNickNameCheck(String nickName) {
		int resNick=0;
		try {
			sql="select * from member where nickName=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				resNick=1;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return resNick;
	}

	public int setMemberJoinOk(MemberVO vo) {
		int res=0;
		
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<MemberVO> getMemList(int level, int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos=new ArrayList<>();
		
		try {
			if(level!=0) {
				sql="select * from member where userInfor='공개' order by idx desc limit ?,?";
			}
			else {
				sql="select * from member order by idx desc limit ?,?";
			}
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

//	비밀번호 변경 처리 작업
	
	public int setMemUpdatePwdOk(String mid, String newPwd) {
		int res=0;
		
		try {
			sql="update member set pwd=? where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
//	회원 정보 수정 처리 작업

	public int setMemberUpdateOk(MemberVO vo) {
		int res=0;
		
		try {
			sql = "update member set nickName=?, name=?, gender=?, birthday=?, "
					+ "tel=?, address=?, email=?, homePage=?, job=?, hobby=?, "
					+ "photo=?, content=?, userInfor=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
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
	
//	회원 개별 검색 처리

	public ArrayList<MemberVO> getMemberSearch(String mid, int level) {
		ArrayList<MemberVO> vos=new ArrayList<>();
		
		try {
			
			if(level!=0) {
				sql="select * from member where mid like ? and userInfor='공개'";
			}
			else {
				sql="select * from member where mid like ? ";
			}
			
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
	
//	회원 탈퇴 처리 (userDel 필드의 값을 'OK'로 변경 처리한다.

	public void setMemberDel(String mid) {
		try {
			sql="update member set userDel='OK' where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
//	비밀번호 확인 처리

	public String getCheckPwd(String mid) {
		String pwd="";
		try {
			sql="select pwd from member where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pwd=rs.getString("pwd");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return pwd;
	}

//	이메일 검색으로 아이디 찾기 처리 
	
	public ArrayList<MemberVO> getMemMidSearch(String email) {
		ArrayList<MemberVO> vos=new ArrayList<>();
		
		try {
			sql="select * from member where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo=new MemberVO();
				vo.setNickName(rs.getString("nickName"));
				vo.setMid(rs.getString("mid"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return vos;
	}
	
//	임시 비밀번호 재설정 처리

	public int setMemNewPwd(String mid, String name, String imsiPwd) {
		
		int res=0;
		
		try {
			sql="update member set pwd=? where mid=? and name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, imsiPwd);
			pstmt.setString(2, mid);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
//	임시 비밀번호 재설정 전 정보 있는지 처리!

	public int getMemInfoCheck(String mid, String name) {
		System.out.println(name);
		int res=0;
		
		try {
			sql="select * from member where mid=? and name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				res=1;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return res;
		
	}
	
	
}