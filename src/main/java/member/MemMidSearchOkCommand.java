package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemMidSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email")==null?"":request.getParameter("email");
		
		MemberDAO dao=new MemberDAO();
		
		ArrayList<MemberVO> vos=new ArrayList<>();
		
		vos=dao.getMemMidSearch(email);
		
		request.setAttribute("vos",vos);
	}

}
