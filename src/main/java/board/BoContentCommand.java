package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String res="0";
		
		HttpSession session=request.getSession();
		
		int idx=request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
		
		int pageSize=request.getParameter("pageSize")==null?1:Integer.parseInt(request.getParameter("pageSize"));
		
		String flag=request.getParameter("flag")==null?"":request.getParameter("flag");
		
		String search=request.getParameter("search")==null?"":request.getParameter("search");
		String searchString=request.getParameter("searchString")==null?"":request.getParameter("searchString");
		
		BoardDAO dao=new BoardDAO();
		
//		session.setAttribute("conIdx", idx);
        
//        if(session.getAttribute("sViewCnt"+idx)==null) {
//        	session.setAttribute("sViewCnt"+idx,1);
//            dao.setReadNumPlus(idx);
//        }
		
		// 조회수 증가하기
		// dao.setReadNumPlus(idx);
		
		// 글 조회수 1회 증가시키기.(조회수 중복방지처리 - 세션 사용 : 'board+고유번호'를 객체배열에 추가시킨다.)
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
		}
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumPlus(idx);
			contentIdx.add(imsiContentIdx);
		}
		
		session.setAttribute("sContentIdx", contentIdx);
		
		BoardVO	vo=dao.getBoContentSearch(idx);
		
//		이전 글과 다음 글의 idx와 제목을 담아서 넘겨준다.
		
		BoardVO prevVO=dao.getPrevNextSearch("prev",idx);
		BoardVO nextVO=dao.getPrevNextSearch("next",idx);
		
		request.setAttribute("prevVO", prevVO);
		request.setAttribute("nextVO", nextVO);
		
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		
//		입력된 댓글 가져오기
		
		ArrayList<BoardReplyVO> replyVos=dao.getBoReply(idx);
		
		request.setAttribute("replyVos", replyVos);
		
		
	}

}
