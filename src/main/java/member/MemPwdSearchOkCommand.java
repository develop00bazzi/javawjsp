package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemPwdSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		
		System.out.println(name);
		
		MemberDAO dao=new MemberDAO();
		
		int res=dao.getMemInfoCheck(mid,name);
		
		if(res!=1) {
			request.setAttribute("msg", "memberSearchNo");
			request.setAttribute("url", request.getContextPath()+"/memPwdSearch.mem");
		}
		else {
			String tempPassword = "";
			
			for(int i=0; i<8; i++) {
				int rndVal = (int)(Math.random() * 62);
				if(rndVal < 10) {
					tempPassword += rndVal;
				} else if(rndVal > 35) {
					tempPassword += (char)(rndVal + 61);
				} else {
					tempPassword += (char)(rndVal + 55);
				}
			}
			
			SecurityUtil security=new SecurityUtil();
			
			String imsiPwd=security.encryptSHA256(tempPassword);
			
			res=dao.setMemNewPwd(mid,name,imsiPwd);
			
			HttpSession session=request.getSession();
			
			if(res==1) {
				session.setAttribute("sTempPassword", tempPassword);
				session.setAttribute("sMid", mid);
				session.setAttribute("sName", name);
				
				request.setAttribute("msg", "memberPwdSetOk");
				request.setAttribute("url", request.getContextPath()+"/memPwdSearchRes.mem");
			}
			else {
				request.setAttribute("msg", "memberPwdSetNo");
				request.setAttribute("url", request.getContextPath()+"/memPwdSearch.mem");
			}
		}
		
		
		
		
		
		
		
	}

}
