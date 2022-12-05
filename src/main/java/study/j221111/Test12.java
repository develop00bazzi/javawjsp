package study.j221111;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Test12 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String[] hobbys=request.getParameterValues("hobby");
		
		System.out.println("성명: "+name);
		System.out.println("나이: "+age);
		System.out.println("성별: "+gender);
		
//		if(hobbys!=null) {
//			System.out.println("취미: ");
//			for(String hobby:hobbys) {
//				System.out.print(hobby+" / ");
//			}	
//		}
//		else {
//			System.out.println("취미가 선택되지 않았습니다.");
//		}
		
//		웹에 내용을 출력하기 위해서는 PrintWriter 객체를 통해서 처리한다.
		
		PrintWriter out=response.getWriter();
		
		out.println("안녕 이곳은 Servlet이야~<br/>");
		out.println("성명: "+name+"<br/>");
		out.println("나이: "+age+"<br/>");
		out.println("성별: "+gender+"<br/>");
		if(hobbys!=null) {
			out.println("취미: ");
			for(String hobby:hobbys) {
				out.print(hobby+" / ");
			}	
		}
		else {
//			out.println("취미가 선택되지 않았습니다.");
			out.println("<script>");
			out.println("alert('취미는 하나 이상 선택하셔야 합니다.')");
			out.println("location.href='/javawjsp/study/221111/test12.jsp';");	
//			location.href를 쓰면 뒤로갈때 입력했었던 값들이 모두 초기화 된다
//			out.println("history.back();");	// 뒤로가기 명령
			out.println("</script>");
		}
		
//		out.println("<p><a href='/javawjsp/study/221111/test12.jsp'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/221111/test12.jsp'>돌아가기</a></p>");
	}
}
