package chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/chatList")

public class ChatListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		나중에 프로젝트에 가져가라고 따로 인코딩 처리 해주심.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		location.href, request 방식 사용하면 채팅시에 화면 떨림 생겨서 ajax 사용
		
		String listType=request.getParameter("listType");
		
		if(listType==null || listType.equals("")) {
			response.getWriter().write("");
		}
		else if(listType.equals("ten")) {
			response.getWriter().write(getTen());
		}
		
		else { 
			response.getWriter().write(getListIdx(listType)); 
		}
		 
		
		

	}
	

//	두번째 이후부터 메세지 내용을 출력처리
	
	private String getListIdx(String idx) {
		ChatDAO dao=new ChatDAO();
		
		ArrayList<ChatVO> vos=dao.getChatList(Integer.parseInt(idx));	// 마지막 자료를 기준으로 처리한다.
		
		ChatVO vo=new ChatVO();
		
		StringBuffer res=new StringBuffer();
		
		res.append("{\"res\":[");
		for(int i=0; i<vos.size(); i++) {
			vo=vos.get(i);
			res.append("[{\"value\":\""+vo.getIdx()+"\"},");
			res.append("{\"value\":\""+vo.getNickName()+"\"},");
			res.append("{\"value\":\""+vo.getContent()+"\"},");
			res.append("{\"value\":\""+vo.getcDate()+"\"},");
			res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
			if(i!=(vos.size()-1)) res.append(",");
		}
		res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		
		return res.toString();
	}

//	최초 접속시 최근 10개의 메세지만 보여주기 위한 처리
	
	private String getTen() {
		
		ChatDAO dao=new ChatDAO();
		
		ArrayList<ChatVO> vos=dao.getChatList(10);	// 최소 10개의 메세지 가져오기
		
		ChatVO vo=new ChatVO();
		
		StringBuffer res=new StringBuffer();
		
		res.append("{\"res\":[");
		for(int i=0; i<vos.size(); i++) {
			vo=vos.get(i);
			res.append("[{\"value\":\""+vo.getIdx()+"\"},");
			res.append("{\"value\":\""+vo.getNickName()+"\"},");
			res.append("{\"value\":\""+vo.getContent()+"\"},");
			res.append("{\"value\":\""+vo.getcDate()+"\"},");
			res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
			if(i!=(vos.size()-1)) res.append(",");
		}
		res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		
		return res.toString();
	}
}
