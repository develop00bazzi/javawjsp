package study.j221116;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j221116/Test2/1")

public class Test2_1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		String hakbun=request.getParameter("hakbun")==null?"":request.getParameter("hakbun");
		int kor=request.getParameter("kor")==null?0:Integer.parseInt(request.getParameter("kor"));
		int eng=request.getParameter("eng")==null?0:Integer.parseInt(request.getParameter("eng"));
		int mat=request.getParameter("mat")==null?0:Integer.parseInt(request.getParameter("mat"));
		int soc=request.getParameter("soc")==null?0:Integer.parseInt(request.getParameter("soc"));
		int sci=request.getParameter("sci")==null?0:Integer.parseInt(request.getParameter("sci"));
		
		int tot=kor+eng+mat+soc+sci;
		double avg=tot/5.0;
		
		int intAvg=(int)(avg/10.0);
		char grade;
		
		switch (intAvg) {
			case 10:
			case 9:
				grade='A';
				break;
			case 8:
				grade='B';
				break;
			case 7:
				grade='C';
				break;
			case 6:
				grade='D';
				break;
			default:
				grade='F';
		}
		
//		아래는 브라우저에 처리 결과를 출력하는 작업.
		
		PrintWriter out=response.getWriter();
		
		out.println("<h2>성적 확인</h2>");
		out.println("학번:"+hakbun+"<br/>");
		out.println("성명:"+name+"<br/>");
		out.println("국어:"+kor+"<br/>");
		out.println("영어:"+eng+"<br/>");
		out.println("수학:"+mat+"<br/>");
		out.println("사회:"+soc+"<br/>");
		out.println("과학:"+sci+"<br/>");
		out.println("총점:"+tot+"<br/>");
		out.println("평균:"+avg+"<br/>");
		out.println("학점:"+grade+"<br/>");
		out.println("<hr/>");
		out.println("<p><a href='"+request.getContextPath()+"/study/221116/test2.jsp'>돌아가기</a></p>");
	}
}
