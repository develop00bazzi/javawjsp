package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemListCommand2 implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		int level=(int)session.getAttribute("sLevel");
		
		MemberDAO dao=new MemberDAO();
		
		/* ArrayList<MemberVO> vos=dao.getMemList(level,startIndexNo,pageSize); */	// 하나의 메소드를 이용하여 관리자와 일반회원의 조회를 한번에 처리
		/* request.setAttribute("vos", vos); */
	}

}
