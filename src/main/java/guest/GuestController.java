package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.gu")

public class GuestController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GuestInterface command=null;
		
		String viewPage="/WEB-INF/guest";
		
		String uri=request.getRequestURI();
		String com=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/guList")) {
			command=new GuListCommand();
			command.execute(request, response);
			viewPage+="/guList.jsp";
		}
		else if(com.equals("/guInput")) {
//			글 작성 전에 선처리가 없으므로 커맨드 객체가 따로 필요 X
			viewPage+="/guInput.jsp";
		}
		else if(com.equals("/guInputOk")) {
			command=new GuInputOkCommand();
			command.execute(request, response);
//			자료를 DB에 올리고 리스트를 다시 조회하려면 guList라는 컨트롤러를 다시 거쳤다가 가야 전제 조회가 되는 점을 인지해야 한다.
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/adminLogin")) {
//			글 작성 전에 선처리가 없으므로 커맨드 객체가 따로 필요 X
			viewPage+="/adminLogin.jsp";
		}
		else if(com.equals("/adminLoginOk")) {
			command=new AdminLoginOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/adminLogout")) {
			command=new AdminLogoutOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/guDelete")) {
			command=new GuDeleteCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
}
