package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String search=request.getParameter("search")==null?"":request.getParameter("search");
//		String searchString=request.getParameter("searchString")==null?"":request.getParameter("searchString");
//		
//		int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
//		int pageSize=request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));
//		
////		게시글의 전체 내용을 가져온다.
//		
//		BoardDAO dao=new BoardDAO();
//		
//		ArrayList<BoardVO> vos=dao.getBoContentSearch(search,searchString);
//		
//		String searchTitle="";
//		
//		if(search.equals("title")) searchTitle="글 제목";
//		else if(search.equals("nickName")) searchTitle="글쓴이";
//		else searchTitle="글 내용";
//		
//		request.setAttribute("vos", vos);
//		request.setAttribute("search", search);
//		request.setAttribute("searchTitle", searchTitle);
//		request.setAttribute("searchString", searchString);
//		request.setAttribute("searchCount", vos.size());
//		
//		request.setAttribute("pageSize", pageSize);
//		request.setAttribute("pag", pag);
		

////		1. 페이지(pag)를 결정. 
//		int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
//		
////		2. 한 페이지에 보여줄 분량을 결정한다.
//		
//		int pageSize=request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));
//		
//		System.out.println("pageSize: "+pageSize);
//		
////		3. 총 레코드 건수를 구한다.
//		int totRecCnt=dao.totRecCnt();	// 검색 조건에 맞는 총 건수를 가져와야 한다.
//		
////		4. 총 페이지 건수를 구한다.
//		int totPage=(totRecCnt%pageSize)==0? totRecCnt/pageSize: (totRecCnt/pageSize)+1;
//		
////		5. 현재 페이지의 시작 인덱스 번호를 구한다.
//		int startIndexNo=(pag-1)*pageSize;
//		
////		6. 현재 화면에 보여주는 시작 번호를 구한다.
//		int curScrStartNo=totRecCnt-startIndexNo;
//	
////		블록 페이징 처리 (3단계) => 블록의 시작 번호는 0번으로 한다.
//		
////		1.블록의 크기를 결정한다. (여기서는 3으로 지정)
//		int blockSize=3;
//		
////		2. 현재 페이지가 위치하고 있는 블록 번호를 구한다. (예:1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록)
////		int curBlock=(pag%blockSize)==0?(pag/blockSize)-1:(pag/blockSize);
//		int curBlock=(pag-1)/blockSize;
//		
////		3. 마지막 블록을 구한다.
////		int lastBlock=(totPage%blockSize)==0?(totPage/blockSize)-1:(totPage/blockSize);
//		int lastBlock=(totPage-1)/blockSize;
//		
////		ArrayList<GuestVO> vos=dao.getGuestList();
//		ArrayList<BoardVO> vos=dao.getBoList(startIndexNo,pageSize);	// 하나의 메소드를 이용하여 관리자와 일반회원의 조회를 한번에 처리
//		
////		검색 조건에 맞는 어레이 리스트를 가져와야 한다.

		
//		request.setAttribute("vos", vos);
//		request.setAttribute("pageSize", pageSize);
//		request.setAttribute("pag", pag);
//		request.setAttribute("totPage", totPage);
//		request.setAttribute("curScrStartNo", curScrStartNo);
//		request.setAttribute("blockSize", blockSize);
//		request.setAttribute("curBlock", curBlock);
//		request.setAttribute("lastBlock", lastBlock);
		
	}

}
