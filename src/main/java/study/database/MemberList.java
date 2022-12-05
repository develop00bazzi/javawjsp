package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/database/MemberList")

public class MemberList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		JusorokDAO dao=new JusorokDAO();
		JusorokVO vo=new JusorokVO();
		
		ArrayList<JusorokVO> vos=dao.getMemberList();
		
		request.setAttribute("vos", vos);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/study/221120_Database/memberList.jsp");
		
		dispatcher.forward(request, response);
	}

}
