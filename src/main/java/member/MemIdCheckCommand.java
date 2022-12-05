package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		System.out.println(mid);
		
		MemberDAO dao=new MemberDAO();
		
		MemberVO vo=dao.getLoginCheck(mid);
		
		System.out.println(vo);
		
		if(vo==null) {	// 사용 가능한 아이디인 경우
			request.setAttribute("res", 1);
		}
		else {	// 사용 불가능한 아이디인 경우
			request.setAttribute("res", 0);
		}
		request.setAttribute("mid", mid);
	}

}
