package study2.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/mapping/Test3")
@WebServlet("*.do")

public class Test3Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		StringBuffer url=request.getRequestURL();
		System.out.println("URL: "+url);
		
		String uri=request.getRequestURI();
		System.out.println("URI: "+uri);
		
		String com=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		System.out.println("com: "+com);
		
//		입력한 주소 중에 필요한 부분만 뽑아내기
		
		String viewPage="/WEB-INF/study2/mapping";
		
		if(com.equals("/Test3_1")) {
			viewPage+="/test3_1.jsp";
		}
		else if(com.equals("/Test3_2")) {
			viewPage+="/test3_2.jsp";
		}
		else if(com.equals("/Test3_3")) {
			viewPage+="/test3_3.jsp";
		}
		else if(com.equals("/Test4")) {
			viewPage+="/test4.jsp";
		}
		else if(com.equals("/Test4Ok")) {
			int su1=request.getParameter("su1")==null?0:Integer.parseInt(request.getParameter("su1"));
			int su2=request.getParameter("su2")==null?0:Integer.parseInt(request.getParameter("su2"));
			String opt=request.getParameter("opt")==null? "" :request.getParameter("opt");
			Test4Calc t4=new Test4Calc();
			int res=t4.getCalc(su1,su2,opt);
			request.setAttribute("su1", su1);
			request.setAttribute("su2", su2);
			request.setAttribute("opt", opt);
			request.setAttribute("res", res);
			viewPage+="/test4Ok.jsp";
		}
		else {
//			out.println("<script>");
//			out.println("alert('잘못된 경로로 진입하였습니다.');");
//			out.println("location.href='"+request.getContextPath()+"/mapping/Test3';");
//			out.println("</script>");
//			두 가지 전송 방식을 동시에 사용할 수 없기 때문에 location.href 사용 불가능
			viewPage+="/test3.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
		
	}
}
