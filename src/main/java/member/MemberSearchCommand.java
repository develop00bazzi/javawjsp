package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberSearchCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		int level=(int)session.getAttribute("sLevel");
		
		MemberDAO dao=new MemberDAO();
		
		ArrayList<MemberVO> vos=dao.getMemberSearch(mid,level);
		
		request.setAttribute("vos", vos);
	}

}
