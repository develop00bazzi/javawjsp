package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName=request.getParameter("nickName")==null?"":request.getParameter("nickName");
		
		
		MemberDAO dao=new MemberDAO();
		
		int res=dao.getNickNameCheck(nickName);
		
		if(res==0) {	// 사용 가능한 아이디인 경우
			request.setAttribute("res", 1);
		}
		else {	// 사용 불가능한 아이디인 경우
			request.setAttribute("res", 0);
		}
		request.setAttribute("nickName", nickName);

	}

}
