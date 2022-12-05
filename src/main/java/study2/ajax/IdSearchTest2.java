package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/idSearchTest2")

public class IdSearchTest2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		MemberDAO dao=new MemberDAO();
		
		MemberVO vo=dao.getLoginCheck(mid);
		
//		PrintWriter out=response.getWriter(); 
		
		String name="";
		
		if(vo==null) {
			name="검색한 내용의 자료가 없습니다!";
		}
		else {
			name=vo.getName();
		}
		
		response.getWriter().write(name);
		
//		현재 창에다가 내용을 작성하겠다.
	}
}
