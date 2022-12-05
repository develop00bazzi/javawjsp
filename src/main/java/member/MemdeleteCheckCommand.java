package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemdeleteCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		MemberDAO dao=new MemberDAO();
		
		SecurityUtil security=new SecurityUtil();
		
		pwd=security.encryptSHA256(pwd);
		
		String userPwd=dao.getCheckPwd(mid);
		
		String res="0";
		
		if(userPwd.equals(pwd)) {
			res="1";
		}
		
		response.getWriter().write(res);
		
	}

}
