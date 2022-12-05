package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/database/JoinOK")

public class JoinOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		JusorokDAO dao=new JusorokDAO();
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		
		JusorokVO vo=new JusorokVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
//		아이디 중복 체크
		
//		중복 체크 후 정상 자료일 경우 DB에 저장 처리
		
		int res=dao.setJoinOk(vo);
		
		if(res==1) {
			
//			정상인 경우
			
			out.println( "<script>"
						+"alert('"+name+"님 회원가입을 환영합니다.');"
						+"location.href='"+request.getContextPath()+"/study/221120_Database/login.jsp';"
						+"</script>");
		}
		else {
			
//			비정상인 경우
			
			out.println("<script>");
			out.println("alert('회원가입에 실패하였습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/221120_Database/join.jsp';");
			out.println("</script>");
		}
	}

}
