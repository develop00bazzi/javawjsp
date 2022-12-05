package study.j221111;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/test10Ok")

public class Test10Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
//		한글 깨짐 방지 설정
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명: "+name);
		System.out.println("나이: "+age);
	}
}
