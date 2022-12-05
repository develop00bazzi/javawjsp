package study.j221114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/j221114_Test4","/j221114_T4"})

// 컨트롤러 2개 이상 제어 가능.

public class Test4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		service 객체를 사용했기 때문에 전송방식 두개 다 사용 가능.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		
		PrintWriter out=response.getWriter();
		
		out.println("서블릿에서 View로 출력하기<br/>");
		out.println("hidden으로 전송된 name "+name);
		out.println("<p><a href='"+request.getContextPath()+"/study/221114/test4.jsp'>돌아가기</a></p>");
		out.println("<p><input type='button' value='돌아가기' onclick='location.href=\""+request.getContextPath()+"/study/221114/test4.jsp\"'>돌아가기</a></p>");
//		파일명 구분하는 역슬래시 붙이면 따옴표 부담없이 사용 가능..
	}
}
