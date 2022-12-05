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

@WebServlet("/study/database/MemberMain")

public class MemberMain extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		JusorokDAO dao=new JusorokDAO();
		
		String mid=(String)session.getAttribute("sMid");
	
		JusorokVO vo=dao.getMemberSearch(mid);
		
		request.setAttribute("point",vo.getPoint());
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/study/221120_Database/member.jsp");
		dispatcher.forward(request, response);
	}
}
