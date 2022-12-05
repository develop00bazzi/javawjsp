package study.storage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/storage/T2_LoginOk")

public class T2_LoginOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		PrintWriter out=response.getWriter();
		
		if((mid.equals("admin")&&pwd.equals("1234")) || (mid.equals("hkd1234")&&pwd.equals("1234"))) {
			Cookie cookie = new Cookie("cMid", mid);
			cookie.setPath("/");	// 웹 애플리케이션의 모든 URL에서 전송 가능하도록 설정
			cookie.setMaxAge(5*60);		// 쿠키의 만료시간을 5분으로 설정.
			response.addCookie(cookie);
			
			HttpSession session=request.getSession();
			
//			서블릿에 세션 등록하는 작업.. 서비스 객체 가져오기..
			
			session.setAttribute("sMid",mid);
			
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되었습니다.');");		
			out.println("location.href='"+request.getContextPath()+"/study/221118_storage_server/t2_LoginMember.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('아이디 혹은 비밀번호가 틀렸습니다.');");		
			out.println("history.back();");
			out.println("</script>");
		}
		
	}

}
