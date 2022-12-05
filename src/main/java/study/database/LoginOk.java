package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/database/LoginOk")

public class LoginOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		
		JusorokDAO dao=new JusorokDAO();
		
		JusorokVO vo=dao.loginCheck(mid,pwd);
		
		if(vo.getName()!=null) {
			
//			회원 인증 후 처리 
			
//			1. 자주 사용하는 자료들을 세션에 담는다. 
//			2. 방문 포인트를 10점 씩 부가한다. (단, 1일 방문 포인트는 50점까지만 허용) - 과제 처리
//			3. 최종 방문 날짜를 현재 날짜 시간으로 변경한다.
			
//			1. 세션 처리
			
			session.setAttribute("sMid",mid);
			session.setAttribute("sName",vo.getName());
			session.setAttribute("sLastDate",vo.getLastDate().substring(0,19));
			
//			2. 방문 포인트 증가하기 (10점씩, 1일 최대 50점), 3. 최종 방문 일자 업데이트
			
			int visitPoint=vo.getPoint()+10;
			dao.setVisitUpdate(visitPoint,mid);
			
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 반갑습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/database/MemberMain';");
			out.println("</script>");
			
//			response.sendRedirect(request.getContextPath()+"/study/database/MemberMain");
			
		}
		else {
			
//			회원 인증 실패시 처리
			
			out.println("<script>");
			out.println("alert('로그인에 실패하였습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/221120_Database/login.jsp';");
			out.println("</script>");
		}
		
	}

}
