package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mem")

public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command=null;
		String viewPage="/WEB-INF/member";
		
		String uri=request.getRequestURI();
		String com=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
////		세션이 끊겼다면 작업의 진행을 중지시키고 홈으로 전송시켜준다.
//		
//		HttpSession session=request.getSession();
//		
//		int level=session.getAttribute("sLevel")==null?99:(int)session.getAttribute("sLevel");
//		
//		if(level>=4) {
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/");
//			dispatcher.forward(request, response);
//		}
		
		if(com.equals("/memLogin")) {
			
			viewPage+="/memLogin.jsp";
		}
		else if(com.equals("/memLoginOk")) {
			command=new MemLoginOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memLogout")) {
			command=new MemLogoutCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memMain")) {
			command=new MemMainCommand();
			command.execute(request, response);
			viewPage+="/memMain.jsp";
		}
		else if(com.equals("/memIdCheck")) {
			command=new MemIdCheckCommand();
			command.execute(request, response);
			viewPage+="/memIdCheck.jsp";
		}
		else if(com.equals("/memNickCheck")) {
			command=new MemNickCheckCommand();
			command.execute(request, response);
			viewPage+="/memNickCheck.jsp";
		}
		else if(com.equals("/memJoin")) {
			
			viewPage+="/memJoin.jsp";
		}
		else if(com.equals("/memJoinOk")) {
			command=new MemJoinOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memList")) {
			command=new MemListCommand();
			command.execute(request, response);
			viewPage+="/memList.jsp";
		}
		else if(com.equals("/memInfor")) {
			command=new MemInforCommand();
			command.execute(request, response);
			viewPage+="/memInfor.jsp";
		}
		else if(com.equals("/memUpdatePwd")) {
			
			viewPage+="/memUpdatePwd.jsp";
		}
		else if(com.equals("/memUpdatePwdOk")) {
			command=new MemUpdatePwdOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memPwdCheck")) {
			
			viewPage+="/memPwdCheck.jsp";
		}
		else if(com.equals("/memPwdCheckOk")) {
			command=new MemPwdCheckOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memUpdate")) {
			command=new MemUpdateCommand();
			command.execute(request, response);
			viewPage+="/memUpdate.jsp";
		}
		else if(com.equals("/memUpdateOk")) {
			command=new MemUpdateOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memberSearch")) {
			command=new MemberSearchCommand();
			command.execute(request, response);
			viewPage+="/memList.jsp";
		}
		else if(com.equals("/memDeleteCheck")) {
			command=new MemdeleteCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memDelete")) {
			command=new MemdeleteCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memMidSearch")) {
//			command=new MemUpdateCommand();
//			command.execute(request, response);
			viewPage+="/memMidSearch.jsp";
		}
		else if(com.equals("/memMidSearchOk")) {
			command=new MemMidSearchOkCommand();
			command.execute(request, response);
			viewPage+="/memMidSearchOk.jsp";
		}
		else if(com.equals("/memPwdSearch")) {
//			command=new MemUpdateCommand();
//			command.execute(request, response);
			viewPage+="/memPwdSearch.jsp";
		}
		else if(com.equals("/memPwdSearchOk")) {
			command=new MemPwdSearchOkCommand();
			command.execute(request, response);
			viewPage="/include/message.jsp";
		}
		else if(com.equals("/memPwdSearchRes")) {
//			command=new MemPwdSearchOkCommand();
//			command.execute(request, response);
			viewPage+="/memPwdSearchOk.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
