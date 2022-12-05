package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO2 {
	
//	싱글톤을 이용한 DB 연결 객체 연결하기
	
	GetConn getConn=GetConn.getInstance();
	
	private Connection conn=getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	private String sql="";
	
	BoardVO vo=null;
	
//	게시판 전체() 게시글 수 조회

	public int totRecCnt() {
		int totRecCnt=0;
		
		try {
			
			sql="select count(*) as cnt from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			rs.next();
			
			totRecCnt=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}
	
//	전체 게시글 가져오기 (페이지 처리)

	public ArrayList<BoardVO> getBoList(int startIndexNo, int pageSize) {
		
		ArrayList<BoardVO> vos=new ArrayList<>();
		
		try {
//			sql="select *,(select count(*) from boardReply where boardIdx=b.idx) as replyCnt from board b order by idx desc limit 5";
//			sql 파일에서 연습한 명령어
			sql="select *,datediff(now(), wDate) as day_diff, "
					+ "timestampdiff(hour,wDate,now()) as hour_diff, "
					+ "(select count(*) from boardReply where boardIdx=b.idx) as replyCnt "
					+ "from board b order by idx desc limit ?,?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				vo=new BoardVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
				
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				
				vo.setReplyCnt(rs.getInt("replyCnt"));
				
				vos.add(vo);
				
			}
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

//	게시글 내용 DB에 저장 처리
	
	public int setBoInputOk(BoardVO vo) {
		int res=0;
		
		try {
			sql="insert into board values (default,?,?,?,?,?,default,?,default,default,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getHostIp());
			pstmt.setString(7, vo.getMid());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
//	DB에서 게시글의 개별 자료 조회

	public BoardVO getBoContentSearch(int idx) {
		
		try {
			sql="select * from board where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			rs.next();
			
			vo=new BoardVO();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setContent(rs.getString("content"));
			vo.setwDate(rs.getString("wDate"));
			vo.setHostIp(rs.getString("hostIp"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setGood(rs.getInt("good"));
			vo.setMid(rs.getString("mid"));
			
			
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}
	
//	조회 시 조회수 증가 처리

	public void setReadNumPlus(int idx) {
		
		try {
			sql="update board set readNum=readNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

//	게시판 게시글 좋아요 수 증가 처리
	
	public void setBoGood(int idx) {
		
		try {
			sql="update board set good=good+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setBoGoodMinus(int idx) {
		try {
			sql="update board set good=good-1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	
//	게시글 삭제 처리

	public int setBoDeleteOK(int idx) {
		int res=0;
		
		try {
			sql="delete from board where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
//	게시글 수정 처리

	public int setBoUpdateOk(BoardVO vo) {
		int res=0;
		
		try {
			sql="update board set title=?, email=?, homePage=?, content=?, hostIp=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setInt(6, vo.getIdx());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return res;
	}
	
//	이전 글 다음글 제목 표시에 필요한 내용 검색 처리

	public BoardVO getPrevNextSearch(String str, int idx) {
		vo=new BoardVO();
		try {
			if(str.equals("prev")) {
				sql="select * from board where idx<? order by idx desc limit 1";
			}
			else {
				sql="select * from board where idx>? limit 1";
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			if(str.equals("prev")&&rs.next()) {
				vo.setPrevIdx(rs.getInt("idx"));
				vo.setPrevTitle(rs.getString("title"));
			}
			else if(str.equals("next")&&rs.next()){
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public ArrayList<BoardVO> getBoContentSearch(String search, String searchString) {
		ArrayList<BoardVO> vos=new ArrayList<>();
		
		try {
			sql="select * from board where "+search+" like ? order by idx desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new BoardVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
				
//				vo.setDay_diff(rs.getInt("day_diff"));
//				vo.setHour_diff(rs.getInt("hour_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
//	댓글 입력처리

	public String setReplyInputOk(BoardReplyVO replyVo) {
		String res="0";
		
		try {
			sql="insert into boardReply values (default, ?, ?, ?, default, ?, ?);";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, replyVo.getBoardIdx());
			pstmt.setString(2, replyVo.getMid());
			pstmt.setString(3, replyVo.getNickName());
			pstmt.setString(4, replyVo.getHostIp());
			pstmt.setString(5, replyVo.getContent());
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
//	댓글 가져오기 처리

	public ArrayList<BoardReplyVO> getBoReply(int idx) {
		ArrayList<BoardReplyVO> replyVos=new ArrayList<>();
		
		try {
			sql="select * from boardReply where boardIdx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardReplyVO replyVo=new BoardReplyVO();
				
				replyVo.setIdx(rs.getInt("idx"));
				replyVo.setBoardIdx(idx);
				replyVo.setMid(rs.getString("mid"));
				replyVo.setNickName(rs.getString("nickName"));
				replyVo.setwDate(rs.getString("wDate"));
				replyVo.setHostIp(rs.getString("hostIp"));
				replyVo.setContent(rs.getString("content"));
				
				replyVos.add(replyVo);
			}
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return replyVos;
	}

//	댓글 삭제 처리
	
	public String setBoReplyDeleteOk(int idx) {
		String res="0";
		
		try {
			sql="delete from boardReply where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("SLQ 오류: "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	

}
