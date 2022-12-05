package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.JusorokDAO;
import study.database.JusorokVO;

public class GuInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		String email=request.getParameter("email")==null?"":request.getParameter("email");
		String homePage=request.getParameter("homePage")==null?"":request.getParameter("homePage");
		String content=request.getParameter("content")==null?"":request.getParameter("content");
		String hostIp=request.getParameter("hostIp")==null?"":request.getParameter("hostIp");
		
//		성명 텍스트 박스에 태그 사용 금지하기
		
		name=name.replace("<", "&lt");
		name=name.replace(">", "&gt");
		
		GuestVO vo=new GuestVO();
		GuestDAO dao=new GuestDAO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		int res=dao.setGuInput(vo);
		
		if(res==1) {
//			정상 처리
			request.setAttribute("msg", "guInputOk");
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		else {
//			비정상 처리
			request.setAttribute("msg", "guInputNo");
			request.setAttribute("url", request.getContextPath()+"/guInput.gu");
		}
		
	}

}
