package board;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

public class BoGoodCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		String res="0";
		
		HttpSession session=request.getSession();
		
		ServletContext pageContext=request.getServletContext();
	
		BoardVO vo=new BoardVO();
		
		BoardDAO dao=new BoardDAO();
		
		String colorIdx="color"+idx;

		if(session.getAttribute("sGoodCnt"+idx)==null) {
        	session.setAttribute("sGoodCnt"+idx,1);
			session.setAttribute(colorIdx, "red"+idx);   
			session.setAttribute("color", "red"+idx);
//        	vo.setGoodColor("red");
        	dao.setBoGood(idx);
        	res="1";
        }
		
		else {
			session.setAttribute(colorIdx, "black"+idx);
			session.setAttribute("color", "black"+idx);
//			vo.setGoodColor("black");
			dao.setBoGoodMinus(idx);
			res="0";
			session.removeAttribute("sGoodCnt"+idx);
		}
		
		response.getWriter().write(res);
		
		
		
	}

}
