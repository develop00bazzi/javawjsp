package study2.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1")

public class Test1Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Test1Okcontroller 서블릿");
//		RequestDispatcher dispatcher=request.getRequestDispatcher("WEB-INF\\study2\\mapping\\test1.jsp");
//		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");
		RequestDispatcher dispatcher=request.getRequestDispatcher("/mapping/Test1Ok");
		dispatcher.forward(request, response);
		System.out.println("돌아옴");
		
		
	}
}
