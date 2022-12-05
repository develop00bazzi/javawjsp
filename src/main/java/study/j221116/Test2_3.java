package study.j221116;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j221116/Test2/3")

public class Test2_3 extends HttpServlet {
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
		String grade;
		
		switch (intAvg) {
			case 10:
			case 9:
				grade="A";
				break;
			case 8:
				grade="B";
				break;
			case 7:
				grade="C";
				break;
			case 6:
				grade="D";
				break;
			default:
				grade="F";
		}
		
//		VO에 값 저장하기
		
		Test2VO vo=new Test2VO(name,hakbun,kor,eng,mat,soc,sci,tot,avg,grade);
		
		System.out.println("vo: "+vo);
		
//		setter를 이용한 값의 저장
		
//		vo.setHakbun(hakbun);
//		vo.setName(name);
		
//		서버에서 get 방식으로의 전송 방법
		
//		response.sendRedirect(request.getContextPath()+"/study/221116/test2Ok3.jsp?hakbun="+hakbun+"&name="+name+"&kor="+kor+"&eng="+eng+"&mat="+mat+"&soc="+soc+"&sci="+sci+"&tot="+tot+"&avg="+avg+"&grade="+grade);
		response.sendRedirect(request.getContextPath()+"/study/221116/test2Ok3.jsp?vo="+vo);
	}
}
