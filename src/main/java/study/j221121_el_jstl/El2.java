package study.j221121_el_jstl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/j221121_el_jstl/El2")

public class El2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] hobbys=request.getParameterValues("hobby");
		
		request.setAttribute("hobbys", hobbys);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/study/221121_EL_JSTL/el2.jsp");
		dispatcher.forward(request, response);
	}

}
