package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/database/SearchMid")

public class SearchMid extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		JusorokDAO dao=new JusorokDAO();
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		JusorokVO vo=dao.getMemberSearch(mid);
		
		if(vo.getName()!=null) {
			
			request.setAttribute("vo", vo);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/study/221120_Database/memberSearch.jsp");
			
			dispatcher.forward(request, response);
			
		}
		else {
			out.println("<script>");
			out.println("alert('회원 자료 조회에 실패하였습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/221120_Database/member.jsp';");
			out.println("</script>");
		}
		
	}
}
