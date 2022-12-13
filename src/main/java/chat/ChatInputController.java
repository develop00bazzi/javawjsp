package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatInput")

public class ChatInputController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String nickName=URLDecoder.decode(request.getParameter("nickName"),"UTF-8");
		String content=URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String avatar=request.getParameter("avatar");
//		앞에서 인코딩을 해서 자료를 넘겼기 때문에 한번 다시 디코딩을 해주어야 한다.
		
		if(nickName==null || nickName.equals("")||content==null||content.equals("")) {
			response.getWriter().write("");
		}
		else {
			response.getWriter().write(new ChatDAO().setChatInput(nickName,content,avatar));
		}
	}
}
