package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
import study2.ajax.UserDAO;
import study2.ajax.UserVO;

public class UserSearchCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		UserDAO dao=new UserDAO();
		
		UserVO vo=dao.getUserSearch(mid);
		
		int idx=0;
		String name="";
		String nickName="";
		int age=0;
		String address="";
		
		if(vo.getName()==null) {
			name="검색한 내용의 자료가 없습니다!";
		}
		else {
			idx=vo.getIdx();
			mid=vo.getMid();
			name=vo.getName();
			age=vo.getAge();
			address=vo.getAddress();
			
		}
		
		String str=idx+"/"+mid+"/"+name+"/"+age+"/"+address;
		
		response.getWriter().write(str);
		
//		현재 창에다가 내용을 작성하겠다.
	}

}
