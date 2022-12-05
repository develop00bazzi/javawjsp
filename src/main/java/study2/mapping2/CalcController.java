package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.calc")

public class CalcController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MappingInterface command=null;
		
//		우리가 사용할 가상의 MappingInterface라는 인터페이스를 생성해서 불러온다.
//		공통 메소드를 사용하기 위해 인터페이스를 만들어서 사용한다!!!
		
		String uri=request.getRequestURI();
		String com=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		String viewPage="/WEB-INF/study2/mapping2";
		
		if(com.equals("/Calc")) {
			viewPage+="/calc.jsp";
		}
		else if(com.equals("/CalcOk")) {
			command=new CalcOkCommand();
//			위에서 만든 인터페이스를 자동으로 implement 걸고 커맨드에서 하고 싶은 기능을 모두 구현한다.
			command.execute(request, response);
			viewPage+="/calcOk.jsp";
		}
		else if(com.equals("/JuList")) {
			command=new JuListCommand();
			command.execute(request, response);
			viewPage+="/juList.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
