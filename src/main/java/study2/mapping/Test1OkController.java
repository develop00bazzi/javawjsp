package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1Ok")

public class Test1OkController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Test1controller 서블릿");
//		RequestDispatcher dispatcher=request.getRequestDispatcher("WEB-INF\\study2\\mapping\\test1.jsp");
//		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");
		
		Test2Ok t2Ok=new Test2Ok();
		t2Ok.Message();
		
		Test2OkOk t2OkOk=new Test2OkOk();
		t2OkOk.Message();
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");
		dispatcher.forward(request, response);
	}
}
