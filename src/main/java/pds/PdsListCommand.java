package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class PdsListCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String part=request.getParameter("part")==null?"전체":request.getParameter("part");
		
		String flag=request.getParameter("flag")==null?"list":request.getParameter("flag");
				
		PdsDAO dao=new PdsDAO();
		
		if(flag.equals("list")) {
			
//		1. 페이지(pag)를 결정. 
			int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
			
//		2. 한 페이지에 보여줄 분량을 결정한다.
			
			int pageSize=request.getParameter("pageSize")==null?10:Integer.parseInt(request.getParameter("pageSize"));
			
//		System.out.println("pageSize: "+pageSize);
			
//		3. 총 레코드 건수를 구한다.
			int totRecCnt=dao.totRecCnt(part);
			
//		4. 총 페이지 건수를 구한다.
			int totPage=(totRecCnt%pageSize)==0? totRecCnt/pageSize: (totRecCnt/pageSize)+1;
			
//		5. 현재 페이지의 시작 인덱스 번호를 구한다.
			int startIndexNo=(pag-1)*pageSize;
			
//		6. 현재 화면에 보여주는 시작 번호를 구한다.
			int curScrStartNo=totRecCnt-startIndexNo;
			
//		블록 페이징 처리 (3단계) => 블록의 시작 번호는 0번으로 한다.
			
//		1.블록의 크기를 결정한다. (여기서는 3으로 지정)
			int blockSize=3;
			
//		2. 현재 페이지가 위치하고 있는 블록 번호를 구한다. (예:1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록)
//		int curBlock=(pag%blockSize)==0?(pag/blockSize)-1:(pag/blockSize);
			int curBlock=(pag-1)/blockSize;
			
//		3. 마지막 블록을 구한다.
//		int lastBlock=(totPage%blockSize)==0?(totPage/blockSize)-1:(totPage/blockSize);
			int lastBlock=(totPage-1)/blockSize;
			
//		ArrayList<GuestVO> vos=dao.getGuestList();
			ArrayList<PdsVO> vos=dao.getPdsList(startIndexNo,pageSize,part);	
			request.setAttribute("vos", vos);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pag", pag);
			request.setAttribute("totPage", totPage);
			request.setAttribute("curScrStartNo", curScrStartNo);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("lastBlock", lastBlock);
			request.setAttribute("flag",flag);
			
			
//			request.setAttribute("search",search);
//			request.setAttribute("searchString", searchString);

			request.setAttribute("part", part);

		}
//		else if(flag.equals("search")){
//			
//			String search=request.getParameter("search")==null?"":request.getParameter("search");
//			String searchString=request.getParameter("searchString")==null?"":request.getParameter("searchString");
//			
////			1. 페이지(pag)를 결정. 
//				int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
//				
////			2. 한 페이지에 보여줄 분량을 결정한다.
//				
//				int pageSize=request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));
//				
////			System.out.println("pageSize: "+pageSize);
//				
////			3. 총 레코드 건수를 구한다.
//				int totRecCnt=dao.searchTotRecCnt(search,searchString);
//				
////			4. 총 페이지 건수를 구한다.
//				int totPage=(totRecCnt%pageSize)==0? totRecCnt/pageSize: (totRecCnt/pageSize)+1;
//				
////			5. 현재 페이지의 시작 인덱스 번호를 구한다.
//				int startIndexNo=(pag-1)*pageSize;
//				
////			6. 현재 화면에 보여주는 시작 번호를 구한다.
//				int curScrStartNo=totRecCnt-startIndexNo;
//				
////			블록 페이징 처리 (3단계) => 블록의 시작 번호는 0번으로 한다.
//				
////			1.블록의 크기를 결정한다. (여기서는 3으로 지정)
//				int blockSize=3;
//				
////			2. 현재 페이지가 위치하고 있는 블록 번호를 구한다. (예:1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록)
////			int curBlock=(pag%blockSize)==0?(pag/blockSize)-1:(pag/blockSize);
//				int curBlock=(pag-1)/blockSize;
//				
////			3. 마지막 블록을 구한다.
////			int lastBlock=(totPage%blockSize)==0?(totPage/blockSize)-1:(totPage/blockSize);
//				int lastBlock=(totPage-1)/blockSize;
//				
////			ArrayList<GuestVO> vos=dao.getGuestList();
//				ArrayList<BoardVO> vos=dao.getBoContentSearch(startIndexNo,pageSize,search,searchString);
//				request.setAttribute("vos", vos);
//				request.setAttribute("pageSize", pageSize);
//				request.setAttribute("pag", pag);
//				request.setAttribute("totPage", totPage);
//				request.setAttribute("curScrStartNo", curScrStartNo);
//				request.setAttribute("blockSize", blockSize);
//				request.setAttribute("curBlock", curBlock);
//				request.setAttribute("lastBlock", lastBlock);
//				request.setAttribute("flag",flag);
//				request.setAttribute("search",search);
//				request.setAttribute("searchString", searchString);
//
//		}
		
		
		
	}

}
