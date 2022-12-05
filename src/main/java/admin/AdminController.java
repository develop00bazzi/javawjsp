package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemInforCommand;
import member.MemListCommand;

@WebServlet("*.ad")

public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command=null;
		String viewPage="/WEB-INF/admin";
		
		String uri=request.getRequestURI();
		String com=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
//		세션이 끊겼다면 작업의 진행을 중지시키고 홈으로 전송시켜준다.
		
		HttpSession session=request.getSession();
		
		int level=session.getAttribute("sLevel")==null?99:(int)session.getAttribute("sLevel");
		
		if(level>=4) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		
		if(com.equals("/adMain")) {
			viewPage+="/adMain.jsp";
		}
		else if(com.equals("/adLeft")) {
			viewPage+="/adLeft.jsp";
		}
		else if(com.equals("/adContent")) {
			command=new AdContentCommand();
			command.execute(request, response);
			viewPage+="/adContent.jsp";
		}
		else if(com.equals("/adMemList")) {
			command=new AdMemListCommand();
			command.execute(request, response);
			viewPage+="/member/adMemList.jsp";
		}
		else if(com.equals("/adMemSearch")) {
			command=new AdMemSearchCommand();
			command.execute(request, response);
			viewPage+="/member/adMemList.jsp";
		}
		else if(com.equals("/adMemInfor")) {
			command=new MemInforCommand();
			command.execute(request, response);
			viewPage+="/member/adMemInfor.jsp";
		}
		else if(com.equals("/adMemberLevel")) {
			command=new AdMemberLevelCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/adMemberDel")) {
			command=new AdMemberDelCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/adMemDelList")) {
			command=new AdMemListDelCommand();
			command.execute(request, response);
			viewPage+="/member/adMemDelList.jsp";
		}
		
//		else if(com.equals("/memUpdateOk")) {
//			command=new MemUpdateOkCommand();
//			command.execute(request, response);
//			viewPage="/include/message.jsp";
//		}
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
