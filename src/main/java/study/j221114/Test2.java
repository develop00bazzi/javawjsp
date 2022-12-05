package study.j221114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j221114_Test2")

public class Test2 extends HttpServlet {
	
//	doGet, doPost, service 순서의 우선 순위!
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	// 필수로 입력!
		response.setCharacterEncoding("UTF-8");	// 해도 되고 안해도 되고
		
//		NullPointException을 모면하는 방법 1. 단순 if문을 이용한 처리
		
//		String mid="";
//		
//		if(request.getParameter("mid")!=null) {
//			mid=request.getParameter("mid");
//		}
//		else {
//			String mid="";
//		}
		
		System.out.println("전송방식: "+request.getMethod());
		
//		NullPointException을 모면하는 방법 2. 삼항 연산자를 이용한 방법
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		String hostIp=request.getParameter("hostIp");

		
		PrintWriter out=response.getWriter();
		
		mid=mid.trim();
		pwd=pwd.trim();
		name=name.trim();
		
//		if(mid.equals("admin")&&pwd.equals("1234")) {
		if(mid.equals("admin")&&name.equals("배지훈")) {
			out.println("<script>");
			out.println("alert('관리자 인증 성공!!!');");
			out.println("location.href='"+request.getContextPath()+"/study/221114/test2Res.jsp?mid="+mid+"&name="+name+"&hostIp="+hostIp+"';");
//			URL 주소를 직접 적어주어서 test2Res에서는 GET 방식으로 정보를 전달 받음.
//			백에서 프론트로는 POST 방식으로 전달 불가능
//			주소에 변수와 값을 붙이려면 무조건 ? 붙임
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('관리자 인증 실패!!!');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
