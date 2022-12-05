package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoDeleteOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String sMid=(String)session.getAttribute("sMid");
		String mid=(String)session.getAttribute("mid");
		int sLevel=(int)session.getAttribute("sLevel");
		
		String search=request.getParameter("search")==null?"":request.getParameter("search");
		String searchString=request.getParameter("searchString")==null?"":request.getParameter("searchString");
		String flag=request.getParameter("flag")==null?"list":request.getParameter("flag");
		
		if(sLevel!= 0) {
			if(!sMid.equals(mid)) {
				request.setAttribute("msg", "userCheckNo");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}			
		}
		
		int idx=request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		int pag=request.getParameter("pag")==null?0:Integer.parseInt(request.getParameter("pag"));
		int pageSize=request.getParameter("pageSize")==null?0:Integer.parseInt(request.getParameter("pageSize"));
		
		BoardDAO dao=new BoardDAO();
		
		ArrayList<BoardReplyVO> vos=dao.getBoReply(idx);
		
		System.out.println("vos" +vos);
		
		
		if(vos.isEmpty()) {
			
			int res=dao.setBoDeleteOK(idx);
			
			if(res==1) {
				request.setAttribute("msg", "boDeleteOk");
				request.setAttribute("url", request.getContextPath()+"/boList.bo?pag="+pag+"&pageSize"+pageSize+"&flag="+flag+"&search="+search+"&searchString="+searchString);
			}
			else {
				request.setAttribute("msg", "boDeleteNo");
				request.setAttribute("url", request.getContextPath()+"/boContent.bo?idx="+idx+"&pag="+pag+"&pageSize"+pageSize+"&flag="+flag+"&search="+search+"&searchString="+searchString);
			}
		}
		else {
			request.setAttribute("msg", "boReplyNotNull");
			request.setAttribute("url", request.getContextPath()+"/boContent.bo?idx="+idx+"&pag="+pag+"&pageSize"+pageSize+"&flag="+flag+"&search="+search+"&searchString="+searchString);
		}
		
	}

}
