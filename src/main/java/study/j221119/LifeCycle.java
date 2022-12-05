package study.j221119;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j221119/LifeCycle")

public class LifeCycle extends HttpServlet {
	@Override
	public void init() throws ServletException {
		System.out.println("==== 이곳은 init() 메소드입니다. ====");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("==== 이곳은 service() 메소드입니다. ====");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		System.out.println("1. title: "+title);
		System.out.println("1. content: "+content);
		
//		forward 를 이용한 전송
		
		request.setAttribute("title",title);
		request.setAttribute("content",content);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/study/221119_LifeCycle/test1Res.jsp");
		
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("==== 이곳은 doPost() 메소드입니다. ====");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		System.out.println("2. title: "+title);
		System.out.println("2. content: "+content);
		
//		Get 방식으로의 전송
		
		response.sendRedirect(request.getContextPath()+"/study/221119_LifeCycle/test1Res2.jsp?title="+title+"&content="+content);
		
	}
	
	@Override
	public void destroy() {
		System.out.println("==== 이곳은 destroy() 메소드입니다. !!! ====");
	}
	
	
}
