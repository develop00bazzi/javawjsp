package pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsContentCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		int pag=request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
		
		int pageSize=request.getParameter("pageSize")==null?1:Integer.parseInt(request.getParameter("pageSize"));
		
		String flag=request.getParameter("flag")==null?"":request.getParameter("flag");
		
		String search=request.getParameter("search")==null?"":request.getParameter("search");
		String searchString=request.getParameter("searchString")==null?"":request.getParameter("searchString");
		
		String part=request.getParameter("part")==null?"":request.getParameter("part");
		
		PdsDAO dao=new PdsDAO();
		
		PdsVO vo=dao.getIdxSearch(idx);
		
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("part", part);

	}

}
